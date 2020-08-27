after 'development:organisations' do
  branch_manager = BranchManager.find_or_create_by(email: 'branch@manager.com')
  branch_manager.organisation = Organisation.first
  # branch_manager.branch = branch
  branch_manager.employee_id = 'asdf2'
  branch_manager.password = 'Password123'
  # branch_manager.password_confirmation = 'Password123'
  branch_manager.first_name = 'Branch'
  branch_manager.last_name = 'Mgr'
  admin.confirmed_at = Time.now.utc
  branch_manager.save
end
