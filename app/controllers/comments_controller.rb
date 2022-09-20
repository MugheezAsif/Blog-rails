class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        #redirect_to article_path(@post)
        
    end

    def destroy 
        @post = Post.find(params[:post_id])
        @post.comment.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private 

    def comment_params 
        params.require(:comment).permit(:content, :author, :post_id )
    end
end
