# == Schema Information
#
# Table name: role_preference_group_assignments
#
#  id                  :bigint(8)        not null, primary key
#  role_id             :bigint(8)
#  preference_group_id :bigint(8)
#  position            :integer
#  column              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_role_preference_group_assignments_on_preference_group_id  (preference_group_id)
#  index_role_preference_group_assignments_on_role_id              (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (preference_group_id => preference_groups.id)
#  fk_rails_...  (role_id => roles.id)
#

require 'rails_helper'

RSpec.describe RolePreferenceGroupAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
