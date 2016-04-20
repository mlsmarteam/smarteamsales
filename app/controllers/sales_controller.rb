class SalesController < ApplicationController

	def show
		@sale = Sale.find(params[:id])
	end

	def new
		@sale = Sale.new
		@users= User.order(:name).all
	end

	def create
		@sale = Sale.new(sale_params)
		if @sale.save
			flash[:success] = 'Sale added'
			redirect_to @sale
		else
			@users= User.order(:name).all
			render 'new'
		end
	end

	def edit
		@sale = Sale.find(params[:id])
		@users= User.order(:name).all
	end

	def update 
		@sale = Sale.find(params[:id])
		if @sale.update_attributes(sale_params)
			flash[:success] = 'Sale updated'
			redirect_to @sale
		else
			@users= User.order(:name).all
			render 'edit'
		end
	end

	def destroy
		Sale.find(params[:id]).destroy
		flash[:success] = 'Sale deleted'
		redirect_to sales_url
	end

	def index
		@sales = Sale.all
	end

	private
		def sale_params
			params.require(:sale).permit(:amount,:date,:user_id)
		end
end
