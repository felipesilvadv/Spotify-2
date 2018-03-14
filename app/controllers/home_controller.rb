class HomeController < ApplicationController
  def index
    if current_user
      redirect_to home_page_Index_path
    end
  end
end
