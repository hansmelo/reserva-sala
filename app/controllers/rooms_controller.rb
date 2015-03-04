class RoomsController < ApplicationController
  def create
    room = Room.new(user: current_user, day: params[:day], hour: params[:hour]) 
    respond_to do |format|
      if room.save!
      	format.html { redirect_to :show, notice: 'Reserva criada com sucesso' }
        format.json { render json: { message: "Reservado por #{current_user.email}", id: room.id } }
      else
      	format.html { redirect_to :show, notice: 'Não foi possível criar a reserva' }
        format.json { render json: { message: "Não foi possível realizer a reserva", status: 400 } }
      end
    end
  end

  def destroy
  	Room.find(params[:id]).destroy
  	respond_to do |format|
      format.html { redirect_to :show, notice: 'Reserva removida com sucesso' }
      format.json { render json: { message: "Reserva removida com sucesso" } }
    end
  end
end