first = "First number: " |> IO.gets |> String.strip |> String.to_integer
second = "Second number: " |> IO.gets |> String.strip |> String.to_integer

sum = first+second
diff = first-second
prod = first-second
quot = first/second

IO.puts "#{first} + #{second} = #{sum}
#{first} - #{second} = #{diff}
#{first} * #{second} = #{prod}
#{first} / #{second} = #{quot}"
