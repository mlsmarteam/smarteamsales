class ExpenditureTypesController < ApplicationController

	def show
		@expenditure_type = ExpenditureType.find(params[:id])
	end

	def new
		@expenditure_type = ExpenditureType.new
	end

	def create
		@expenditure_type = ExpenditureType.new(expenditure_type_params)
		if @expenditure_type.save
			flash[:success] = 'Expenditure type added'
			redirect_to @expenditure_type
		else
			render 'new'
		end
	end

	def edit
		@expenditure_type = ExpenditureType.find(params[:id])
	end

	def update
		@expenditure_type = ExpenditureType.find(params[:id])
		if @expenditure_type.update_attributes(expenditure_type_params)
			flash[:success] = 'Expenditure type updated'
			redirect_to @expenditure_type
		else
			render 'edit'
		end
	end

	def destroy
		ExpenditureType.find(params[:id]).destroy
		flash[:success] = 'Expenditure type deleted'
		redirect_to expenditure_types_url
	end

	def index
		@expenditure_types = ExpenditureType.all
	end

	def search
		@expenditure_type = ExpenditureType.order(:name).where("name LIKE ?","%#{params[:name]}%")
		expenditure_types = []
		@expenditure_type.each do |expenditure_type|
			expenditure_types << {id: expenditure_type.id,
								  name: expenditure_type.name
								 }
		end
		render json: expenditure_types.to_json
	end

	def consult
		@expenditure_type = ExpenditureType.find(params[:id])
		expenditure_type = []
		expenditure_type << {name:@expenditure_type.name
							}
		render json: expenditure_type.to_json
	end

	private
		def expenditure_type_params
			params.require(:expenditure_type).permit(:name)
		end
end
