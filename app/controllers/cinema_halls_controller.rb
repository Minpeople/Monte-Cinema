# frozen_string_literal: true

class CinemaHallsController < ApplicationController
	def index 
		@cinema_halls = Cinema_hall.all

		respond_to do |format|
			format.html  
			format.json  { render :json => @cinema_halls }
		end
	end

	def new
		@cinema_hall = Cinema_hall.new
		respond_to do |format|
			format.html  
			format.json  { render :json => @cinema_hall }
		end

	def create
		@cinema_hall = Cinema_hall.new(cinema_hall_params)

  	respond_to do |format|
			if @cinema_hall.save
				format.html  { redirect_to(@cinema_hall,
											:notice => 'Cinema hall was successfully created.') }
				format.json  { render :json => @cinema_hall,
											:status => :created, :location => @cinema_hall }
			else
				format.html  { render :action => "new" }
				format.json  { render :json => @cinema_hall.errors,
											:status => :unprocessable_entity }
			end
  	end
	end

	def show 
		@cinema_hall = Cinema_hall.find(params[:id])
 
		respond_to do |format|
			format.html  
			format.json  { render :json => @cinema_hall }
		end
	end

	def edit
		@cinema_hall = Cinema_hall.find(params[:id])
	end

	def update
		respond_to do |format|
      if @cinema_hall.update(cinema_hall_params)
        format.html { redirect_to @cinema_hall, notice: "Cinema hall was successfully updated." }
				format.json { render :show, status: :ok, location: @cinema_hall }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cinema_hall.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@cinema_hall = Cinema_hall.find(params[:id])
		@cinema_hall.destroy
	 
		respond_to do |format|
			format.html { redirect_to cinema_halls_url }
			format.json { head :no_content }
		end
	end

	private
	def cinema_hall_params
		params.require(:cinema_hall).permit(:name, :capacity )
	end
end
