defmodule Bcr.Checksum do
  @doc """
  Checks if the account number is valid.
  """
  def checksum(account_number) when byte_size(account_number) == 9 do
    int_list =
      account_number
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
      |> Enum.reverse()

    result =
      Enum.at(int_list, 0) + 2 * Enum.at(int_list, 1) + 3 * Enum.at(int_list, 2) +
        4 * Enum.at(int_list, 3) + 5 * Enum.at(int_list, 4) + 6 * Enum.at(int_list, 5) +
        7 * Enum.at(int_list, 6) + 8 * Enum.at(int_list, 7) + 9 * Enum.at(int_list, 8)

    rem(result, 11) == 0
  end

  def checksum(_), do: false
end
