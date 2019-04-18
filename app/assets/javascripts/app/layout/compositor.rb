# frozen_string_literal: true

class MyCompositor < Ferro::Compositor
  def map(_theme)
    {
      'Panel': %w[futurepanel],
      'Panel::Header': %w[futurepanel__header],
      'Panel::Title': %w[futurepanel__title],
      'Panel::Body': %w[futurepanel__body],
      'Panel::Divider': %w[futurepanel__divider],
      'Panel::Footer': %w[futurepanel__footer],
      'Team': %w[team],
      'Form': %w[futureinput futureinput--text],
      'Button': %w[futurebutton],
      'Checkbox': %w[checkbox],
      'UserInfo::StateLink': %w[state-link],
      'BaseDocument::CopyrightNotice': %w[copyright-notice],
      'Network': %w[team-network]
    }
  end
end