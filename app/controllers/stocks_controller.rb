class StocksController < ApplicationController

	def create
		stock =Stock.new(entry_id: params[:id],user_id: current_user.id)
		stock.save
		render :json => stock
	end

	def index
		@stocks = Stock.where(user_id: current_user.id).page(params[:page])
		  # 日ごとの件数
		  # @chart_data = Stock.order('date ASC').group(:date).count
		  # # 日ごとの合計値
		  # @chart_data = Stock.order('date ASC').group(:date).sum(:value)

		   @chart_data = [['2014-04-01', 60], ['2014-04-02', 65], ['2014-04-03', 64]]
			  # ハッシュの場合
			  @chart_data = {'2014-04-01' => 60, '2014-04-02' => 65, '2014-04-03' => 64}
	end

	def rank
		@entry_ids = Stock.group(:entry_id).order('count(entry_id) desc').limit(5).pluck(:entry_id)
		@all_ranks = Stock.group(:entry_id).where(entry_id: @entry_ids)
	end

	def destroy
		stock =Stock.where(entry_id: params[:id]).find_by(user_id: current_user.id)
		stock.destroy
		render :json => stock
	end

end
