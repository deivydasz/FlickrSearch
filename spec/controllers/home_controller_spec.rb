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
    let(:search_params) { {text: search, per_page: 10, page: 1, safe_search: 1, extras: 'url_z'} }

    it 'allows search' do
      expect(flickr).to receive(:photos).and_return(flickr_photos)
      expect(flickr_photos).to receive(:search).with(search_params).and_return(photos)
      get :search, params: {search: search}
    end
  end

  describe 'Empty input' do
    
    it 'returns warning' do
      post :search, params: { search: '' }
      expect(flash[:warning]).to be_present
    end

  end

end
