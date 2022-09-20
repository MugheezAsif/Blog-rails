class PostsController < ApplicationController
    def index 
        @posts = Post.all
    end

    def show
        @post = Post.finr(params[:id])
    end

    def new
        @post = Post.new 
    end

    def edit 
    end

    def create 
        @post = Post.new(post_params)
        if @post.save
            format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end

    def update 
        respond_to do |format|
            if @post.update(post_params)
              format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
              format.json { render :show, status: :ok, location: @post }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy 
        @user.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :content)
    end

end
