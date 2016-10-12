# FeedsController
class FeedsController < ApplicationController
  before_action :find_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def show
  end

  def create
    feed = Feed.new(feed_params)
    if feed.save
      flash[:success] = 'Feed added successfully!'
      redirect_to feeds_path
    else
      flash[:danger] = 'Unable to save'
      render :new
    end
  end

  def edit
  end

  def update
    if @feed.update(feed_params)
      flash[:success] = 'feed updated successfully!'
    else
      flash[:danger] = 'Error!'
    end
    redirect_to feeds_path
  end

  def destroy
    @feed.destroy
    flash[:success] = 'Feed deleted successfully!'
    redirect_to feeds_path
  end

  private

  def find_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:name, :url, :description)
  end
end
