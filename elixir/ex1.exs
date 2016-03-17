"What is your name? "
  |> IO.gets
  |> String.strip
  |> (&("Hello, #{&1}, nice to meet you")).()
  |> IO.puts