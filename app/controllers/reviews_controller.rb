class ReviewsController < ApplicationController

  before_filter :require_login

  def create
    @review = Review.new(product_id: params[:product_id], description: params[:review][:description], rating: params[:review][:rating], user_id: session[:user_id])
    @review.save

    if @review.save
      flash[:notice] = "Review Saved!"
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end

  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private

    def require_login
      if session[:user_id].nil?
        flash[:error] = "You must be logged in to access this section"
        redirect_to "/login"
      end
    end

end
