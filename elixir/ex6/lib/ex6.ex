use Timex

defmodule Ex6 do
  age = "What is your current age? "
    |> IO.gets
    |> String.strip
    |> String.to_integer

  retire = "What age would you like to retire? "
    |> IO.gets
    |> String.strip
    |> String.to_integer

  year = Date.today |> Map.fetch!(:year)

  years_left = retire-age

  cond do
    years_left > 0 ->
      IO.puts "You have #{years_left} years until you can retire"
      IO.puts "It's #{year}, so you can retire in #{years_left+year}"
    years_left < 0 ->
      IO.puts "You can already retire! You are #{years_left*-1} years over your retirement age"
  end


end
