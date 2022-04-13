class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # the call to create will create, save, and automatically link the comment to @article.
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
