class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  rescue_from StandardError do |e|
    render_error(e)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render_error(e, e.message)
  end

  rescue_from ActiveRecord::RecordNotUnique do |e|
    render_error(e, "Record's name must be unique")
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error(e, "Can't find %s with id = %d" % [e.model, e.id])
  end

  private

  def render_error(error, message = 'Oops, some errors')
    logger.error [error, message]
    logger.error error.backtrace.split('\n').join("\n")
    render json: { error: true, message: message }
  end

  def render_success(data = {})
    render json: { error: false, data: data }
  end
end
