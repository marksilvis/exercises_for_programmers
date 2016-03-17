quote = "What is the quote? " |> IO.gets |> String.strip
author = "Who said it? " |> IO.gets |> String.strip
IO.puts "Quoth " <> author <> ", \"" <> quote <> "\""