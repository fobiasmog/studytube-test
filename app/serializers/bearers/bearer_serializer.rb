module Bearers
  class BearerSerializer < ActiveModel::Serializer
    attributes :id, :name, :created_at, :updated_at

    belongs_to :stocks, serializer: Stocks::StockSerializer
  end
end
