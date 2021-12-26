Fabricator(:bearer) do
  name { FFaker::HipsterIpsum.unique.word }
end
