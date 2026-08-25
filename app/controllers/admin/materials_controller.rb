class Admin::MaterialsController < Admin::ApplicationController
  before_action :set_one_material, only: [ :show, :edit, :update, :destroy]

  # 教材管理一覧画面
  def index
    # 検索結果を@qに該当書籍の画像を事前に取得
    # @params[:q]に値が無い状態だと、Material情報全取得
    @q = Material.ransack(params[:q])
    @materials = @q.result.with_attached_cover_image
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
      request_isbn_exists_and_create
      redirect_to admin_materials_path, notice: "データの登録に成功しました\n\n" + @number_of_request_changes
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
    request_isbn_exists_and_destroy
    redirect_to admin_materials_path , notice: "データの削除に成功しました\n\n" + @number_of_request_destroy
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

  # リクエスト教材と登録教材のISBNが一致したならリクエストのステータスを自動で追加済に変更
  def request_isbn_exists_and_create
    requests = Request.in_progress
                      .where(isbn_number: @material.isbn_number )
    unless requests.blank?
      update_counts = requests.count
      requests.each do |request_record|
        request_record.update(reply: "リクエストありがとうございます。教材の追加をしたのでご確認お願いします",
                              progress_status: 2)
        # リクエスト通知を作成
        request_record.create_request_notification              
      end
    end
    @number_of_request_changes = "リクエスト教材の変更件数は#{update_counts}件です"
  end

  # リクエスト教材と登録教材のISBNが一致したリクエスト履歴を削除
  def request_isbn_exists_and_destroy
    return if @material.blank?

    requests = Request.where(isbn_number: @material.isbn_number )
    destroy_counts = requests.count
    requests.destroy_all
    @number_of_request_destroy = "リクエスト教材の削除件数は#{destroy_counts}件です"
  end
end
