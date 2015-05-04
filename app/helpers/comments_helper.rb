module CommentsHelper
  def comment_line(comment)
    "#{comment.body} - <b>#{comment.user_email}</b> (#{comment.created_at.to_formatted_s(:short)})"
  end
end
