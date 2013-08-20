ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/autorun"
require "minitest/mock"
require 'minitest/emoji'

class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods

  let(:user) { create(:user) }

  def login
    session[:user_id] = user.id
  end
end
