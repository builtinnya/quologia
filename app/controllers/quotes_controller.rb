class QuotesController < ApplicationController
  before_action :authenticate, except: :show

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = current_user.created_quotes.build
  end

  def create
    @quote = current_user.created_quotes.build(quote_params)
    if @quote.save
      redirect_to @quote, notice: '名言を登録しました'
    else
      render :new
    end
  end

  def edit
    @quote = current_user.created_quotes.find(params[:id])
  end

  def update
    @quote = current_user.created_quotes.find(params[:id])
    if @quote.update(quote_params)
      redirect_to @quote, notice: '名言を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @quote = current_user.created_quotes.find(params[:id])
    @quote.destroy!
    redirect_to root_path, notice: '名言を削除しました'
  end

  private

  def quote_params
    params.require(:quote).permit(
      :author_name, :source, :content, :author_image, :author_image_cache
    )
  end
end
