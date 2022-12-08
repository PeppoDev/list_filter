defmodule ListFilter do
  def call(list) do
    filter(list)
  end

  defp filter(list) do
    list
    |> Stream.filter(fn el ->
      case Integer.parse(el) do
        :error -> false
        _value -> true
      end
    end)
    |> count_odd()
  end

  defp count_odd(list) do
    list
    |> Enum.reduce(0, fn el, acc ->
      is_odd = rem(String.to_integer(el), 2) != 0

      case is_odd do
        true ->
          acc + 1

        false ->
          acc
      end
    end)
  end
end
