# frozen_string_literal: true

##
# Return the configured sign off text
class SignOff
  class << self
    def to_ssml
      return '' unless AnatomyNerdConfig.config['sign_off'].present?

      # adds a period to make sure a break happens before even if not ssml
      "<break time='1250ms' /> #{AnatomyNerdConfig.config['sign_off']}"
    end

    alias to_s to_ssml
  end
end
