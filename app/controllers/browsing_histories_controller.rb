class BrowsingHistoriesController < ApplicationController

	def record
		a = Entry.find_by(url: params["url"])

		 unless BrowsingHistory.exists?(user_id: current_user.id, entry_id: a.id )
			b = BrowsingHistory.new(user_id: current_user.id, entry_id: a.id)
			b.save
			head :ok
		end

	end

	def index
		@histories = current_user.browsing_histories.page(params[:page]).reverse_order
		@entry_ids = Stock.group(:entry_id).order('count(entry_id) desc').limit(5).pluck(:entry_id)
	    @all_ranks = Stock.group(:entry_id).where(entry_id: @entry_ids)
	    @user = current_user
	     if @user.id != current_user.id
	       redirect_to  home_route_path
	      end
	end

	def destroy
		history= BrowsingHistory.find(params[:id])
		history.destroy
		redirect_to browsing_histories_path
	end

	private

    def browsing_history_params
      params.require(:browsing_history).permit(:user, :entry)
    end
end
