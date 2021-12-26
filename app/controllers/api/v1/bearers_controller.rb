class Api::V1::BearersController < ApiController
  def index
    list = Bearer.all
    render json: list
  end

  def create
    bearer = Bearer.create!(bearer_params)
    render_success(bearer)
  end

  private

  def bearer_params
    params.permit(:name)
  end
end
