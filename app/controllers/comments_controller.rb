class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        #redirect_to article_path(@post)
        
    end

    def destroy 
        @post = Post.find(params[:post_id])
        @post.comment.destroy

    end

    private 

    def comment_params 
        params.require(:comment).permit(:content, :author, :post_id )
    end
end
