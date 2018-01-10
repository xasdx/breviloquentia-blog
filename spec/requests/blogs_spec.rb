require 'spec_helper'

RSpec.describe 'Blogs API', type: :request do
  
  let!(:blogs) { create_list(:blog, 5) }
  let(:blog_id) { blogs.first.id }
  
  describe 'GET /blogs' do
    it 'returns blogs' do
      get '/blogs'
      expect(response).to have_http_status 200
      expect(json).not_to be_empty
      expect(json.size).to eq 5
    end
  end
  
  describe 'GET /blogs/:id' do
    it 'returns a blog' do
      get "/blogs/#{blog_id}"
      expect(response).to have_http_status 200
      expect(json).not_to be_empty
      expect(json['id']).to eq blog_id
    end
  end
  
  describe "POST /todos" do
    
    let (:blog) { { name: 'My blog', user_id: 'a895d056dbb04b56ac19404171a42480' } }
    
    it 'creates a blog' do
      post '/blogs', params: blog
      expect(response).to have_http_status 201
      expect(json['name']).to eq 'My blog'
    end
  end
end
