#SALVADOR FEDERICO MILANES BRANIFF - A01029956
#TONATIUH REYES HUERTA - A01025459
defmodule Parser do

  def json_to_html(in_filename, out_filename) do
    #Loading html template before inserting spans
    template = File.read!("./html_template.html")
    html2 =
      in_filename
      |> File.stream!()
      |> Enum.map(&pair_from_line/1)
      |> Enum.join("\n")
    html = template <> html2 <> "\n    </pre>\n  </body>\n</html>"
    File.write(out_filename, html)
  end

  def check_punctuation_repl(line) do
    if Regex.match?(~r/^\{|\}|\:/,line) do
     Regex.replace(~r/^\s+/, line, "<span class='punctuation'>#{Regex.run(~r/\{|\}|\:/,line)}</span>")
    else
      line
    end
  end

  def check_object_key_repl(line) do
    if Regex.match?(~r|^\"\w+\"+|,line) do
     Regex.replace(~r/^\s+/, line, "<span class='object-key'>#{Regex.run(~r/\"\w+\"/,line)}</span>")
    else
      line
    end
  end

  def check_punctuation(line) do
    if Regex.match?(~r/^\{|\}|\:/,line) do
     "  #{Regex.run(~r/^\s+/, line)}<span class='punctuation'>#{Regex.run(~r/\{|\}|\:/,line)}</span>"
    else
      line
    end
  end

  def check_object_key(line) do
    if Regex.match?(~r|^\"\w+\"+|,line) do
      { Regex.run(~r|^\"\w+\"+|,line), object-key}
      #"  #{Regex.run(~r/^\s+/, line)}<span class='object-key'>#{Regex.run(~r/\"\w+\"/,line)}</span>"
    else
      line
    end
  end

  def pair_from_line("") do
    #Receive line -> Check class
    #check_object_key(line)
    #|> check_punctuation()
    #check_punctuation(line)
    #|> check_object_key()
    #"endOfLine"
  #end

  def pair_from_line(line) do
    String.split_at(line,10)
    #Receive line -> Check class
    [token, type] = cond do
      check_object_key(line) -> "<"

      check_punctuation()
    end

  pair_from_line()
  end

  def xson_to_html() do
    json_to_html("./samples/example1.json","./results/result.html")
  end
end
