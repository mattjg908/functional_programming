#P.1576 Matching Maps
#user_input = IO.gets "Write your ability score:\n"
#{ability_score, _} = Integer.parse(user_input)
#ability_modifier = (ability_score - 10) / 2
#IO.puts "Your ability modifier is #{ability_modifier}"

defmodule Chapter3.Exercises do
  @moduledoc """
  This module is for the exercises at the end of Chapter 3
  """

  @doc """
  In RPGs, players have points to spend on their character attributes. Create a
  function that returns the total number of points players have spent on their
  characters. The function will receive a map containing the strength, dexterity
  , and intelligence values. Each point in strength should be multiplied by two,
  and dexterity and intelligence should be multiplied by three.

  """
  @spec points(map()) :: integer()
  def points(%{strength: s, dexterity: d, intelligence: i}), do: s*2 + 3*(d + i)

  @doc """
  Create a function that returns Tic-Tac-Toe game winners. You can represent the
  board with a tuple of nine elements, where each group of three items is a row.
  The return of the function should be a tuple. When we have a winner, the first
  element should be the atom :winner, and the second should be the player.

  """
  @spec tic_tac_toe_winner(tuple()) :: tuple()
  def tic_tac_toe_winner({a, a, a, _,_,_, _,_,_}), do: {:winner, a}
  def tic_tac_toe_winner({_, _, _, _,_,_, a,a,a}), do: {:winner, a}
  def tic_tac_toe_winner({a, _, _, _,a,_, _,_,a}), do: {:winner, a}
  def tic_tac_toe_winner({_, _, a, _,a,_, a,_,_}), do: {:winner, a}
  def tic_tac_toe_winner({a, _, _, a,_,_, a,_,_}), do: {:winner, a}
  def tic_tac_toe_winner({_, _, a, _,_,a, _,_,a}), do: {:winner, a}
  def tic_tac_toe_winner({_, a, _, _,a,_, _,a,_}), do: {:winner, a}
  def tic_tac_toe_winner(_), do: {:no_winner}

  @doc """
  Create a function that calculates income tax following these rules: a salary
  equal or below $2,000 pays no tax; below or equal to $3,000 pays 5%; below or
  equal to $6,000 pays 10%; everything higher than $6,000 pays 15%.

  """
  def tax(salary) when salary <= 2000, do: 0
  def tax(salary) when salary <= 3000, do: salary * 0.05
  def tax(salary) when salary <= 6000, do: salary * 0.10
  def tax(salary), do: salary * 0.15

end

wizard = %{strength: 1, intelligence: 2, dexterity: 3}
IO.inspect(Chapter3.Exercises.points(wizard))

x_winner  = {:x, :o, :x,
             :o, :x, :o,
             :o, :o, :x}
o_winner  = {:o, :o, :x,
             :o, :x, :o,
             :o, :o, :x}
no_winner = {:o, :x, :o,
             :o, :x, :o,
             :x, :o, :x}
IO.inspect(Chapter3.Exercises.tic_tac_toe_winner(x_winner))
IO.inspect(Chapter3.Exercises.tic_tac_toe_winner(o_winner))
IO.inspect(Chapter3.Exercises.tic_tac_toe_winner(no_winner))

IO.inspect(Chapter3.Exercises.tax(6000))

#  Create an Elixir script where users can type their salary and see the income
#  tax and the net wage. You can use the module from the previous exercise, but
#  this script should parse the user input and display a message when users type
#  something that is not a valid number.

user_input = IO.gets "Please enter your salary:\n"
case Float.parse(user_input) do
  {salary, _} ->
    tax = Chapter3.Exercises.tax(salary)
    IO.puts("Net salary: #{salary - tax}, tax: #{tax}")
  _ ->
    IO.puts("Invalid input")
end
