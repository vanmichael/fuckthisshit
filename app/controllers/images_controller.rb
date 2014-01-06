class ImagesController < ApplicationController
  def show
    @image_url = Bucket.find_cloudfront_image(params[:id])
  end

  def next
    redirect_to image_path(Bucket.next_image(params[:id])[:id])
  end

  def previous
    redirect_to image_path(Bucket.previous_image(params[:id])[:id])
  end

  def index
    if request.referrer
      @current_id = URI.parse(request.referrer).path.split('/').last
    end

    redirect_to image_path(Bucket.random_image(@current_id)[:id])
  end
end
