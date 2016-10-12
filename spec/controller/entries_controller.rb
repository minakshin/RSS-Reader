require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  describe 'GET #rss_reader' do
    context 'return list of post of feed,sorted by published date' do
      feed = FactoryGirl.create(:feed)
      it 'should return list of entries' do
        get :rss_reader
        expect(:entries).not_to be_empty
      end
      it 'redirects to rss_reader page' do
        get :rss_reader
        response.should render_template :rss_reader
      end

      it 'should return list of titles sorted by published date' do
        feed = FactoryGirl.create(:feed)
        get :rss_reader
        assigns(:entries).should eq(feed.entries)
      end
    end
  end
end
