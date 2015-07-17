class WelcomeController < ApplicationController
  def index
    @quotes = @q.result
  end
end
