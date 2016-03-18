defmodule Ex9 do
  @gallon_coverage 350

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

  def get_ceiling_size do
    length = get_length
    width = get_width
    length*width
  end

  def calc_gallons(size) do
    size/@gallon_coverage |> Float.ceil |> Kernel.trunc
  end

  defp get_length do
    {bool, length} = "Length of room: "
      |> IO.gets
      |> String.strip
      |> Ex9.is_int
    
    case {bool, is_negative length} do
      {true, false} -> length
      _             ->
        IO.puts "Must be a positive integer"
        get_length
    end
  end
  
  defp get_width do
    {bool, width} = "Width of room: "
      |> IO.gets
      |> String.strip
      |> Ex9.is_int
    
    case {bool, is_negative width} do
      {true, false} -> width
      _             ->
        IO.puts "Must be a positive integer"
        get_width
    end
  end
end

ceiling = Ex9.get_ceiling_size
gallons = Ex9.calc_gallons(ceiling)

cond do
  gallons == 1 -> IO.puts "You need 1 gallon to cover #{ceiling} square feet"
  true -> IO.puts "You need #{gallons} gallons to cover #{ceiling} square feet"
end
