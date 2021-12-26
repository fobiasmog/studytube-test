module Stocks
  class CreateInteractor
    attr_reader :name, :bearer_id

    def initialize(params = {})
      @bearer_id = params[:bearer_id]
      @name = params[:name]
    end

    def call
      if bearer
        bearer.stocks.create!(name: name)
      else
        ActiveRecord::Base.transaction do
          new_bearer = create_bearer!
          new_bearer.stocks.create!(name: name)
        end
      end
    end

    private

    def bearer
      @bearer ||= Bearer.find_by(id: bearer_id)
    end

    def create_bearer!
      Bearer.create!(
        id: bearer_id,
        name: [name, SecureRandom.hex].join('--'),
      )
    end
  end
end