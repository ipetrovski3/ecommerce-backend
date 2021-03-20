# frozen_string_literal: true

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_one = admins(:one)
  end

  test 'create Admin with correct attributes' do
    assert_difference('Admin.count', 1) do
      post api_v1_admins_url, params: {
        admin: { username: 'username', password: 'password',
        password_confirmation: 'password' }
      }, xhr: true, as: :json
    end

    assert_response :success, response.body
  end

  test 'if logging in successfull Admin gets auth token' do
      post api_v1_login_url, params: {
        username: @admin_one.username, password: "password"
      }, xhr: true, as: :json

    assert response.body.include?('token')
    assert_response :success, response.body
  end
end
