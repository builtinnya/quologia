class AuthorsController < ApplicationController
  before_action :authenticate, except: :show

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = current_user.created_authors.build
  end

  def create
    @author = current_user.created_authors.build(author_params)
    if @author.save
      redirect_to @author, notice: '著者を登録しました'
    else
      render :new
    end
  end

  private

  def author_params
    params.require(:author).permit(
      :name, :birthplace, :birthday, :deathday, :description,
      :author_image, :author_image_cache
    )
  end
end
