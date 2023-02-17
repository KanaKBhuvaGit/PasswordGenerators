defmodule PasswordGeneratorTest do
  use ExUnit.Case
  doctest PasswordGenerator
  alias PasswordGenerator.PasswordGenerator

  setup do
    options = %{
      "length" => "10",
      "numbers" => "false",
      "uppercase" => "false",
      "symbols" => "false"
    }

    option_type = %{
      lowercase: Enum.map(?a..?z, &<<&1>>),
      numbers: Enum.map(0..9, &Integer.to_string(&1)),
      uppercase: Enum.map(?A..?Z, &<<&1>>),
      symbols: String.split("~`!@#$%^&*()_+-=[]{}/\'|<>,.", "", trim: true)
    }

    {:ok, result} = PasswordGenerator.generate(options)

    %{
      option_type: option_type,
      result: result
    }
  end

  test "returns a string", %{result: result} do
    assert is_bitstring(result)
  end

  test "returns error when no length is given" do
    option = %{"invalid" => "false"}

    assert {:error, _error} = PasswordGenerator.generate(option)
  end

  test "returns error when length is not an integer" do
    option = %{"length" => "ab"}

    assert {:error, _error} = PasswordGenerator.generate(option)
  end

  test "length of returned string is the option provided" do
    length_option = %{"length" => "5"}
    {:ok, result} = PasswordGenerator.generate(length_option)

    assert 5 = String.length(result)
  end

  test "returns a lowercase string just with the length", %{option_type: options} do
    length_option = %{"length" => "5"}
    {:ok, result} = PasswordGenerator.generate(length_option)

    assert String.contains?(result, options.lowercase)

    refute String.contains?(result, options.uppercase)
    refute String.contains?(result, options.numbers)
    refute String.contains?(result, options.symbols)
  end

  test "return error when options values are not booleans" do
    options = %{
      "length" => "10",
      "numbers" => "invalid",
      "uppercase" => "0",
      "symbols" => "false"
    }

    assert {:error, _error} = PasswordGenerator.generate(options)
  end

  test "returns error when options not allowed" do
    option = %{"length" => "5", "invalid" => "true"}

    assert {:error, _error} = PasswordGenerator.generate(option)
  end

  test "returns error when 1 options not allowed" do
    option = %{"length" => "5", "numbers" => "true", "invalid" => "true"}

    assert {:error, _error} = PasswordGenerator.generate(option)
  end

  test "returns string uppercase", %{option_type: options} do
    options_with_uppercase = %{
      "length" => "10",
      "numbers" => "false",
      "uppercase" => "true",
      "symbols" => "false"
    }

    {:ok, result} = PasswordGenerator.generate(options_with_uppercase)

    assert String.contains?(result, options.uppercase)

    refute String.contains?(result, options.numbers)
    refute String.contains?(result, options.symbols)
  end

  test "returns string just with numbers", %{option_type: options} do
    options_with_numbers = %{
      "length" => "10",
      "numbers" => "true",
      "uppercase" => "false",
      "symbols" => "false"
    }

    {:ok, result} = PasswordGenerator.generate(options_with_numbers)

    assert String.contains?(result, options.numbers)

    refute String.contains?(result, options.uppercase)
    refute String.contains?(result, options.symbols)
  end

  test "returns string with uppercase and numbers", %{option_type: options} do
    options_included = %{
      "length" => "10",
      "numbers" => "true",
      "uppercase" => "true",
      "symbols" => "false"
    }

    {:ok, result} = PasswordGenerator.generate(options_included)

    assert String.contains?(result, options.numbers)
    assert String.contains?(result, options.uppercase)

    refute String.contains?(result, options.symbols)
  end

  test "returns string just with symbols", %{option_type: options} do
    options_with_symbols = %{
      "length" => "10",
      "numbers" => "false",
      "uppercase" => "false",
      "symbols" => "true"
    }

    {:ok, result} = PasswordGenerator.generate(options_with_symbols)

    assert String.contains?(result, options.symbols)

    refute String.contains?(result, options.uppercase)
    refute String.contains?(result, options.numbers)
  end

  test "returns string with all included options", %{option_type: options} do
    options_included = %{
      "length" => "10",
      "numbers" => "true",
      "uppercase" => "true",
      "symbols" => "true"
    }

    {:ok, result} = PasswordGenerator.generate(options_included)

    assert String.contains?(result, options.symbols)
    assert String.contains?(result, options.uppercase)
    assert String.contains?(result, options.numbers)
  end
end
