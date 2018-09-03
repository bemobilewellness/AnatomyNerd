# frozen_string_literal: true

intent 'MonthlyThemes' do
  if (theme_of_the_month = MonthlyThemes.theme_of_the_month)
    respond(theme_of_the_month.to_ssml, ssml: true)
  else
    respond('There is no theme set for the current month yet. Please check back later.')
  end
end
