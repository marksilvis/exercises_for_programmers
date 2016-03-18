defmodule Item do
  defstruct price: 0, quantity: 0
  
  def get_cost(item) do
    item.price * item.quantity
  end
end