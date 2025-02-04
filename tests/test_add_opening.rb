require 'minitest/autorun'
require_relative "/workspaces/CLI-Project/library.rb"

class TestChessLibrary < Minitest::Test
  def setup
    @library = Library.new 
    @library.instance_variable_set(:@openings, [])
  end

  def test_add_opening
    input = StringIO.new("Sicilian Defense\nwhite\ne4 c5\n")
    $stdin = input

    output = capture_io { @library.add_opening }.first

    $stdin = STDIN 

    expected_output = "Enter opening name: Is this opening played by black or white: Enter the move order: Opening added.\n"
    assert_equal expected_output, output

    
    added_opening = @library.instance_variable_get(:@openings).first

    refute_nil added_opening
    assert_equal "Sicilian Defense", added_opening.name
    assert_equal "white", added_opening.color
    assert_equal "e4 c5", added_opening.move_order
  end
end
