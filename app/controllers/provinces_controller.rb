class ProvincesController < ApplicationController

	def show
		@province = Province.find(params[:id])
	end

	def new
		@province = Province.new
		@countries= Country.order(:name).all
	end

	def create
		@province = Province.new(province_params)
		if @province.save
			flash[:success] = 'Province added'
			redirect_to @province
		else
			@countries= Country.order(:name).all
			render 'new'
		end
	end

	def edit
		@province = Province.find(params[:id])
		@countries= Country.order(:name).all
	end

	def update
		@province = Province.find(params[:id])
		if @province.update_attributes(province_params)
			flash[:success] = 'Province updated'
			redirect_to @province
		else
			@countries= Country.order(:name).all
			render 'edit'
		end
	end

	def destroy
		Province.find(params[:id]).destroy
		flash[:success] = 'Province deleted'
		redirect_to provinces_url
	end

	def index
		@provinces = Province.all
	end


	def search
		@provinces  = Province.joins(:country).where("provinces.name LIKE ? and countries.name LIKE ?","%#{params[:name]}%","%#{params[:country_name]}%")
		provinces = []
		@provinces.each do |province|
			provinces << {id: province.id,
					  	  name: province.name,
					  	  country: province.country.name
						 }
		end
		render json: provinces.to_json
	end

	def consult
		@province = Province.find(params[:id])
		province = []
		province << {name:@province.name}
		render json: province.to_json
	end

	private
		def province_params
			params.require(:province).permit(:name,:country_id);
		end
end
