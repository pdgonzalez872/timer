# Timer

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `timer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:timer, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/timer](https://hexdocs.pm/timer).

@doc """
https://msu.edu/course/mus/441/snapshot.afs/sullivan/fs02/MidiFiles/GenMidiInstList.html
"""
def play_sound() do
  MidiSynth.change_program(60)
  MidiSynth.play(60, 100)
end