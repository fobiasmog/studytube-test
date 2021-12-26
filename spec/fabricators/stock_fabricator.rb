Fabricator(:stock) do
  name { FFaker::HipsterIpsum.unique.word }
end

Fabricator(:stock_with_bearer) do
  name { FFaker::HipsterIpsum.unique.word }
  bearer
end
