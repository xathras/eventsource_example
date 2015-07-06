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

protected
  helper_method def priced_items
    @priced_items ||= PricedItem.all
  end

end
