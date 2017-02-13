class HomeController < ApplicationController
  before_action :load_api_keys

  def index
    @photo_links = []

  end

  def search
    @search = params[:search]
    @photo_links = []
    photos = flickr.photos.search(text: @search, per_page: 5, page: 1, extras: 'url_c')
    photos.each do |photo|
      @photo_links << photo['url_c']
    end
    render :index
  end

  private

  def load_api_keys
    FlickRaw.api_key = ENV['FLICKER_KEY']
    FlickRaw.shared_secret = ENV['FLICKER_SECRET']
  end

end
