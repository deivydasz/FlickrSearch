class HomeController < ApplicationController

  def index
  end

  def search
    params[:search].present? ? search = params[:search] : search = "dogs"
    @photo_links = []
    photos = flickr.photos.search(text: search, per_page: 6, page: 1, extras: 'url_m')
    photos.each do |photo|
      @photo_links << photo['url_m']
    end
    render :index
  end

end
