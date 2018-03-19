defmodule Bcr do
  @moduledoc """
  Elixir's first Bar Character Recognition library.
  """

  @bar_char_width 3
  @bar_char_height 3

  @doc """
  Processes the file of bar chars at the given path and returns a list of string integers.
  File must contain bar characters separated by empty lines.
  File must end with an empty line.
  """
  def process_file(path) do
    ~r/(.+\n){#{@bar_char_height}}\n/
    |> Regex.scan(File.read!(path))
    |> Enum.map(&List.first/1)
    |> Enum.map(&bar_chars_to_int_str/1)
  end

  @doc """
  Converts multiple bar characters in the same string to an integer string.
  No trailing whitespace should be removed from the input.
  Each line must end in a newline character.
  The final line must be blank.
  """
  def bar_chars_to_int_str(bar_chars) do
    bar_chars
    |> bar_chars_to_list()
    |> Enum.map(&bar_char_to_int/1)
    |> Enum.join()
  end

  @doc """
  Converts multiple bar characters in the same string to a list of bar characters.
  No trailing whitespace should be removed from the input.
  Each line must end in a newline character.
  The final line must be blank.
  """
  def bar_chars_to_list(bar_chars) do
    bar_chars
    |> String.replace_suffix("\n\n", "")
    |> String.split("\n")
    |> Enum.map(&(Regex.scan(~r/.{#{@bar_char_width}}/, &1) |> List.flatten()))
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&(Enum.join(&1, "\n") <> "\n"))
  end

  @doc """
  Converts a single bar character to an integer.
  No trailing whitespace should be removed from the input.
  Each line must end in a newline character.
  """
  def bar_char_to_int("""
       _ 
      | |
      |_|
      """),
      do: 0

  def bar_char_to_int("""
         
        |
        |
      """),
      do: 1

  def bar_char_to_int("""
       _ 
       _|
      |_ 
      """),
      do: 2

  def bar_char_to_int("""
       _ 
       _|
       _|
      """),
      do: 3

  def bar_char_to_int("""
         
      |_|
        |
      """),
      do: 4

  def bar_char_to_int("""
       _ 
      |_ 
       _|
      """),
      do: 5

  def bar_char_to_int("""
       _ 
      |_ 
      |_|
      """),
      do: 6

  def bar_char_to_int("""
       _ 
        |
        |
      """),
      do: 7

  def bar_char_to_int("""
       _ 
      |_|
      |_|
      """),
      do: 8

  def bar_char_to_int("""
       _ 
      |_|
       _|
      """),
      do: 9
end
