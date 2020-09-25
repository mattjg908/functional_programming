defmodule Chapter4.Exercises do
  @moduledoc """
  This module is for the exercises at the end of Chapter 4
  """

  @doc """
  Write two recursive functions: one that finds the biggest element of a list
  and another that finds the smallest. You should use them like this: 

  Returns an integer.

  ## Examples

    Chapter4.Exercises.max([4, 2, 16, 9, 10])
    => 16

    Chapter4.Exercises.min([4, 2, 16, 9, 10])
    => 2

  """
  def max([]), do: nil
  def max([max_int] = _list), do: max_int
  def max([h | [h2 | t]]) when h >= h2, do: max([h | t])
  def max([h | [h2 | t]]) when h < h2, do: max([h2 | t])

  def min([]), do: nil
  def min([min_int] = _list), do: min_int
  def min([h | [h2 | t]]) when h <= h2, do: min([h | t])
  def min([h | [h2 | t]]) when h > h2, do: min([h2 | t])
end
