class HomeController < ApplicationController
  before_action :load_api_keys

  def index

    @photos = flickr.photos.search(text: 'beach', per_page: 5, page: 1)

  end

  def search

  end

  private

  def load_api_keys
    FlickRaw.api_key = ENV['FLICKER_KEY']
    FlickRaw.shared_secret = ENV['FLICKER_SECRET']
  end

end
