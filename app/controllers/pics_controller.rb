class PicsController < ApplicationController

  def index
    @pic = Pic.new
    @pics= Pic.all
  end

  def new
  end

  def create
    @pic = Pic.new(pic_params)
    @pics = Pic.all
    if @pic.save
    redirect_to pics_path , notice: "写真を投稿しました!"
  else
   render action: 'index'
  end
end

  def edit
    @pic = Pic.find(params[:id])
  end

  def update
    @pic = Pic.find(params[:id])
    if @pic.update(pic_params)
    redirect_to pics_path , notice: "写真を更新しました!"
  else
   render action: 'edit'
  end
  end

  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy
    redirect_to pics_path
  end


  private
  def pic_params
    params.require(:pic).permit(:title)
  end

end