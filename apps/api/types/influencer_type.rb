module Types
  InfluencerType = GraphQL::ObjectType.define do
    name 'Influencer'
    description 'An influencer'

    field :id, !types.Int
    field :name, !types.String
    field :gender, !types.String
    field :kind, !types.String do
      resolve ->(obj, args, ctx) { obj.type }
    end
  end
end
