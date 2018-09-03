# frozen_string_literal: true

intent 'Intro' do
  response_text = [
    '<speak>',
      'I currently have 2 enabled features. Stretching Tips and Anatomy Facts.',
      'I can give you stretching tips if you say <break time="500ms" />',
      'Alexa, ask Anatomy Nerd for a stretching tip <break time="500ms" />',
      'You can also ask specifically for particular categories like hand stretching tips or desk stretching tips.',
      '<break time="1250ms" />',
      'I can also tell you the anatomy fact of the day if you say <break time="500ms" />',
      'Alexa, ask Anatomy Nerd for the anatomy fact of the day <break time="500ms" />',
      'You can also ask for a random anatomy fact.',
    '</speak>'
  ].join(' ')

  tell(response_text, ssml: true)
end
