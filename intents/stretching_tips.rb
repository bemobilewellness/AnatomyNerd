# frozen_string_literal: true

intent 'StretchingTips' do
  if (type = request.slot_value('StretchType'))
    tips_by_type = StretchingTips.for_category(type)
    if tips_by_type.any?
      respond(tips_by_type.random)
    else
      response_text = [
        "Sorry, I don't have any stretching tips for the category #{type}.",
        'Here is a random stretching tip instead.',
        StretchingTips.random
      ].join(' ')

      respond(response_text)
    end
  else
    respond(StretchingTips.random)
  end
end
