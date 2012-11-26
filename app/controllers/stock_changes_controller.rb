class StockChangesController < ApplicationController
  before_filter :authenticate_user
  helper_method :sort_column

  def index
    @stock_changes = StockChange.joins(:stock,:user).order(sort_column + ' ' + sort_direction + ', id')
  end
    
  def create
    @stock_change = StockChange.new(params[:stock_change])
    @stock_change.stock.count = @stock_change.stock.count + @stock_change.count_change
    @stock_change.user_id = current_user.id
    
    if @stock_change.save
        redirect_to stocks_url
    else
        # since redirecting, using flash to keep error messages
        redirect_to stocks_url, :flash => {:error_stock_change => @stock_change}
    end
  end

  private
  
  #sets sorting column default and protects against sql injection
  def sort_column
    (StockChange.column_names + ['stocks.name', 'stock_changes.created_at']).include?(params[:sort]) ? params[:sort] : "id"
  end
  
end
