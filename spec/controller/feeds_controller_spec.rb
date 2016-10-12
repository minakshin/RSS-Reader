require 'rails_helper'

RSpec.describe FeedsController, type: :controller do

  # let!(:feed) do
  #   FactoryGirl.create(:feed)
  # end

  describe 'POST #create' do
    it 'create new feed with valid parameters' do
      expect do
        post :create, feed: FactoryGirl.attributes_for(:feed)
      end.to change(Feed, :count).by(1)
    end

    context 'with invalid attributes' do
      it 'does not save the new feed' do
        expect do
          post :create,
               feed: FactoryGirl.attributes_for(:invalid_feed)
        end.to_not change(Feed, :count)
      end
      it 'redirects to index' do
        post :create, feed: FactoryGirl.attributes_for(:invalid_feed)

        response.should render_template :new
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the feed' do
      feed = FactoryGirl.create(:feed)
      expect do
        delete :destroy, id: feed.id
      end.to change(Feed, :count).by(-1)
      expect do
        response.should render_template :index
      end
    end
  end

  describe 'GET #index' do
    feed = FactoryGirl.create(:feed)
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
    it 'populates an array of feeds' do
      get :index
      expect(:feed).not_to be_empty
    end
  end

  describe 'PUT update' do
    it 'update the requested feed' do
      feed = FactoryGirl.create(:feed)
      new_name = 'test123'
      put :update, id: feed.id, feed: { name: new_name }
      expect(feed.reload.name).to eq(new_name)
    end
  end
end
