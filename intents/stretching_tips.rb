# frozen_string_literal: true

intent 'StretchingTips' do
  if (type = request.slot_value('StretchType'))
    tips_by_type = StretchingTips.for_category(type)
    if tips_by_type.any?
      tell(tips_by_type.random)
    else
      response_text = [
        "Sorry, I don't have any stretching tips for the category #{type}.",
        'Here is a random stretching tip instead.',
        StretchingTips.random
      ].join(' ')

      tell(response_text)
    end
  else
    tell(StretchingTips.random)
  end
end
