class BrowsingHistoriesController < ApplicationController

	def record
		a = Entry.find_by(url: params["url"])
		b = BrowsingHistory.new(user_id: current_user.id, entry_id: a.id)
		b.save
		head :ok
	end

	def index
		@history = BrowsingHistory.find_by(params[:id])
		@histories = current_user.browsing_histories
	end

	private

    def browsing_history_params
      params.require(:browsing_history).permit(:user, :entry)
    end
end