require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: "test", last_name: "test", username: "test",
                        email: "cvillad@uninorte.edu.co", description: "test", password: "123456",
                      password_confirmation: "123456")
  end

  test "email should be unique" do
    @user2 = User.new(first_name: "test", last_name: "test", username: "test2",
      email: "test@test.com", description: "test", password: "123456",
      password_confirmation: "123456")
    assert_not @user2.valid?   
  end
end
