class ReviewsController < ApplicationController
  def create
    @product = Product.find_by(id: params[:product_id])
    if @review.save
      redirect_to "/"
    else
      redirect_to "/products/#{@product.id}"
    end
  end
end
