class MarksController < ApplicationController

	def show
		@mark = Mark.find(params[:id])
	end

	def new
		@mark = Mark.new
	end

	def create
		@mark = Mark.new(mark_params)
		if @mark.save
			flash[:success] = 'Mark added'
			redirect_to @mark
		else
			render 'new'
		end
	end

	def edit
		@mark = Mark.find(params[:id])
	end

	def update
		@mark = Mark.find(params[:id])
		if @mark.update_attributes(mark_params)
			flash[:success] = 'Mark updated'
			redirect_to @mark
		else
			render 'edit'
		end
	end

	def destroy
		Mark.find(params[:id]).destroy
		flash[:success] = 'Mark deleted'
		redirect_to marks_url
	end

	def index
		@marks = Mark.all
	end

	def search
		@marks  = Mark.order(:name).where("name LIKE ?","%#{params[:name]}%")
		marks = []
		@marks.each do |mark|
			marks << {id: mark.id,
					  name: mark.name
							 }
		end
		render json: marks.to_json
	end

	def consult
		@mark = Mark.find(params[:id])
		mark = []
		mark << {name:@mark.name}
		render json: mark.to_json
	end

	private
		def mark_params
			params.require(:mark).permit(:name)
		end
end
