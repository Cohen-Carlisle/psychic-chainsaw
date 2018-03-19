defmodule Bcr do
  @moduledoc """
  Elixir's first Bar Character Recognition library.
  """

  @bar_char_width 3

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
      """) do
    {:ok, 0}
  end

  def bar_char_to_int("""
         
        |
        |
      """) do
    {:ok, 1}
  end

  def bar_char_to_int("""
       _ 
       _|
      |_ 
      """) do
    {:ok, 2}
  end

  def bar_char_to_int("""
       _ 
       _|
       _|
      """) do
    {:ok, 3}
  end

  def bar_char_to_int("""
         
      |_|
        |
      """) do
    {:ok, 4}
  end

  def bar_char_to_int("""
       _ 
      |_ 
       _|
      """) do
    {:ok, 5}
  end

  def bar_char_to_int("""
       _ 
      |_ 
      |_|
      """) do
    {:ok, 6}
  end

  def bar_char_to_int("""
       _ 
        |
        |
      """) do
    {:ok, 7}
  end

  def bar_char_to_int("""
       _ 
      |_|
      |_|
      """) do
    {:ok, 8}
  end

  def bar_char_to_int("""
       _ 
      |_|
       _|
      """) do
    {:ok, 9}
  end

  def bar_char_to_int(bar_char) when is_binary(bar_char) do
    {:error, :bar_char_not_recognized}
  end
end
