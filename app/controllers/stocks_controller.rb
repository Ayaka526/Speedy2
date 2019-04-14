class StocksController < ApplicationController
	def create
		stock =Stock.new(entry_id: params[:id],user_id: current_user.id)
		stock.save
		head :ok
	end

	def index
		@stocks=Stock.find_by(user_id: current_user.id)
	end
end
