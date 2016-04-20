class TurnsController < ApplicationController

	def show
		@turn = Turn.find(params[:id])
	end

	def new
		@turn = Turn.new
	end

	def create
		@turn = Turn.new(turn_params)
		if @turn.save
			flash[:success] = 'Turn added'
			redirect_to @turn
		else
			render new
		end
	end

	def edit
		@turn = Turn.find(params[:id])
	end

	def update
		@turn = Turn.find(params[:id])
		if @turn.update_attributes(turn_params)
			flash[:success] = 'Turn updated'
			redirect_to @turn
		else
			render edit
		end
	end

	def destroy
		Turn.find(params[:id]).destroy
		flash[:success] = 'Turn deleted'
		redirect_to turns_url
	end

	def index
		@turns = Turn.all
	end

	private
		def turn_params
			params.require(:turn).permit(:check_in, :check_out)
		end

end
