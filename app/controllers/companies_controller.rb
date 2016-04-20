class CompaniesController < ApplicationController

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new
		@cities  = City.order(:name).all
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			flash[:success] = 'Company created'
			redirect_to @company
		else
			@cities = City.order(:name).all
			render 'new'
		end
	end

	def edit
		@company = Company.find(params[:id])
		@cities  = City.order(:name).all
	end

	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(company_params)
			flash[:success] = 'Company updated'
			redirect_to @company
		else
			@cities = City.order(:name).all
			render 'edit'
		end
	end

	def destroy
		Company.find(params[:id]).destroy
		flash[:success] = 'Company deleted'
		redirect_to companies_url
	end

	def index
		@companies = Company.all
	end

	def search 
		@companies  = Company.order(:name).where("name LIKE ?","%#{params[:name]}%")
		companies = []
		@companies.each do |company|
			companies << {id: company.id,
					  name: company.name
							 }
		end
		render json: companies.to_json
	end

	def consult
		@company = Company.find(params[:id])
		company = []
		company << {name:@company.name}
		render json: company.to_json
	end


	private
		def company_params
			params.require(:company).permit(:name,:cuit,:street,:number,
											:floor,:apartment,:city_id,
											:fixed_tel,:cel_tel,:email,
											:description)
		end
end
