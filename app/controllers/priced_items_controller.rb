class PricedItemsController < ApplicationController

  def new
    @form_object = Commands::CreatePricedItem.new
  end

  def create
    @form_object = Commands::CreatePricedItem.new params.require(:commands_create_priced_item).permit(:title, :description, :amount, :taxed)
    if @form_object.valid? && @form_object.execute
      redirect_to priced_items_path
    else
      render action: 'new'
    end
  end

  def edit
    @form_object = Commands::UpdatePricedItem.new PricedItem.find_by(id: params[:id]).attributes.slice('id', 'title', 'description', 'amount', 'taxed')
  end

  def update
    @form_object = Commands::UpdatePricedItem.new params.require(:commands_update_priced_item).permit(:id, :title, :description, :amount, :taxed).merge(id: params[:id])
    if @form_object.valid? && @form_object.execute
      redirect_to priced_items_path
    else
      render action: 'edit'
    end
  end

  def destroy
    Commands::DeletePricedItem.new(params[:id]).execute
    redirect_to priced_items_path
  end

protected
  helper_method def priced_items
    @priced_items ||= PricedItem.where(deleted: false)
  end

end
