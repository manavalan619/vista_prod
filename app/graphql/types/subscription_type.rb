# class Types::SubscriptionType < GraphQL::Schema::Object
Types::SubscriptionType = GraphQL::ObjectType.define do
  name 'Subscription'

  field :shareChanged do
    type Types::ShareType
    description 'A user shared/revoked their profile'
    subscription_scope :current_branch_id
  end
end
