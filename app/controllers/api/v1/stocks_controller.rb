class Api::V1::StocksController < ApiController
  def index
    list = Stock.all.includes(:bearer)
    render json: list, each_serializer: Stocks::StockSerializer
  end

  def show
    render json: stock, serializer: Stocks::StockSerializer
  end

  def create
    new_stock = Stocks::CreateInteractor.new(permitted).call

    render_success(new_stock)
  end

  def update
    stock.update!(permitted)
    render_success(stock)
  end

  def destroy
    stock.destroy

    head :ok
  end

  private

  def permitted
    params.permit(:name, :bearer_id)
  end

  def stock
    @stock ||= Stock.find(params[:id])
  end
end
