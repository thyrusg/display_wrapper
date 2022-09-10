class DisplayWrapper
  OSASCRIPT_BIN = `which osascript`.chomp

  def self.notify(text:, title:, subtitle:, sound: "Frog")
    command = %(#{OSASCRIPT_BIN} -e 'display notification "#{text}" with title "#{title}" subtitle "#{subtitle}" sound name "#{sound}"')
    system(command)
  end
end
