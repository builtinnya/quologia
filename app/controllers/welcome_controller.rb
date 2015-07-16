class WelcomeController < ApplicationController
  def index
    @quotes = Quote.includes(:poster).order(updated_at: :desc)
  end
end
