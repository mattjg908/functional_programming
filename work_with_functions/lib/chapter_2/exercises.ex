defmodule Chapter2.Exercises do
  @moduledoc """
  This module is for the exercises at the end of Chapter 2
  """

  @price_of_bread 0.1
  @price_of_milk 2.0
  @price_of_cake 15.0

  @doc """
  Create an expression that solves the following problem:

  Sarah has bought ten slices of bread for ten cents each, three bottles of
  milk for two dollars each, and a cake for fifteen dollars. How many dollars
  has Sarah spent?

  """
  def total_money_spent(slice_quant, bottle_quant, cake_quant) do
    money_spent_on_bread = fn slices_bought -> slices_bought * @price_of_bread end
    money_spent_on_milk = fn bottles_bought -> bottles_bought * @price_of_milk end
    money_spent_on_cake = fn cakes_bought -> cakes_bought * @price_of_cake end

    money_spent_on_bread.(slice_quant)
    |> Kernel.+(money_spent_on_milk.(bottle_quant))
    |> Kernel.+(money_spent_on_cake.(cake_quant))
  end


  #Bob has traveled 200 km in four hours. Using variables, print a message
  #showing his travel distance, time, and average velocity.

  distance_traveled = 200
  hours_traveled = 4
  average_velocity = distance_traveled/hours_traveled
  IO.puts "Bob went #{distance_traveled} kilometers in #{hours_traveled} hours for an average velocity of #{average_velocity} km/hour"

  #Build an anonymous function that applies a tax of 12% to a given price. It
  #should print a message with the new price and tax value. Bind the anonymous
  #function to a variable called apply_tax . You should use apply_tax with
  #Enum.each/2, like in the following example.
  #
  #Enum.each [12.5, 30.99, 250.49, 18.80], apply_tax
  tax_rate = 0.12
  apply_tax = fn price ->
    IO.puts "Price: #{price * (1 + tax_rate) |> Float.round(4)} - Tax: #{price * tax_rate}"
  end
  Enum.each [12.5, 30.99, 250.49, 18.80], apply_tax
end