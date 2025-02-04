require 'minitest/autorun'
require '/workspaces/CLI-Project/library.rb'

class TestChessLibrary < Minitest::Test
  def setup
    @library = Library.new
    @library.instance_variable_set(:@openings, [])
  end

  def test_list_openings_with_no_openings
    output = capture_io { @library.list_openings }.first

    expected_output = "There aren't any openings in the library. Please add an opening.\n"
    assert_equal expected_output, output
  end

  def test_list_openings_with_some_openings
    openings = [
      Opening.new("Sicilian Defense", "e4 c5", "black"),
      Opening.new("French Defense", "e4 e6", "black"),
      Opening.new("Ruy-Lopez", "e4 e5 Nf3 Nc6 Bb5", "white")
    ]
    @library.instance_variable_set(:@openings, openings)

    output = capture_io { @library.list_openings }.first

    expected_output = <<~OUTPUT
      All openings:
      Sicilian Defense is played by black: e4 c5
      French Defense is played by black: e4 e6
      Ruy-Lopez is played by white: e4 e5 Nf3 Nc6 Bb5
    OUTPUT

    assert_equal expected_output, output
  end
end
