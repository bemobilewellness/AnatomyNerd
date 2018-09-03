# frozen_string_literal: true

class AnatomyNerdConfig
  ALLOWED_TYPES = %i[local github].freeze
  attr_reader :type
  def initialize(type: :local)
    raise ArgumentError unless ALLOWED_TYPES.include?(type.to_sym)
    @type = type
  end

  def config
    case type
    when :local
      local_source
    when :github
      raise NotImplementedError
    end
  end

  class << self
    def config
      type = Rails.env.production? ? :github : :local
      new(type: type).config
    end
  end

  private

  def local_source
    YAML.load_file('./config/anatomy_nerd.yml')
  end
end
