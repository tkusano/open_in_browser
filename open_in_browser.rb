# -*- coding: utf-8 -*-

require "open3"

Plugin.create(:open_in_browser) do

  command(:open_in_browser,
          name: 'Open in Browser',
          condition: Plugin::Command[:HasOneMessage],
          visible: true,
          role: :timeline) do |opt|
    message = opt.messages.first
    screen_name = message.user[:idname]
    url = "https://twitter.com/#{screen_name}/status/#{message.id}"
    Open3.capture3('/usr/bin/sensible-browser', url)
  end

end
