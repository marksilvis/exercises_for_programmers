defmodule Ex8 do
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
  
  def get_people do
    {bool, width} = "Number of people: "
      |> IO.gets
      |> String.strip
      |> Ex8.is_int
    
    case {bool, is_negative width} do
      {true, false} -> width
      _             ->
        IO.puts "Must be a positive integer"
        get_people
    end
  end
  
  def get_pizzas do
    {bool, length} = "Number of pizzas: "
      |> IO.gets
      |> String.strip
      |> Ex8.is_int
    
    case {bool, is_negative length} do
      {true, false} -> length
      _             ->
        IO.puts "Must be a positive integer"
        get_pizzas
    end
  end

  def get_slices do
    {bool, length} = "Slices per pizza: "
      |> IO.gets
      |> String.strip
      |> Ex8.is_int
    
    case {bool, is_negative length} do
      {true, false} -> length
      _             ->
        IO.puts "Must be a positive integer"
        get_slices
    end
  end
end

people = Ex8.get_people
pizzas = Ex8.get_pizzas
slices = Ex8.get_slices
total_slices = pizzas*slices
slices_per_person = div(total_slices, people)
slices_left = rem(total_slices, people)

cond do
  slices_per_person == 1 ->
    IO.puts "Each person gets 1 slice of pizza"
  true                   ->
    IO.puts "Each person gets #{slices_per_person} slices of pizza"
end

cond do
  slices_left == 1 ->
    IO.puts "1 slice leftover"
  true             ->
    IO.puts "#{slices_left} slices leftover"
end