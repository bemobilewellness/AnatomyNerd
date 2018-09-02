# frozen_string_literal: true

intent 'StretchingTips' do
  respond(StretchingTips.new.random)
end
