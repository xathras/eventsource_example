class ScheduledUpdatesController < ApplicationController
  def new
    priced_item = PricedItem.find params[:priced_item_id]
    @form_object = Commands::SchedulePricedItemChange.new priced_item.attributes.slice('title', 'description', 'amount', 'taxed')
  end

  def create
    @form_object = Commands::SchedulePricedItemChange.new create_params
    if @form_object.valid? && @form_object.execute
      redirect_to edit_priced_item_path(id: params[:priced_item_id])
    else
      render action: 'new'
    end
  end

private
  def create_params
    params.
      require(:commands_schedule_priced_item_change).
      permit(:title, :description, :amount, :taxed, :effective_date).
      merge(id: params[:priced_item_id])
  end
end
