#PARALLELISM
#Accelerating calculations with threads

defmodule ParallelFX do
  #Desired formula: -1^(n+1) * 4/(2n-1)
  def pi_series(n), do: -1 ** (n + 1) * 4 / (2 * n - 1)

  def get_pi_seq(0), do: 0
  def get_pi_seq(limit), do: do_get_pi(1, limit, 0)

  defp do_get_pi(start, finish, res) when start > finish, do: res
  defp do_get_pi(start,finish, res), do: do_get_pi(start + 1, finish, res + pi_series(start))

  def get_pi_par(limit, threads) do
    range = div(limit, threads)

  end
end
