# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    return deliveries_path if resource.is_a?(Angel)

    super
  end
end
