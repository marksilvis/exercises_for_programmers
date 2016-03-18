defmodule Ex5 do
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

  def get_first do
    {bool, int} = "First number: "
      |> IO.gets
      |> String.strip
      |> Ex5.is_int
    
    case {bool, is_negative int} do
      {true, false} -> int
      _             ->
        IO.puts "Must be a positive integer"
        get_first
    end
  end

  def get_second do
    {bool, int} = "Second number: "
      |> IO.gets
      |> String.strip
      |> Ex5.is_int
    
    case {bool, is_negative int} do
      {true, false} -> int
      _             ->
        IO.puts "Must be a positive integer"
        get_second
    end
  end
end

first = Ex5.get_first
second = Ex5.get_second

sum = first+second
diff = first-second
prod = first-second
quot = first/second

IO.puts "#{first} + #{second} = #{sum}
#{first} - #{second} = #{diff}
#{first} * #{second} = #{prod}
#{first} / #{second} = #{quot}"
