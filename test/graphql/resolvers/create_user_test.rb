require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, {})
  end

  test 'creating new user' do
    user = perform(
      name: 'John Doe',
      authProvider: {
        email: {
          email: 'john@example.com',
          password: 'qwerty'
        }
      }
    )

    assert user.persisted?
    assert_equal user.email, 'john@example.com'
    assert_equal user.name, 'John Doe'
  end
end