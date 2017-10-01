json.data do
  json.account do
    json.partial!(
      'api/v1/accounts/account',
      account: account
    )
  end
end
