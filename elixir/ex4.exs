noun = "Enter a noun: " |> IO.gets |> String.strip
verb = "Enter a verb: " |> IO.gets |> String.strip
adjective = "Enter a adjective: " |> IO.gets |> String.strip
adverb = "Enter a adverb: " |> IO.gets |> String.strip

IO.puts "You #{verb} your #{adjective} #{noun} #{adverb}? Good one!"