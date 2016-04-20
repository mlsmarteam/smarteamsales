class ExpendituresController < ApplicationController

	def show
		@expenditure = Expenditure.find(params[:id])
	end

	def new
		@expenditure = Expenditure.new
		@expenditure_types = ExpenditureType.order(:name).all
	end

	def create
		@expenditure = Expenditure.new(expenditure_params)
		if @expenditure.save
			flash[:success] = 'Expenditure added'
			redirect_to @expenditure
		else
			@expenditure_types = ExpenditureType.order(:name).all
			render 'new'
		end
	end

	def edit
		@expenditure = Expenditure.find(params[:id])
		@expenditure_types = ExpenditureType.order(:name).all
	end

	def update
		@expenditure = Expenditure.find(params[:id])
		if @expenditure.update_attributes(expenditure_params)
			flash[:success] = 'Expenditure updated'
			redirect_to @expenditure
		else
			@expenditure_types = ExpenditureType.order(:name).all
			render 'edit'
		end
	end

	def destroy
		Expenditure.find(params[:id]).destroy
		flash[:success] = 'Expenditure deleted'
		redirect_to expenditures_url
	end

	def index
		@expenditures = Expenditure.all
	end




	private
		def expenditure_params
			params.require(:expenditure).permit(:expenditure_type_id, :amount, 
												:description, :date)
		end
end
