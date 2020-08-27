after 'development:business_units' do
  unless Branch.any?
    business_unit = BusinessUnit.find_by(name: 'Developer Division')
    FactoryBot.create_list(:branch, 20, business_unit: business_unit)
  end
end
