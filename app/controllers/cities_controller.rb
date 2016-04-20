class CitiesController < ApplicationController

	def show
		@city = City.find(params[:id])	
	end

	def new
		@city = City.new
		@provinces = Province.order(:name).all
	end

	def create
		@city = City.new(city_params)
		if @city.save
			flash[:success] = 'city created'
			redirect_to @city
		else
			@provinces = Province.order(:name).all
			render 'new'
		end
	end

	def edit
		@city = City.find(params[:id])
		@provinces = Province.order(:name).all
	end

	def update
		@city = City.find(params[:id])
		if @city.update_attributes(city_params)
			flash[:success] = 'City updated'
			redirect_to @city
		else
			@provinces = Province.order(:name).all
			render 'edit'
		end
	end

	def destroy
		City.find(params[:id]).destroy
		flash[:success] = 'City deleted'
		redirect_to cities_url
	end

	def index
		@cities = City.all
	end

	def search
		@cities  = City.joins(:province).where("cities.name LIKE ? and provinces.name LIKE ?","%#{params[:name]}%","%#{params[:province_name]}%")
		cities = []
		@cities.each do |city|
			cities << {id: city.id,
					   name: city.name,
					   province: city.province.name
					}
		end
		render json: cities.to_json
		
	end

	def consult
		@city = City.find(params[:id])
		city = []
		city << {name:@city.name,
				 province_name:@city.province.name,
				 province_country_name:@city.province.country.name}
		render json: city.to_json
	end


	private
		def city_params
			params.require(:city).permit(:name,:province_id)
		end

end
