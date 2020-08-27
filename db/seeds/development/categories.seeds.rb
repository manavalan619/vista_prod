# unless Category.any?
#   categories = FactoryBot.create_list(:category, 10)
#
#   categories.each do |category|
#     children = FactoryBot.create_list(:category, 20, parent: category)
#
#     children.each do |child|
#       FactoryBot.create_list(:category, 20, parent: child)
#     end
#   end
# end
