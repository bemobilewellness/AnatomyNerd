# frozen_string_literal: true

##
# Allow selecting from a category specific search tip or select a random tip
class StretchingTips
  attr_reader :tips
  delegate :any?, :present?, :blank?, :empty?, to: :tips

  def initialize(tips = nil)
    @tips = tips || configured_tips
  end

  def for_category(category)
    self.class.new(
      tips.select do |tip|
        tip.categories.include?(category)
      end
    )
  end

  def random
    tips.sample.text
  end

  class << self
    delegate :for_category, :random, to: :new
  end

  private

  def configured_tips
    config.map do |tip|
      Struct.new(:text, :categories).new(tip['text'], tip['categories'])
    end
  end

  def config
    YAML.load_file('./config/stretching_tips.yml')
  end
end
