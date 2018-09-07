# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnatomyFacts do
  subject(:facts) { described_class.new }

  describe '#fact_of_the_day' do
    before do
      expect(facts).to receive(:configured_facts).and_return(
        [
          double('Fact', date: Time.zone.today - 1.day, text: "Yesterday's Fact"),
          double('Fact', date: Time.zone.today, text: "Today's Fact")
        ]
      )
    end

    it 'finds a fact for the current date' do
      expect(facts.fact_of_the_day.text).to eq "Today's Fact"
    end
  end

  describe '#random' do
    let(:fact) { double('Fact', text: 'A fact') }
    before do
      expect(facts).to receive(:configured_facts).and_return([fact])
    end

    it { expect(facts.random).to eq fact }
  end

  describe "a fact's #to_ssml" do
    it 'introduces the fact and its date' do
      expect(facts.random.to_ssml).to match(
        /^Fact of the day for <say-as interpret-as='date'>\d{8}<\/say-as>/
      )
    end
  end
end
