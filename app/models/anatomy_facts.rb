# frozen_string_literal: true

class AnatomyFacts
  def fact_of_the_day
    configured_facts.find do |fact|
      fact.date == todays_date
    end
  end

  def random
    configured_facts.sample
  end

  class << self
    delegate :fact_of_the_day, :random, to: :new
  end

  private

  def todays_date
    Time.zone.today
  end

  def configured_facts
    config.map do |tip|
      Struct.new(:text, :date) do
        def to_ssml
          <<~SSML
            Fact of the day for <say-as interpret-as='date'>#{date.strftime('%Y%m%d')}</say-as>.
            #{text}
          SSML
        end
      end.new(tip['text'], tip['date'])
    end
  end

  def config
    AnatomyNerdConfig.config['anatomy_facts']
  end
end
