# frozen_string_literal: true

class AnatomyNerdConfig
  ALLOWED_TYPES = %i[local github].freeze
  REMOTE_CACHE_TTL = 5.minutes

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
      raise(ArgumentError, 'You must provide a "GITHUB_CONFIG_URL" env var') unless github_config_url
      github_source
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

  def github_source
    Rails.cache.fetch('anatomy_nerd/remote_config', expires_in: REMOTE_CACHE_TTL) do
      YAML.load(Faraday.get(github_config_url).body)
    end
  end

  def github_config_url
    ENV['GITHUB_CONFIG_URL']
  end
end
