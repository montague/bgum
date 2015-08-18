# use this to generate any additional src files prior to
# building the static pages
 Enum.each(~w(a b c d), fn file ->
   File.open!("#{file}.html.eex", [:write, :utf8], fn f ->
     f |> IO.write("<h1>Hi mom! from #{file}</h1>")
   end)
 end)
