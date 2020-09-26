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


  def test_data do
    [%{title: "Longsword", price: 50, magic: false},
     %{title: "Healing Potion", price: 60, magic: true},
     %{title: "Rope", price: 10, magic: false},
     %{title: "Dragon's Spear", price: 100, magic: true}]
  end

  @doc """
  In the section Transforming Lists, we traveled to a fantasy world and
  enchanted some items. Create a new module called GeneralStore where you can
  create a function that filters based on whether the products are magical. You
  can use the same test data from test_data/0

  ## Examples

    Chapter4.Exercises.filter_items(Chapter4.Exercises.test_data(), magic: true)
    => [%{title: "Healing Potion", price: 60, magic: true},
        %{title: "Dragon's Spear", price: 100, magic: true]

    Chapter4.Exercises.filter_items(Chapter4.Exercises.test_data(), magic: false)
    => [%{title: "Longsword", price: 50, magic: false},
        %{title: "Rope", price: 10, magic: false}]

  """

  def filter_items(list, magic_boolean, acc \\ [])
  def filter_items([], _bool, acc), do: Enum.reverse(acc)
  def filter_items([%{magic: item_bool} = h | t], [magic: arg_bool] = arg, acc) when item_bool == arg_bool, do: filter_items(t, arg, [h | acc])
  def filter_items([_h | t], arg, acc), do: filter_items(t, arg, acc)
end
