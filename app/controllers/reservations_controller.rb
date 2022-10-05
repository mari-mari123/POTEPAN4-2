class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end
  def confirm
    @reservations = Reservation.new(params.permit(:room_id, :start_date, :end_date, :people, :price ))
    @room_price = @reservations.room.price
    @room_start = @reservations.start_date
    @room_end = @reservations.end_date
    @room_day = (@reservations.end_date - @reservations.start_date).to_i
    @room_people = @reservations.people
    @room_sum = @reservations.room.price * @reservations.people * @room_day
  end

  def create
    @reservations = Reservation.new(params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :people, :total_price ))
    if @reservations.save
      flash[:success] = "予約が完了しました"
      redirect_to reservations_show_path
    else
      flash.keep[:danger] = "予約ができませんでした"
      redirect_to room_path(@reservations.room_id)
    end
  end

  def show
    @reservation = Reservation.order("created_at DESC").first
  end
end
