class InquiriesController < ApplicationController
  before_action :correct_user, only: [:index]

	def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id
    @inquiry.save
    flash[:notice] = "Message was successfully sent."
    redirect_to feeds_top_path
  end


# 管理人サイド

  def index
    @inquiries = Inquiry.search(params[:search])
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @user = User.find(@inquiry.user_id)
  end


    private
    def inquiry_params
      params.require(:inquiry).permit(:title, :body)
    end

    def correct_user
        if  current_user.id !=1
            redirect_to  home_route_path
        end
    end

end
