require 'spec_helper'
require_relative '../../../../apps/admin/views/moments/new'

describe Admin::Views::Moments::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/moments/new.html.erb') }
  let(:view)      { Admin::Views::Moments::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end