defmodule Timer.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    :ok = :pg2.create(:family)

    family =
      [
        "Kels",
        "Silvy",
        "Paulo",
        "Kasey",
        "Butler",
        "Nicole"
      ]
      |> Enum.map(fn family_member ->
        family_member_atom = String.to_atom(family_member)
        Supervisor.child_spec({Timer.Workers.Greeter, [who_to_greet: family_member]}, id: family_member_atom)
      end)

    lots_of_processes =
      1..200
      |> Enum.map(fn family_member ->
        family_member = "whoa#{family_member}"
        family_member_atom = String.to_atom(family_member)
        Supervisor.child_spec({Timer.Workers.Greeter, [who_to_greet: family_member]}, id: family_member_atom)
      end)

    children = []

    # Uncomment below if you want to see lots of processes reply to you.
    # all_processes = children ++ family ++ lots_of_processes
    all_processes = children ++ family

    opts = [strategy: :one_for_one, name: Timer.Supervisor]
    Supervisor.start_link(all_processes, opts)
  end
end
