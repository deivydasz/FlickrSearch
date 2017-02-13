class HomeController < ApplicationController
  before_action :load_api_keys

  def index
  end

  def search
    if params[:search]
      search = params[:search]
      @photo_links = []
      photos = flickr.photos.search(text: search, per_page: 6, page: 1, extras: 'url_m')
      photos.each do |photo|
        @photo_links << photo['url_m']
      end
    end
    render :index
  end

  private

  def load_api_keys
    FlickRaw.api_key = ENV['FLICKER_KEY']
    FlickRaw.shared_secret = ENV['FLICKER_SECRET']
  end

end
