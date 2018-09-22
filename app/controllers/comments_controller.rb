class CommentsController < ApplicationController
  def create
    Comment.create(content: params[:content], prototype_id: params[:prototype_id], user_id: current_user.id)
     respond_to do |format|
      format.html { redirect_to prototype_path(params[:prototype_id])  }
      format.json
    end
  end
  def destroy
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.find(params[:id])
    @comment.destroy
    redirect_to "/prototypes/#{@comment.prototype.id}"
  end

  def content
  end

  def update
    @prototype = Comment.find_by(id: params[:id])
    @prototype.content = params[:content]
    @prototype.save
    redirect_to("/")
  end

  def edit
    @prototype = Comment.find_by(params[:id])
  end



   private
  def comment_params
    params.require(:comment).permit(:content,)
  end
end
