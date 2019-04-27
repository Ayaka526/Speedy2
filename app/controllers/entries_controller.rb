class EntriesController < ApplicationController
 before_action :set_feed, only: :index

  def index
    @entry = Entry.find(params[:id])
    @q = @feed.entries.ransack(params[:q])
    @entries = @q.result(distinct: true).page(params[:page]).per(12)
    @entry_ids = Stock.group(:entry_id).order('count(entry_id) desc').limit(5).pluck(:entry_id)
    @all_ranks = Stock.group(:entry_id).where(entry_id: @entry_ids)
    @user = current_user
  end

  private
  def set_feed
    @feed = Feed.find(params[:id])
  end

  def entry_params
    params.require(:entries).permit(:title, :published, :url, :feed_id, :content, :author)
  end
end
