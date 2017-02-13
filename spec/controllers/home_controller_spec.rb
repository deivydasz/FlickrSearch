require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET index' do 
    it 'returns http_status 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'Search success' do

    let(:search) { 'dog' }
    let(:flickr_photos) { double }
    let(:photos) { [] }
    let(:search_params) { {text: search, per_page: 6, page: 1, extras: 'url_m'} }

    it 'allows search' do
      expect(flickr).to receive(:photos).and_return(flickr_photos)
      expect(flickr_photos).to receive(:search).with(search_params).and_return(photos)
      get :search, params: {search: search}
    end
  end

  describe 'Empty input' do
    let(:empty_search) { '' }
    let(:flickr_photos) { double }
    let(:photos) { [] }
    let(:search_params) { {text: 'dogs', per_page: 6, page: 1, extras: 'url_m'} }

    it 'allows search' do
      expect(flickr).to receive(:photos).and_return(flickr_photos)
      expect(flickr_photos).to receive(:search).with(search_params).and_return(photos)
      get :search, params: {search: empty_search}
    end

  end

end
