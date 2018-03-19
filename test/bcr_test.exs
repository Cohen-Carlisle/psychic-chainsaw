defmodule BcrTest do
  use ExUnit.Case
  doctest Bcr

  describe ".bar_chars_to_int_str/1" do
    test "converts multiple bar characters in the same string to an integer string" do
      bar_chars = """
          _  _     _  _  _  _  _ 
        | _| _||_||_ |_   ||_||_|
        ||_  _|  | _||_|  ||_| _|

      """

      assert Bcr.bar_chars_to_int_str(bar_chars) == "123456789"
    end
  end

  describe ".bar_chars_to_list/1" do
    test "converts multiple bar characters in the same string to a list of bar characters" do
      bar_chars = """
          _  _     _  _  _  _  _ 
        | _| _||_||_ |_   ||_||_|
        ||_  _|  | _||_|  ||_| _|

      """

      assert Bcr.bar_chars_to_list(bar_chars) == [
               """
                  
                 |
                 |
               """,
               """
                _ 
                _|
               |_ 
               """,
               """
                _ 
                _|
                _|
               """,
               """
                  
               |_|
                 |
               """,
               """
                _ 
               |_ 
                _|
               """,
               """
                _ 
               |_ 
               |_|
               """,
               """
                _ 
                 |
                 |
               """,
               """
                _ 
               |_|
               |_|
               """,
               """
                _ 
               |_|
                _|
               """
             ]
    end
  end

  describe ".bar_char_to_int/1" do
    test "can convert to 0" do
      bar_char = """
       _ 
      | |
      |_|
      """

      assert Bcr.bar_char_to_int(bar_char) == 0
    end

    test "can convert to 1" do
      bar_char = """
         
        |
        |
      """

      assert Bcr.bar_char_to_int(bar_char) == 1
    end

    test "can convert to 2" do
      bar_char = """
       _ 
       _|
      |_ 
      """

      assert Bcr.bar_char_to_int(bar_char) == 2
    end

    test "can convert to 3" do
      bar_char = """
       _ 
       _|
       _|
      """

      assert Bcr.bar_char_to_int(bar_char) == 3
    end

    test "can convert to 4" do
      bar_char = """
         
      |_|
        |
      """

      assert Bcr.bar_char_to_int(bar_char) == 4
    end

    test "can convert to 5" do
      bar_char = """
       _ 
      |_ 
       _|
      """

      assert Bcr.bar_char_to_int(bar_char) == 5
    end

    test "can convert to 6" do
      bar_char = """
       _ 
      |_ 
      |_|
      """

      assert Bcr.bar_char_to_int(bar_char) == 6
    end

    test "can convert to 7" do
      bar_char = """
       _ 
        |
        |
      """

      assert Bcr.bar_char_to_int(bar_char) == 7
    end

    test "can convert to 8" do
      bar_char = """
       _ 
      |_|
      |_|
      """

      assert Bcr.bar_char_to_int(bar_char) == 8
    end

    test "can convert to 9" do
      bar_char = """
       _ 
      |_|
       _|
      """

      assert Bcr.bar_char_to_int(bar_char) == 9
    end
  end
end
