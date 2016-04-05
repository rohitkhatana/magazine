class HomeController < ApplicationController
  def home
 	   redirect_to article_index_path
  end
end
