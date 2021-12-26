module Stocks
  class StockSerializer < ActiveModel::Serializer
    attributes :id, :name, :created_at, :updated_at

    has_one :bearer, serializer: Bearers::BearerSerializer
  end
end