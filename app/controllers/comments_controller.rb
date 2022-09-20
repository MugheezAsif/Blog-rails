class CommentsController < ApplicationController
    def new 
        @comment = Comment.new
    end

    def edit 
        @comment = Comment.find(params[:id])
    end 

    def destroy 
        @comment.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    def update 
        @comment = Comment.find(params[:id])
        respond_to do |format|
            if @comment.update(comment_params)
              format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
              format.json { render :show, status: :ok, location: @comment }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    private 

    def comment_params 
        params.require(:post).permit(:content)
    end
end
