defmodule Timer do
  @moduledoc """
  Documentation for Timer.
  """

  @doc """
  This will show how we can target a specific group at Runtime and design
  behaviour around it.
  """
  def say_hi_to_family() do
    :pg2.get_members(:family)
    |> Enum.each(fn family_member ->
      opts = []
      Process.send(family_member, :hi, opts)
    end)
  end
end
