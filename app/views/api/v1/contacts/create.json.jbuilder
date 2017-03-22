json.data do
  json.user do
    json.partial! 'api/v1/contacts/contact', contact: @contact
  end
end
