defmodule BcrTest.ChecksumTest do
  use ExUnit.Case
  doctest Bcr

  describe ".checksum/1" do
    test "for a valid account number, returns true" do
      assert Bcr.Checksum.checksum("000000051") == true
    end

    test "for an invalid account number, returns false" do
      assert Bcr.Checksum.checksum("000000052") == false
    end
  end
end
