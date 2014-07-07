require 'test_helper'

class UserTest < ActiveSupport::TestCase

  NAME = "testjhon"
  EMAIL = "test@jhon.com"
  USERNAME = "testjhon"
  PASSWORD = "testjhon"

  def create_default_user
    user = User.new
    user.name = NAME
    user.email = EMAIL
    user.username = USERNAME
    user.password = PASSWORD
    user
  end

  # Testing name attribute
  test "should not save user without name or with name length out of 2..60" do
    user = create_default_user
    user.name = "0"
    assert_not user.save, "Saved the user with a short name"
    user.name = "0123456789" * 6 + "W"
    assert_not user.save, "Saved the user with a long name"
    user.name = nil    
    assert_not user.save, "Saved the user without a name"
    user.name = NAME
    assert user.save, "Unsaved the user with all the parameters correct:\n" + user.attributes.to_s
  end
 
  #Testing email attribute 
  test "should not save user with a invalid email" do
    user = create_default_user
    user.email = nil    
    assert_not user.save, "Saved the user without a email"
    user.email = "@."    
    assert_not user.save, "Saved the user with a invalid email"
    user.email = "a" * 50 + "@" + "a" * 46 + "." + "com"   
    assert_not user.save, "Saved the user with a long email"
    user.email = EMAIL
    assert user.save, "Unsaved the user with all the parameters correct:\n" + user.attributes.to_s
    user = create_default_user
    assert_not user.save, "Saved the user with a duplicated email"
  end

  #Testing password attribute 
  test "should not save user with a invalid password" do
    user = create_default_user
    user.password = nil    
    assert_not user.save, "Saved the user without a password"
    user.password = "123"    
    assert_not user.save, "Saved the user with too short password"
    user.password = "12345" * 4 + "a"    
    assert_not user.save, "Saved the user with a too long  password"
    user.password = PASSWORD
    assert user.save, "Unsaved the user with all the parameters correct:\n" + user.attributes.to_s
  end

  #Testing username attribute 
  test "should not save user without username" do
    user = create_default_user
    user.username = nil    
    assert_not user.save, "Saved the user without a username"
    user.username = "12"    
    assert_not user.save, "Saved the user with a too short username"
    user.username = "12345" * 4 + "a"    
    assert_not user.save, "Saved the user with a too long username"
    user.username = USERNAME
    assert user.save, "Unsaved the user with all the parameters correct:\n" + user.attributes.to_s
    user = create_default_user
    assert_not user.save, "Saved the user with a duplicated email"
  end

end
