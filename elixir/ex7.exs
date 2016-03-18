defmodule Ex7 do
  @conversion 0.09290304

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
  
  def get_area do
    length = get_length
    width = get_width
    length*width
  end

  def to_meters(area) do
    area * @conversion
  end

  defp get_length do
    {bool, length} = "Length of room: "
      |> IO.gets
      |> String.strip
      |> Ex7.is_int
    
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
      |> Ex7.is_int
    
    case {bool, is_negative width} do
      {true, false} -> width
      _             ->
        IO.puts "Must be a positive integer"
        get_width
    end
  end
end

area = Ex7.get_area
meters = Ex7.to_meters(area)
IO.puts "Area is #{area} square feet"
IO.puts "#{meters} square meters"
