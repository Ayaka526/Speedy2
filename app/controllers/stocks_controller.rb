class StocksController < ApplicationController
	def create
		stock =Stock.new(entry_id: params[:id],user_id: current_user.id)
		stock.save
		redirect_to stocks_create_path(entry)
	end

	def index
		@stocks = Stock.where(user_id: current_user.id).page(params[:page]).reverse_order
	end

	def destroy
		stock =Stock.where(entry_id: params[:id]).find_by(user_id: current_user.id)
		stock.destroy
		redirect_to stocks_create_path(entry)
	end

end

