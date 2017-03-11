require 'test_helper'

class Api::V1::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "index action should be successful" do
    get '/api/v1/contacts'
    assert_response :success
  end

  test "create should be successful" do
    get '/api/v1/contacts'
    assert_response :success
  end


test "should destroy contact" do
  contact = contacts(:one)
  contact_url = 'http://localhost:3000/api/v1/contacts/1'
  # assert_equal(2, Contact.count)
  # assert_equal('2', "#{Contact.count}")
  assert_difference('Contact.count', -1) do
    delete contact_url
  end
end
end
