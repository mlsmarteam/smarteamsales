class CountriesController < ApplicationController

	def show
		@country = Country.find(params[:id])
	end

	def new 
		@country = Country.new
	end

	def create
		@country = Country.new(country_params)
		if @country.save
			flash[:success] = 'Country added'
			redirect_to @country
		else
			render 'new'
		end
	end

	def edit
		@country = Country.find(params[:id])
	end

	def update
		@country = Country.find(params[:id])
		if @country.update_attributes(country_params)
			flash[:success] = 'Country updated'
			redirect_to @country
		else
			render 'edit'
		end
	end

	def destroy
		Country.find(params[:id]).destroy
		flash[:success] = 'Country deleted'
		redirect_to countries_url
	end

	def index
		@countries = Country.all
	end

	def search
		@countries  = Country.order(:name).where("name LIKE ?","%#{params[:name]}%")
		countries = []
		@countries.each do |country|
			countries << {id: country.id,
					  	  name: country.name,
						 }
		end
		render json: countries.to_json
	end

	def consult
		@country = Country.find(params[:id])
		country = []
		country << {name:@country.name}
		render json: country.to_json
	end

	private
		def country_params
			params.require(:country).permit(:name)
		end
end
