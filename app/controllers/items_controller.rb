require 'Kconv'
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  layout 'af_log'

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    file = item_params[:file]
    file_name = file.original_filename
    result = uploadpdf(file,file_name)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: '投稿に成功しました。' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: '編集に成功しました。' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: '削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title,:college_id, :detail, :price, :file,:user_id,:year,:hand_over_way)
    end

    def uploadpdf(file_object,file_name)
      ext = file_name[file_name.rindex('.') + 1, 4].downcase
      perms = ['.pdf']
      if !perms.include?(File.extname(file_name).downcase)
        result = 'アップロードできるのはpdfファイルのみです。'
      elsif file_object.size > 10.megabyte
        result = 'ファイルサイズは10MBまでです。'
      else
        File.open("public/user_upload_pdf/#{file_name.toutf8}", 'wb') { |f| f.write(file_object.read) }
        result = "success"
      end
      return result
    end

    def deleteipdf(file_name)
      File.unlink "public/user_upload_pdf/"+file_name.toutf8
    end
end
