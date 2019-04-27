class StocksController < ApplicationController
	def create
		stock =Stock.new(entry_id: params[:id],user_id: current_user.id)
		stock.save
		redirect_to stocks_list_path
	end

	def index
		@stocks = Stock.where(user_id: current_user.id).page(params[:page])
	    @entry_ids = Stock.group(:entry_id).order('count(entry_id) desc').limit(5).pluck(:entry_id)
	    @all_ranks = Stock.group(:entry_id).where(entry_id: @entry_ids)
	    @user = current_user
	end

	def rank
		@entry_ids = Stock.group(:entry_id).order('count(entry_id) desc').limit(5).pluck(:entry_id)
		@all_ranks = Stock.group(:entry_id).where(entry_id: @entry_ids)
	end

	def destroy
		stock =Stock.find(params[:id])
		stock.destroy
		redirect_to  stocks_list_path
	end

end
