require 'minitest/autorun'
require '../../lib/wrapper'


class TestDisplayWrapper < Minitest::Test

  def setup
    @text = "This is text"
    @title = "Fancy Title"
    @subtitle = "Subtitles are where the real stuff exists"
    @sound = "Horn"
  end

  def test_generate_command
    command = DisplayWrapper.send(:generate_command, text: @text, title: @title, subtitle: @subtitle, sound: @sound)
    expected_text = <<-TEXT
/usr/bin/osascript -e 'display notification "This is text" with title "Fancy Title" subtitle "Subtitles are where the real stuff exists" sound name "Horn"'
TEXT
    assert_equal expected_text.chomp, command
  end

  def test_execute_command_successfully
    DisplayWrapper.execute(text: @text, title: @title, subtitle: @subtitle, sound: @sound)
    assert_equal 0, $?
  end

end
