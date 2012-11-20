def unique_chars?(text)
  return true if text.nil?

  character_counts = Hash.new(0)
  text.each_char { |c| character_counts[c] += 1 }
  character_counts.values.select { |v| v > 1 }.size == 0
end

require "test/unit"

class TestIt < Test::Unit::TestCase
  def test_should_be_considered_unique_if_empty
    assert unique_chars?("")
    assert unique_chars?(nil)
  end
  
  def test_should_be_considered_unique_if_one_char
    assert unique_chars?("A")
  end
  
  def test_should_be_considered_unique_if_no_repeating_chars
    assert unique_chars?("ABC")
  end
  
  def test_should_be_considered_not_unique_if_repeating_chars
    assert !unique_chars?("ABCB")
  end
end
