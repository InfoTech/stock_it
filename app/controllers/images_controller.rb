class ImagesController < ApplicationController
  def index
    if params[:search].present?
      @images = Image.tagged_with_any(params[:search].split(' '))
    else
      @images = Image.all
    end
    @images = @images.paginate(page: params[:page])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    @image.save

    redirect_to root_path
  end

  def show
    @image = Image.find(params[:id])

    render layout: false
  end
end