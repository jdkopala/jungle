class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_AUTH_USER"], password: ENV["HTTP_AUTH_PASS"]

  def show
    @categories = Category.all.count
    @product = Product.all.count
  end
end
