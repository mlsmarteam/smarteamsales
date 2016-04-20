class ArticlesController < ApplicationController

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		@marks = Mark.order(:name).all
		@companies = Company.order(:name).all
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = "Article created"
			redirect_to @article
		else
			@marks = Mark.order(:name).all
			@companies = Company.order(:name).all
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
		@marks = Mark.order(:name).all
		@companies = Company.order(:name).all
	end				

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			#do something
			flash[:success] = "Article updated"
			redirect_to @article
		else
			@marks = Mark.order(:name).all
			@companies = Company.order(:name).all
			render 'edit'
		end
	end

	def destroy
		Article.find(params[:id]).destroy
		flash[:success] = "article deleted"
		redirect_to articles_url
	end

	def index
		@articles =  Article.all
		@marks = Mark.all
	end

	private
		def article_params
			params.require(:article).permit(:name,:barcode,:purchase_amount,
											:sale_amount,:min_stock,:max_stock,
											:quantity,:mark_id)
		end
end
