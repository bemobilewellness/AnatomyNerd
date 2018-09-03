# frozen_string_literal: true

##
# Controller to respond to Alexa API requests
class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render(
      json: Ralyxa::Skill.handle(request).tap do |skill_response|
        puts "Response sent to Alexa:\n\t#{skill_response.as_json}" if skill_response.as_json
      end
    )
  end
end
