class RoomsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :search]
  def index
    @rooms = Room.all
  end
  
  def search
    if params[:flag]
      @rooms = Room.where("name LIKE ? OR address LIKE ? OR introduction LIKE ? OR price LIKE ?", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      @rooms = Room.where("address LIKE ?", "%#{params[:word]}%")
    end
  end

  def new
    @room = Room.new
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:user_id, :name, :introduction, :price, :address, :image))
    if @room.save
      flash[:success] = "ルームを新しく登録しました"
      redirect_to :rooms
    else
      flash.keep[:danger] = "ルームを登録できませんでした"
      render "new"
    end
  end
  
  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
