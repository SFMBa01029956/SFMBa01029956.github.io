#Salvador Milanes - A01029956
#ELIXIR Basics

defmodule Learn do
  @doc """
  Compute factorial of x
  """
  def factTail(n,a) do
    if n==0 or n==1 do
      a
    else
      factTail(n-1,n*a)
    end
  end

  def fact(x) do
    factTail(x,1)
  end

  def fib(x) do
    if x==0 do
      x
    else
      fib(x-1) + fib(x-2)
    end
  end
end


"""
(define (fact-2 x)

    (define (fact-tail n a)
        (if (zero? n)
         a
          (fact-tail (- n 1) (* n a))))
"""
