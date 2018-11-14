class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # we use new to make some changes (which is user id will changes each time when user comment) before create the comment
    @comment = @post.comments.new(comment_params)

    # >> >>  @comment.user_id
    # => nil
    # >>  @comment.service_id
    # => 19
    # we need to get user id then pass it to the comment instance variable otherwise it will return nil
    @comment.admin_id = current_admin.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = "Successfully deleted comment!"
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :admin_id)
  end
end
