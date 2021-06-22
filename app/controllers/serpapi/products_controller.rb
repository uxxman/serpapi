module Serpapi
  class ProductsController < ApplicationController
    # CanCan authorization
    authorize_resource

    # GET /products
    def index
      response = ProductListService.perform!(user: current_user, query: params[:query])

      respond json: response.result, serializer: ProductSerializer
    end

    # GET /products/:id
    def show
      response = ProductDetailsService.perform!(user: current_user, id: params[:id])

      respond json: response.result, serializer: ProductSerializer
    end
  end
end