class Admin::MaterialsController < Admin::ApplicationController
  before_action :set_one_material, only: [ :show, :edit, :update, :destroy]

  # 教材管理一覧画面
  def index
    # Material.all + 事前に表紙画像を取得
    @materials = Material.with_attached_cover_image
  end

  # 教材管理詳細画面
  def show
  end

  # 教材管理編集画面
  def edit
  end

  # 教材管理追加画面
  def add
    @material = Material.new
  end

  # 教材追加処理
  def create
     @material = Material.new(material_params)

    if @material.save
      redirect_to admin_materials_path , notice: "データの登録に成功しました"
    else
      render :add, status: :unprocessable_entity
    end

  end

  # 教材内容編集処理
  def update
    if @material.update(material_params)
      redirect_to admin_material_path(@material), notice: "データの更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 教材削除処理
  def destroy
    @material.destroy
    redirect_to admin_materials_path , notice: "データの削除に成功しました"
  end

  private
  def material_params
    params.require(:material).permit(
      :author,
      :body,
      :isbn_number,
      :price,
      :publisher,
      :release_date,
      :study_level,
      :title,
      :cover_image,
      :category_id,
      tag_ids:[]
      
    )
  end

  def set_one_material
    @material = Material.find(params[:id])
  end
end
