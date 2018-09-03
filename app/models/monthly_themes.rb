# frozen_string_literal: true

class MonthlyThemes
  def theme_of_the_month
    configured_themes.find do |theme|
      theme.month == this_month
    end
  end

  class << self
    delegate :theme_of_the_month, to: :new
  end

  private

  def this_month
    Time.zone.today.strftime('%Y-%m')
  end

  def configured_themes
    config.map do |theme|
      Struct.new(:text, :month) do
        def to_ssml
          m = Date.parse("#{month}-01")
          [
            '<speak>',
              "Anatomy Nerd's theme for the month of <say-as interpret-as='date'>#{m.strftime('%Y%m')}??</say-as>.",
              text,
            '</speak>'
          ].join(' ')
        end
      end.new(theme['text'], theme['month'])
    end
  end

  def config
    YAML.load_file('./config/monthly_themes.yml')
  end
end
