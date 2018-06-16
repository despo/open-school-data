json.open_api '3.0.1'
json.info do
  json.title 'Public UK Schools JSON API - powered by data from the GOV UK Get Information about schools service'
  json.version '0.1'
  json.license do
    json.nams 'MIT License'
    json.url 'https://choosealicense.com/licenses/mit/'
  end
end

json.data do
  json.schools @schools
end
