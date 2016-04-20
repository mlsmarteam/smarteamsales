class DocTypesController < ApplicationController
	def show

		@doc_type = DocType.find(params[:id])
	end

	def new 
		@doc_type = DocType.new
	end

	def create
		@doc_type = DocType.new(doc_type_params)
		if @doc_type.save
			flash[:success] = 'DocType added'
			redirect_to @doc_type
		else
			render 'new'
		end
	end

	def edit
		@doc_type = DocType.find(params[:id])
	end

	def update
		@doc_type = DocType.find(params[:id])
		if @doc_type.update_attributes(doc_type_params)
			flash[:success] = 'DocType updated'
			redirect_to @doc_type
		else
			render 'edit'
		end
	end

	def destroy
		DocType.find(params[:id]).destroy
		flash[:success] = 'DocType deleted'
		redirect_to countries_url
	end

	def index
		@doc_types = DocType.all
	end

	def search
		@doc_types  = DocType.order(:name).where("name LIKE ?","%#{params[:name]}%")
		doc_types = []
		@doc_types.each do |doc_type|
			doc_types << {id: doc_type.id,
					  	  name: doc_type.name
						 }
		end
		render json: doc_types.to_json
	end

	def consult
		@doc_type = DocType.find(params[:id])
		doc_type = []
		doc_type << {name:@doc_type.name}
		render json: doc_type.to_json
	end
	
	private
		def doc_type_params
			params.require(:doc_type).permit(:name)
		end
end
