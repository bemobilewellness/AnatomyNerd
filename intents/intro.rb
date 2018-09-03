# frozen_string_literal: true

intent 'Intro' do
  response_text = [
    '<speak>',
      'I can give you stretching tips by asking <break time="500ms" />',
      'Anatomy Nerd give me a stretching tip <break time="500ms" />',
      'You can also ask specifically for particular categories like neck stretching tips or desk stretching tips.',
    '</speak>'
  ].join(' ')

  tell(response_text, ssml: true)
end
