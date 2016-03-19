defmodule Ex10 do
  @tax 0.055

  def get_item_list do
    item_num = 1
    item_list = []
    get_item_list(item_num, item_list)
  end

  def get_item_list(num, list) do
    item = get_item(num)
    cond do
      item.price > 0 ->
        list = [item] ++ list
        get_item_list(num+1, list)
      true           ->
        list
    end
  end

  def get_item(item_num) do
    price = get_price(item_num)
    quantity = get_quantity(item_num)
    %Item{price: price, quantity: quantity}
  end

  defp get_price(item_num) do
    {bool, price} = "Price of item #{item_num}: "
      |> IO.gets
      |> String.strip
      |> Ex10.is_float
    
    case {bool, is_negative(price)} do
      {true, false} -> price
      _             ->
        IO.puts "Must be a positive number"
        get_price(item_num)
    end
  end

  defp get_quantity(item_num) do
    {bool, quant} = "Quantity of item #{item_num}: "
      |> IO.gets
      |> String.strip
      |> Ex10.is_int

    case {bool, is_negative(quant)} do
      {true, false} -> quant
      _             ->
        IO.puts "Must be a positive integer"
        get_quantity(item_num)
    end
  end

  def get_subtotal(list) do
    Enum.reduce(list, 0, fn(x, acc) -> (Item.get_cost(x)) + acc end)
  end

  def get_tax(list) when Kernel.is_list(list) do
    list |> get_subtotal |> get_tax
  end

  def get_tax(subtotal) when Kernel.is_number(subtotal) do
    subtotal*@tax |> Float.round(2)
  end

  def get_total(list) when Kernel.is_list(list) do
    list |> get_subtotal |> get_total
  end

  def get_total(subtotal) do
    subtotal*(1+@tax) |> Float.round(2)
  end

  def is_int(str) do
    case Integer.parse(str) do
      {num, ""}  -> {true, num}
      {_num, _r} -> {false, 0}
      :error     -> {false, 0}
    end
  end

  def is_float(str) do
    case Float.parse(str) do
      {num, ""}  -> {true, num}
      {_num, _r} -> {false, 0}
      :error     -> {false, 0}
    end
  end
  
  def is_negative(int) do
    int < 0
  end
end

IO.puts "Enter items (0 priced item marks end)\n"
item_list = Ex10.get_item_list

subtotal = Ex10.get_subtotal(item_list)
tax = Ex10.get_tax(subtotal)
total = Ex10.get_total(subtotal)

IO.puts "
Subotal: #{subtotal}
Tax: #{tax}
Total: #{total}"
