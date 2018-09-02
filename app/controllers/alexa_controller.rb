# frozen_string_literal: true

##
# Controller to respond to Alexa API requests
class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Ralyxa::Skill.handle(request)
  end
end
