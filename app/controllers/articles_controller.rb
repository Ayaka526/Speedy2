class ArticlesController < ApplicationController
	def alert
	end

	def top
		#@articles = Article.where(image_id: params[:id])
	    @articles = Article.all
	end

	def index
	end

	def rank
	end

	def stock
	end

	private
    def article_params
      params.require(:article).permit(:title,:body,:image_id)
    end
end
