require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET index' do 
    it 'returns http_status 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'Search success' do
    it 'allows search' do
      get :search, params: {search: 'dog'}
      expect(response.status).to eq(200)
    end
  end

end
