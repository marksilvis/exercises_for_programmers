defmodule Ex2 do
  def count_chars() do
    count_chars("")
  end

  def count_chars(str) when str == "" do
    input = "Input string: " |> IO.gets |> String.strip

    Ex2.count_chars(input)
  end

  def count_chars(str) do
    len = String.length(str)
    IO.puts "#{str} has #{len} characters"
  end
end

Ex2.count_chars
