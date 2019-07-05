require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: '',
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    
    assert_select 'div[id=error_explanation]'
    assert_select 'div.alert.alert-danger'
  end
end

# https://www.railstutorial.org/book/sign_up#sec-the_finished_signup_form