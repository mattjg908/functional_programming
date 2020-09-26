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

  @doc """
  We've created a function that sorts the items of a list in ascending order.
  Now create a Sort.descending/1 function that sorts the element in descending
  order.

  def ascending([]), do: []
  def ascending([a]), do: [a]
  def ascending(list) do
    half_size = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_size)
    merge(ascending(list_a), ascending(list_b))
  end

  defp merge([], list_b), do: list_b
  defp merge(list_a, []), do: list_a
  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do
    [head_a | merge(tail_a, list_b)]
  end
  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
    [head_b | merge(list_a, tail_b)]
  end

  """

  def descending([]), do: []
  def descending([h]), do: [h]
  def descending(list) do
    half = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half)
    merge(descending(list_a), descending(list_b))
  end

  defp merge([], list_b), do: list_b
  defp merge(list_a, []), do: list_a
  defp merge([h_a | t_a], [h_b | _t_b] = list_b) when h_a >= h_b do
    [h_a | merge(t_a, list_b)]
  end
  defp merge(list_a, [h | t]), do: [h | merge(list_a, t)]

  @doc """
  We’ve written a lot of recursive functions, but not all of them are tail
  recursive. Write the tail-recursive versions of Sum.up_to/1 and Math.sum/1.
  Extra challenge: write the tail-recursive version of Sort.merge/2

  def up_to(0), do: 0
  def up_to(n), do: n + up_to(n - 1)

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  """

  def up_to(n), do: sum_up_to(n, 0)
  defp sum_up_to(0, acc), do: acc
  defp sum_up_to(n, acc), do: sum_up_to(n - 1, n + acc)

  def sum(list), do: do_sum(list, [])
  defp do_sum([], acc), do: acc
  defp do_sum([h | t], acc), do: do_sum(t, h + acc)

  def second_merge(lista, listb), do: do_merge(lista, listb, [])
  defp do_merge([], list, acc), do: acc ++ list
  defp do_merge(list, [], acc), do: acc ++ list
  defp do_merge([h_a | t_a], [h_b | _t_b] = list_b, acc) when h_a <= h_b do
    do_merge(t_a, list_b, [h_a | acc])
  end
  defp do_merge(list_a, [h | t], acc), do: do_merge(list_a, t, [h | acc])

  defmodule Navigator do
    @moduledoc """
    In the section Adding Boundaries, we added a depth restriction to limit how
    many directories deep our module should dive. Now create a BreadthNavigator
    module that has a breadth constraint; it will be the maximum number of sibling
    directories it can navigate.

    """

    @max_breadth 2

    def navigate(dir) do
      expanded_dir = Path.expand(dir)
      go_through([expanded_dir], 0)
    end

    defp go_through([], current_breadth), do: nil
    defp go_through(list, current_breadth) when current_breadth > @max_breadth,
        do: nil
    defp go_through([content | rest], current_breadth) do
      print_and_navigate(content, File.dir?(content))
      go_through(rest, current_breadth + 1)
    end

    defp print_and_navigate(_dir, false), do: nil
    defp print_and_navigate(dir, true) do
      IO.puts dir
      {:ok, children_dirs} = File.ls(dir)
      go_through(expand_dirs(children_dirs, dir), 0)
    end

    defp expand_dirs([], _relative_to), do: []
    defp expand_dirs([dir | dirs], relative_to) do
      expanded_dir = Path.expand(dir, relative_to)
      [expanded_dir | expand_dirs(dirs, relative_to)]
    end
  end
end
