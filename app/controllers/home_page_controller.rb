require 'api_consuming'
class HomePageController < ApplicationController
  before_action :authenticate_user!
  def Index
    @posts = Post.last(10)
    #@arturo = api_consult 'https://www.youtube.com/results?search_query=hola'
  end
end
