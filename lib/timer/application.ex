defmodule Timer.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do

    children =
      [
        "Kels",
        "Silvy",
        "Paulo",
        "Kasey",
        "Butler",
        "Nicole"
      ]
      |> Enum.map(fn family_member ->
        Supervisor.child_spec({Timer.Workers.Greeter, [who_to_greet: family_member]}, id: String.to_atom(family_member))
      end)

    opts = [strategy: :one_for_one, name: Timer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
