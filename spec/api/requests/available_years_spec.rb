require 'spec_helper'
require 'hanami_request_test'

RSpec.describe 'API available_years', type: :request do
  include HanamiRequestTest

  after { database_clean }

  subject { last_json_response[:data] }
  let(:endpoint) { '/api' }

  it 'returns HTTP 200' do
    post endpoint
    expect(last_response.ok?).to be_truthy
  end

  context 'when no params are given' do
    context 'when there are no moments' do
      before { post endpoint, query: '{ available_years { year formatted } }' }

      it "returns an empty 'available_years' list" do
        expect(subject[:available_years]).to eq []
      end
    end

    context 'when there are some moments' do
      before do
        create :moment, year_begin: 2000, year_end: 2002
        create :moment, year_begin: 2005, year_end: 2006

        post endpoint, query: '{ available_years { year formatted } }'
      end

      it 'returns a distinct list of all years from the earliest moment to the latter one' do
        expect(subject[:available_years][0][:year]).to eq 2000
        expect(subject[:available_years][1][:year]).to eq 2001
        expect(subject[:available_years][2][:year]).to eq 2002
        expect(subject[:available_years][3][:year]).to eq 2003
        expect(subject[:available_years][4][:year]).to eq 2004
        expect(subject[:available_years][5][:year]).to eq 2005
        expect(subject[:available_years][6][:year]).to eq 2006
      end

      it 'returns a distinct formatted list (with AD and DC) of all years from the earliest moment to the latter one' do
        expect(subject[:available_years][0][:formatted]).to eq '2000 AD'
        expect(subject[:available_years][1][:formatted]).to eq '2001 AD'
        expect(subject[:available_years][2][:formatted]).to eq '2002 AD'
        expect(subject[:available_years][3][:formatted]).to eq '2003 AD'
        expect(subject[:available_years][4][:formatted]).to eq '2004 AD'
        expect(subject[:available_years][5][:formatted]).to eq '2005 AD'
        expect(subject[:available_years][6][:formatted]).to eq '2006 AD'
      end
    end
  end

  context 'when influencer_id and influencer_type are given' do
    let(:influencer) { create :person }

    before do
      create :moment, year_begin: 2000, year_end: 2002, person_id: influencer.id
      create :moment, year_begin: 2003, year_end: 2004, person_id: influencer.id
      create :moment, year_begin: 2005, year_end: 2007
      post endpoint,
           query: "{ available_years(influencer_id: #{influencer.id}, influencer_type: \"#{influencer.type}\") " \
                  '{ year formatted } }'
    end

    it 'returns only available years for the related influencer' do
      expect(subject[:available_years].count).to eq 5
      expect(subject[:available_years].first[:year]).to eq 2000
      expect(subject[:available_years].last[:year]).to eq 2004
    end
  end
end
