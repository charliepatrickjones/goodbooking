class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  @restaurants = Restaurant.first(5)

  end

end
