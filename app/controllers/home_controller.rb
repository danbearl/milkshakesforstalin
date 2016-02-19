class HomeController < ApplicationController
  expose(:latest_post) { Post.order('created_at DESC').first }
  expose(:latest_recipe) {Recipe.order('created_at DESC').first }
end
