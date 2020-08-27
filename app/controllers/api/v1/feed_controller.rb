module Api::V1
  class FeedController < Api::V1::BaseController
    has_scope :updated_since do |controller, scope, value|
      datetime = value.try(:to_datetime)
      datetime.is_a?(DateTime) ? scope.updated_since(datetime) : scope
    end

    def index
      last_week = Date.today - 1.week
      last_month = Date.today - 1.month
      category_updates_scope = CategoryUpdate.updated_since(last_week)

      @articles = apply_scopes(Article.published.updated_since(last_month))
      @interactions = apply_scopes(current_user.interactions)
      @category_updates = apply_scopes(category_updates_scope).limit(20)

      render json: Feed.new(
        articles: @articles,
        interactions: @interactions,
        category_updates: @category_updates
      )
    end
  end
end
