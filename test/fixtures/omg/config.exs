# use this to generate any additional src files prior to
# building the static pages
 #Enum.each(~w(a b c d), fn file ->
   ## write to workspace for processing
   #path = Path.join(Bgum.Builder.workspace, "#{file}.html.eex")
   #File.open!(path, [:write, :utf8], fn f ->
     #f |> IO.write("<h1>Hi mom! from #{file}</h1>")
   #end)
 #end)
 # make sure the lib stuff is available
 IO.puts "======config running: #{Omg.title}"
 IO.puts "===in config!====>#{Bgum.Builder.templates}"
 Omg.build_pages(Bgum.Builder.templates)

