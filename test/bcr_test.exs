defmodule BcrTest do
  use ExUnit.Case
  doctest Bcr

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

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 0}
    end

    test "can convert to 1" do
      bar_char = """
         
        |
        |
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 1}
    end

    test "can convert to 2" do
      bar_char = """
       _ 
       _|
      |_ 
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 2}
    end

    test "can convert to 3" do
      bar_char = """
       _ 
       _|
       _|
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 3}
    end

    test "can convert to 4" do
      bar_char = """
         
      |_|
        |
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 4}
    end

    test "can convert to 5" do
      bar_char = """
       _ 
      |_ 
       _|
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 5}
    end

    test "can convert to 6" do
      bar_char = """
       _ 
      |_ 
      |_|
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 6}
    end

    test "can convert to 7" do
      bar_char = """
       _ 
        |
        |
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 7}
    end

    test "can convert to 8" do
      bar_char = """
       _ 
      |_|
      |_|
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 8}
    end

    test "can convert to 9" do
      bar_char = """
       _ 
      |_|
       _|
      """

      assert Bcr.bar_char_to_int(bar_char) == {:ok, 9}
    end
  end
end
