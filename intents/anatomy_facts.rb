# frozen_string_literal: true

intent 'AnatomyFacts' do
  if request.slot_value('Daily')
    response_text = if (fact_of_the_day = AnatomyFacts.fact_of_the_day)
                      [
                        '<speak>',
                        fact_of_the_day.to_ssml,
                        SignOff,
                        '</speak>'
                      ].join(' ')
                    else
                      [
                        '<speak>',
                        'Sorry, there is no fact for the day.',
                        'Instead we have selected a random fact from the past.',
                        AnatomyFacts.random.to_ssml,
                        SignOff,
                        '</speak>'
                      ].join(' ')
                    end
    tell(response_text, ssml: true)
  else
    tell(
      [
        '<speak>',
        AnatomyFacts.random.text,
        SignOff,
        '</speak>'
      ].join(' '),
      ssml: true
    )
  end
end
