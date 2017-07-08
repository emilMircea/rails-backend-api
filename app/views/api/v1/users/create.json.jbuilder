json.data do
  json.user do
    json.email @user.email
    json.id @user.id
  end
end
