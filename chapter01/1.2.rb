class NilClass
  def esrever
    self
  end
end

class String
  def esrever
    characters = self.split(//)
    len = characters.size
    characters[0...len/2].each_with_index do |c,i|
      temp = characters[len-1-i]
      characters[len-i-1] = c
      characters[i] = temp
    end
    characters.join
  end
end

require "test/unit"

class TestIt < Test::Unit::TestCase
  def test_should_reverse_nil_strings
    assert_nil nil.esrever
  end
  
  def test_should_reverse_empty_strings
    assert_equal "", "".esrever
  end
  
  def test_should_reverse_one_character_strings
    assert_equal "A", "A".esrever
  end

  def test_should_reverse_longer_strings_with_odd_number_of_characters
    assert_equal "ABCDE", "EDCBA".esrever
  end

  def test_should_reverse_longer_strings_with_even_number_of_characters
    assert_equal "ABCD", "DCBA".esrever
  end
end
