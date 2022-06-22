#SALVADOR FEDERICO MILANES BRANIFF - A01029956
#TONATIUH REYES HUERTA - A01025459
defmodule Parser do

  def json_to_html(in_filename, out_filename) do
    #Loading html template before inserting spans
    template = File.read!("./html_template.html")
    html2 =
      in_filename
      #Chain of functions to do for each line
      |> File.stream!()
      |> Enum.map(&pair_from_line/1)
      |> Enum.join("\n")
    html = template <> html2 <> "\n    </pre>\n  </body>\n</html>"
    File.write(out_filename, html)
  end

  def check_spaces({line,res}) do
    token = Regex.run(~r/^\s+/,line)
    if token != nil do
      {token, rest} = String.split_at(line, String.length(hd(token)))
      {rest,res<>"#{token}"}
    else
      {line,res}
    end
  end

  def check_punctuation({line,res}) do
    token = Regex.run(~r/^[{}\,:\[\]]+/, line)
    if token != nil do
      {token, rest} = String.split_at(line, String.length(hd(token)))
      {rest,res<>"<span class='punctuation'>#{token}</span>"}
    else
      {line, res}
    end
  end

  def check_object_key({line,res}) do
    token = Regex.run(~r/^"[\w0-9:-_]+" *(?=\s*:)/, line)
    if token != nil do
      {token, rest} = String.split_at(line, String.length(hd(token)))
      {rest,res<>"<span class='key'>#{token}</span>"}
    else
      {line,res}
    end
  end

  def check_string({line,res}) do
    token = Regex.run(~r/^ ?(?=[\[]*)"[A-Za-z0-9 .,-:;\-\+\_\*\&\?\'\=\\\/\(\)@]*"(?=[,\]]*)/, line)
    if token != nil do
      {token, rest} = String.split_at(line, String.length(hd(token)))
      {rest,res<>"<span class='string'>#{token}</span>"}
    else
      {line,res}
    end
  end

  def check_number({line,res}) do
    token = Regex.run(~r/^-?\d+(\.\d+)?([Ee][-+]?\d+)?/, line)
    if token != nil do
      {token, rest} = String.split_at(line, String.length(hd(token)))
      {rest,res<>"<span class='number'>#{token}</span>"}
    else
      {line,res}
    end
  end

  def check_reserved_word({line,res}) do
    token = Regex.run(~r/^true|^false|^null/, line)
    if token != nil do
      {token, rest} = String.split_at(line, String.length(hd(token)))
      {rest,res<>"<span class='reserved'>#{token}</span>"}
    else
      {line,res}
    end
  end

  def pair_from_line(line), do: pair_from_line_tuple({String.replace(line,"\n",""),""})
  defp pair_from_line_tuple({line, res}) when line == "" or line == "\n", do: res
  defp pair_from_line_tuple({line, res}) do
    check_spaces({line,res})
    |>check_punctuation()
    |> check_object_key()
    |> check_string()
    |> check_number()
    |> check_reserved_word()
    |> IO.inspect()
    |> pair_from_line_tuple()
  end

  def test_do() do
    json_to_html("./samples/example1.json","./results/result.html")
  end
end
