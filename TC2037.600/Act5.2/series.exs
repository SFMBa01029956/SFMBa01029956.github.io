#PARALLELISM
#Accelerating calculations with threads

defmodule ParallelFX do
  #Desired formula: -1^(n+1) * 4/(2n-1)
  def pi_series(n), do: -1 ** (n + 1) * 4 / (2 * n - 1)

  def get_pi_seq(0), do: 0
  def get_pi_seq(limit), do: do_get_pi(1, limit, 0)

  defp do_get_pi(start, finish, res) when start > finish, do: res
  defp do_get_pi(start,finish, res), do: do_get_pi(start + 1, finish, res + pi_series(start))

  def get_pi_par(limit, threads \\ system.schedulers) do
    range = div(limit, threads)
    1..threads
    |> Enum.map(&Task.async(fn -> do_get_pi(1+(&1 -1) * range,&1 * range, 0) end))
    |> Enum.map(&Task.await(&1))
    |> Enum.sum()
  end

  defp get_ranges(x,n) when x >= n, do: res
end
