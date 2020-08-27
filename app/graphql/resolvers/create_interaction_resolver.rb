class Resolvers::CreateInteractionResolver < GraphQL::Function
  argument :type, !types.String
  argument :notes, !types.String
  argument :userId, !types.ID

  type Types::InteractionType

  def call(_obj, args, ctx)
    command = Interactions::Create.call(
      user_id: args[:userId],
      type: args[:type],
      notes: args[:notes],
      staff_member: ctx[:current_user],
      branch: ctx[:current_branch]
    )
    return command.result if command.success?
    raise GraphQL::ExecutionError, command.errors
  end
end
