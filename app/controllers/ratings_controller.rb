# frozen_string_literal: true
class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    resource = GlobalID::Locator.locate_signed(params[:resource])

    rating = Rating.find_or_initialize_by(ratingable: resource, user: current_user)
    rating.update(amount: params[:direction] == 'like' ? 1 : -1)

    @result = params[:result]
    @rating = resource.rating
  end
end
