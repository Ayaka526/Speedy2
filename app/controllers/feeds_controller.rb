class FeedsController < ApplicationController
  before_action :set_feed, only: [:show]


  def top

    @entries= Entry.limit(5)
    @feeds = Feed.all
  end

  def index
    @feeds = Feed.all
  end

  def show
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:name, :url, :description)
    end
end