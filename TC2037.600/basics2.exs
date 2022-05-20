#Salvador Milanes - A01029956
#ELIXIR Basics PT-2

defmodule Lists do
  @moduledoc"""
  Functions to work with lists
  """
  def sum(list) do
    @doc """
    Sum items in a list
    """
    if list == [] do
      0
    else
      hd(list) + sum(tl(list))
    end
  end
  def sum_tail(list), do: do_sum_tail(list,0)
    defp do_sum_tail([],result), do: result
    defp do_sum_tail(list,result), do: do_sum_tail(tl(list),result+hd(list))
  end
end

#[a|b] Lex for head-a and rest (tail)-b
#a ++ b append b in a
