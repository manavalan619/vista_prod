class AddOnboardingCompleteToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :onboarding_complete, :boolean, default: false
  end
end
