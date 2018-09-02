class StretchingTips
  def find_by_category(category)
    all_tips.find do |tip|
      tip.categories.inlcude?(category)
    end.try(:text)
  end

  def random
    all_tips.sample.text
  end

  private

  def all_tips
    config.map do |tip|
      Struct.new(:text, :categories).new(tip['text'], tip['categories'])
    end
  end

  def config
    YAML.load_file('./config/stretching_tips.yml')
  end
end
