class HomeController < ApplicationController

  def index
  end

  def search
    if params[:search].present? 
      session[:search] = params[:search]
      produce_photo_links(session[:search])
    else
      if session[:search].present?
        produce_photo_links(session[:search])
        flash[:warning] = "Since you didnt provide new search we are showing your last search results"
      else
        flash[:warning] = "You did not provide search"
      end
    end
    render :index
  end

  private 

  def produce_photo_links(search)
    @photo_links = []
    photos = flickr.photos.search(text: search, per_page: 10, page: 1, safe_search: 1, extras: 'url_z')
    photos.each do |photo|
      @photo_links << photo['url_z']
    end
  end

end
