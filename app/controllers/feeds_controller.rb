class FeedsController < ApplicationController

  def top
    @entries= Entry.limit(10)
    @feeds = Feed.all

  end

  private

    def feed_params
      params.require(:feed).permit(:name, :title, :url, :description)
    end
end
