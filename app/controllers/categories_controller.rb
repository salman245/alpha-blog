class CategoriesController < ApplicationController
 before_action :require_admin, except: [:index, :show]

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
        flash[:notice] = "Category was created Successfully"
        redirect_to @category
        else
            render 'new'
        end

    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 4)

    end

    def edit
        @category = Category.find(params[:id])

    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = "Category name updated Successfully"
            redirect_to @category
        else
            render 'edit'
        end

    end

    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page: 4)

    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:notice] = "Only admincan perform this action"
            redirect_to categories_path
        end
    end


end