class Admin::TagsController < Admin::ApplicationController
  before_action :set_one_tag, only: [ :edit, :update, :destroy ]
  # タグ 一覧画面
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  # タグ 編集画面
  def edit
  end

  # タグ データ登録処理
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash.now[:notice] = "タグを追加しました"
    else
      @tags = Tag.all
      render :index, status: :unprocessable_entity
    end
  end

  # タグ データ更新処理
  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "カテゴリ名の更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # タグ 削除処理
  def destroy
    if @tag.destroy
      @tags = Tag.all
      flash.now[:notice] = "タグを削除しました"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(
      :name
    )
  end

  def set_one_tag
    @tag = Tag.find(params[:id])
  end
end
