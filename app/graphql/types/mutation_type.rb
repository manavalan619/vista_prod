Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :staffLogin, function: Resolvers::StaffLogin.new
  field :createInteraction, function: Resolvers::CreateInteractionResolver.new
end
