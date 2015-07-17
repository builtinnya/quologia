class AboutController < ApplicationController
  def index
    @num_users = User.count
    @num_quotes = Quote.count
  end
end
