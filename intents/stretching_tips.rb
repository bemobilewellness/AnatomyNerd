# frozen_string_literal: true

intent 'StretchingTips' do
  if (type = request.slot_value('StretchType'))
    tips_by_type = StretchingTips.for_category(type)
    if tips_by_type.any?
      tell(
        [
          '<speak>',
          tips_by_type.random,
          SignOff,
          '</speak>'
        ].join(' '),
        ssml: true
      )
    else
      response_text = [
        '<speak>',
        "Sorry, I don't have any stretching tips for the category #{type}.",
        'Here is a random stretching tip instead.',
        StretchingTips.random,
        SignOff,
        '</speak/>'
      ].join(' ')

      tell(response_text, ssml: true)
    end
  else
    tell(
      [
        '<speak>',
        StretchingTips.random,
        SignOff,
        '</speak>'
      ].join(' '),
      ssml: true
    )
  end
end
