# frozen_string_literal: true

intent 'AnatomyFacts' do
  if request.slot_value('Daily')
    if (fact_of_the_day = AnatomyFacts.fact_of_the_day)
      respond(fact_of_the_day.to_ssml, ssml: true)
    else
      respond(
        AnatomyFacts.random.to_ssml(
          'Sorry, there is no fact for the day. Instead we have selected a random fact from the past.'
        ),
        ssml: true
      )
    end
  else
    respond(AnatomyFacts.random.text)
  end
end
