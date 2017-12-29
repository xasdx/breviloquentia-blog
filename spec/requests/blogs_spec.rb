require 'spec_helper'

RSpec.describe 'Blogs API', type: :request do
  
  describe 'GET /blogs' do
    it 'returns blogs' do
      get '/blogs'
      expect(response).to have_http_status 200
    end
  end
end
