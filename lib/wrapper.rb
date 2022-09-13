class DisplayWrapper
  OSASCRIPT_BIN = `which osascript`.chomp

  def self.execute(text:, title:, subtitle:, sound: "Frog")
    command = self.generate_command(text: text, title: title, subtitle: subtitle, sound: sound)
    system(command)
  end

  private

  def self.generate_command(text:, title:, subtitle:, sound: "Frog")
    %(#{OSASCRIPT_BIN} -e 'display notification "#{text}" with title "#{title}" subtitle "#{subtitle}" sound name "#{sound}"')
  end
end
