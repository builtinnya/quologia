class WelcomeController < ApplicationController
  PER = 5

  def index
    @quotes = Quote.page(params[:page]).per(PER).includes(:poster).order(updated_at: :desc)
  end
end
