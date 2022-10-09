class Api::V1::CommentsController < ApplicationController
#   before_action :authenticate_with_token
  before_action :find_comment
  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def find_comment
    @comment = Comment.find_by_id(params[:id])
  end
end