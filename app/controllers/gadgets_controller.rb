class GadgetsController < ApplicationController
  def show
    @gadget = Gadget.find(params[:id])
  end

  def index
    @gadgets = Gadget.all
    template = params[:mode] == 'list' ? '_list' : '_imgs'
    cookies[:mode] = params[:mode]
    render template
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.create(gadget_params)
    redirect_to gadgets_path
  end

  def edit
    @gadget = Gadget.find(params[:id])
  end

  def update
    @gadget = Gadget.find(params[:id])
    @gadget.update_attributes(gadget_params)
    redirect_to gadgets_path
  end

  private

  def gadget_params
    params.require(:gadget).permit(:image, :name)
  end
end
