json.array!(@lecture_informations) do |lecture_information|
  json.extract! lecture_information, :id
  json.url lecture_information_url(lecture_information, format: :json)
end
