class ReviewsController < ApplicationController

  before_filter :require_login

  def create
    @product = Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user = current_user
    @review.save

    if @review.save
      flash[:notice] = "Review Saved!"
      redirect_to "/products/#{params[:product_id]}"
    else
      flash[:notice] = "Review not saved."
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private

    def review_params
      params.require(:review).permit(
        :description,
        :rating
        )
    end

    def require_login
      if session[:user_id].nil?
        flash[:error] = "You must be logged in to leave a review"
        redirect_to "/login"
      end
    end

end
