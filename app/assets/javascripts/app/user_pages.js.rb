# frozen_string_literal: true

require 'opal'
require 'opal-ferro'
require_relative 'lib/base_document'
require_tree './components'

class UserInfo < BaseDocument
  def initialize(user, connection_url, no_user_error, message)
    @user = user
    @connection_url = connection_url
    @no_user_error = no_user_error
    @message = message
    super
  end

  def cascade
    if @user
      add_child :message, Panel, content: @message if @message
      add_child :user_info, Panel, title: @user[:label]
      user_info.add_content :team, Team, team: @user[:team]

      add_child :qr_code, Panel, title: 'Your QR-Code'
      qr_code.add_content :qr_code, QrCode, url: @connection_url
    else
      add_child :error, Panel, content: @no_user_error
    end
  end
end

class RegisterUser < BaseDocument
  def initialize(register_url)
    @register_url = register_url
    super
  end

  def cascade
    add_child :registration, Panel, title: 'Welcome to Kaigress'
    form = registration.add_content :form, Form, for: :user, url: @register_url
    form.add_label :nickname, 'Nickname'
    form.add_text_field :nickname
    form.add_submit_button 'Create User'
  end
end