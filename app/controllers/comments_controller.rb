class CommentsController < InheritedResources::Base
  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to paste_path(@comment.paste.id), flash: { success: 'Comment was successfully added.' }
    else
      redirect_to root_path, flash: { success: 'Unable to add comment.' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit([:body, :paste_id])
  end
end

