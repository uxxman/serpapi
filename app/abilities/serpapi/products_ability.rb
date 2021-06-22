module Serpapi
  class ProductsAbility < ApplicationAbility
    def customer
      can :read, Product
    end
  end
end
