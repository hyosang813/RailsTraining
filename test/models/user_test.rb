require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar" )
  end

  # オブジェクト有効性テスト
  test "should be valid" do
    assert @user.valid? # なんでかわからんがこkで落ちるようになったから後で調べる
  end

  # nameフィールド有効性テスト
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  # nameフィールド文字数テスト
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # emailフィールド文字数テスト
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # emailフィールド形式テスト
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # emailフィールド一意性テスト
  test "email addresses should be unique" do
   duplicate_user = @user.dup
   duplicate_user.email = @user.email.downcase
   @user.save
   assert_not duplicate_user.valid?
  end

  # パスワード存在テスト
  test "password should be present (nonblank)" do
   @user.password = @user.password_confirmation = " " * 6
   assert_not @user.valid?
 end

 # パスワード文字数テスト
 test "password should have a minimum length" do
   @user.password = @user.password_confirmation = "a" * 5
   assert_not @user.valid?
 end
end
