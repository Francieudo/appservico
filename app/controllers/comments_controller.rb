class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_action :set_comment_photo, only:[:comment_photo]
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def index
		@comments = Comment.all
		
		respond_to do |format|
			format.json {render json: @comments}
	    end
	end

	def show
		respond_to do |format|
			format.json {render json: @comment}
		end
	end

	def create
		@comment = Comment.new(comment_params)

		respond_to do |format|
			if @comment.save
				format.json {render json: @comment, status: :created}
			else
				format.json {render json: @comments.erros, status: :unprocessable_entity}
			end
		end
	end

	def update
		respond_to do |format|
			if @comment.update(comment_params)
				format.json {head :no_content, status: :ok}
			else
				format.json {render json: @comments.erros, status: :unprocessable_entity}
			end
		end 
	end

	def destroy
		respond_to do |format|
			if @comment.destroy
				format.json {head :no_content, status: :ok}
			else
				format.json {render json: @comments.erros, status: :unprocessable_entity}
			end
		end
	end

	def comment_photo
		respond_to do |format|
			format.json {render json: @comments_photo}
		end
	end

private
	def set_comment
		@comment = Comment.find(params[:id])
	end

	def set_comment_photo
		@comments_photo = Comment.where(id_photo: params[:id_photo])
	end

	def comment_params
		params.require(:comment).permit(:id_photo,:name,:title,:body)
	end
end

