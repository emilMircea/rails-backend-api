# json.name @contacts.name
# json.email @contacts.email
#
# json.current do
#   json.name
#   json.email
# end


json.data do
  json.array! @contacts do |contact|
    json.partial! 'api/v1/contacts/contact', contact: contact
  end
end
