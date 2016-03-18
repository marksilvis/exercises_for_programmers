use Timex

defmodule Ex6 do

  def is_int(str) do
    case Integer.parse(str) do
      {num, ""}  -> {true, num}
      {_num, _r} -> {false, 0}
      :error     -> {false, 0}
    end
  end
  
  def is_negative(int) do
    int < 0
  end
  
  def get_age do
    {bool, int} = "What is your current age? "
      |> IO.gets
      |> String.strip
      |> Ex6.is_int
    
    case {bool, is_negative int} do
      {true, false} -> int
      _             ->
        IO.puts "Must be a positive integer"
        get_age
    end
  end

  def get_retire do
    {bool, int} = "What age would you like to retire? "
      |> IO.gets
      |> String.strip
      |> Ex6.is_int
    
    case {bool, is_negative int} do
      {true, false} -> int
      _             ->
        IO.puts "Must be a positive integer"
        get_retire
    end
  end
end

age = Ex6.get_age
retire = Ex6.get_retire
years_left = retire-age
year = Date.today |> Map.fetch!(:year)

cond do
  years_left > 0 ->
    IO.puts "You have #{years_left} years until you can retire"
    IO.puts "It's #{year}, so you can retire in #{years_left+year}"
  years_left == 0 ->
    IO.puts "Good news, you can retire this year!"
  years_left < 0 ->
    IO.puts "You can already retire! You are #{years_left*-1} years over your retirement age"
end
