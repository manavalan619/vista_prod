module Api
  module V1
    module Branches
      class CategoriesController < Api::V1::BaseController
        def index
          @categories = PartnerCategory.page(params[:page])
          render json: @categories
        end
      end
    end
  end
end
