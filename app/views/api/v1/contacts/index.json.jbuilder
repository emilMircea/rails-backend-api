json.name @contacts.name
json.email @contacts.email

json.current do
  json.name
  json.email
end


# json.data do
#   json.array! @contacts, :id, :name, :email
# end
