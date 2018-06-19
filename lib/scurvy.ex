defmodule Scurvy do
  @moduledoc """
  Documentation for Scurvy.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Scurvy.hello
      :world

  """
  def hello do
    "not world"
  end

  def this, do: "a thing"

  def take_and_read_picture do
    Picam.Camera.start_link

    Picam.next_frame
    |> Base.encode64
    |> IO.puts
  end
end
