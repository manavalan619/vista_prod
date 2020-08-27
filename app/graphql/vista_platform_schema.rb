GraphQL::Field.accepts_definitions(
  token_context: GraphQL::Define.assign_metadata_key(:token_context),
  branch_required: GraphQL::Define.assign_metadata_key(:branch_required),
  role_required: GraphQL::Define.assign_metadata_key(:role_required)
)

# VistaPlatformSchema = GraphQL::Schema.define do
#   instrument(:field, TokenContext.new)
#   instrument(:field, BranchRequired.new)
#   mutation(Types::MutationType)
#   query(Types::QueryType)
#   subscription(Types::SubscriptionType)
# end

class VistaPlatformSchema < GraphQL::Schema
  use GraphQL::Backtrace
  use GraphQL::Subscriptions::ActionCableSubscriptions

  instrument(:field, TokenContext.new)
  instrument(:field, BranchRequired.new)
  instrument(:field, RoleRequired.new)
  mutation(Types::MutationType)
  query(Types::QueryType)
  subscription(Types::SubscriptionType)
end
