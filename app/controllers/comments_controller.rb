class CommentsController < ApplicationController
    def new 
        @comment = Comment.new
    end

    def edit 
    end 

    def destroy 
        @comment.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private 

    def comment_params 
    end
end
