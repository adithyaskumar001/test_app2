class ArticlesController < ApplicationController

	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def edit 
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article successfully created"
			redirect_to @article
		else
			render 'new'
		end 
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article successfully deleted"
		redirect_to root_path

	end

	private
		def article_params
			params.require(:article).permit(:title, :description)
		end
end