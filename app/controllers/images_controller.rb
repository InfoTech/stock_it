class ImagesController < ApplicationController
  def index
    if params[:search].present?
      @images = Image.tagged_with_any(params[:search].split(' '))
    else
      @images = Image.all
    end

    if params[:untagged]
      @images = @images.where(tags_array: [])
    end

    @images = @images.paginate(page: params[:page], per_page: 16)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    @image.save

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: {id: @image.id, filename: @image.attachment_file_name}.to_json }
    end
  end

  def show
    @image = Image.find(params[:id])

    render layout: false
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    @image.update_attributes(params[:image])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
  end
end