module Serpapi
  class ProductsController < ApplicationController
    # CanCan authorization
    authorize_resource

    # GET /products
    def index
      response  = ProductListService.perform!(user: Current.user, query: params[:query])
      @products = response.result
    end

    # GET /products/:id
    def show
      response = ProductDetailsService.perform!(user: Current.user, id: params[:id])
      @product = response.result
    rescue Error::ProductNotFound
      head :not_found
    end
  end
end
