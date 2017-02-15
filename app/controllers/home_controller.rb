class HomeController < ApplicationController

  def index
  end

  def search
    params[:search].present? ? search = params[:search] : search = "dogs"
    @photo_links = []
    photos = flickr.photos.search(text: search, per_page: 10, page: 1, extras: 'url_z')
    photos.each do |photo|
      @photo_links << photo['url_z']
    end
    render :index
  end

end
