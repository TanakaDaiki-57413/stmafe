class Admin::CategoriesController < Admin::ApplicationController
  # カテゴリ 一覧画面
  def index
    @category = Category.new
    @categories = Category.all
  end

  # カテゴリ 編集画面
  def edit
    @category = Category.find(params[:id])
  end

  # カテゴリ データ登録処理
  def create
    @category = Category.new(category_params)

    if @category.save
      flash.now[:notice] = "カテゴリを追加しました"
    else
      @categories = Category.all
      render :index, status: :unprocessable_entity
    end
  end

  # カテゴリ データ更新処理
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "カテゴリ名の更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      redirect_to admin_categories_path, notice: "カテゴリの削除に成功しました"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
