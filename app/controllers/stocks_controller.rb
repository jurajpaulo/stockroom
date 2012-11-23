class StocksController < ApplicationController
  before_filter :authenticate_user
  helper_method :sort_column
  
  def index
    @stocks = Stock.order(sort_column + ' ' + sort_direction)
    @stock_change = StockChange.new(:count_change => 1)
  end
  
  def new
    @stock = Stock.new
  end
  
  def create
    @stock = Stock.new(params[:stock])
    if @stock.save
      flash[:notice] = "Successfully created stock."
      redirect_to @stock
    else
      render :action => 'new'
    end
  end
  
  def show
    @stock = Stock.find(params[:id])
  end
  
  def edit
    @stock = Stock.find(params[:id])
  end
  
  def update
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(params[:stock])
      flash[:notice] = "Successfully updated stock."
      redirect_to @stock
    else
      render :action => 'edit'
    end
  end
  
  private

  #sets sorting column default and protects against sql injection
  def sort_column
    session[:sort] = Stock.column_names.include?(params[:sort]) ? params[:sort] : session[:sort] || "id"
  end
  
end
