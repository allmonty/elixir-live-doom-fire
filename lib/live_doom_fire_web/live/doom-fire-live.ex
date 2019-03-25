defmodule LiveDoomFireWeb.LiveDoomFire do
  use Phoenix.LiveView

  def render(assigns) do
    LiveDoomFireWeb.LiveDoomFireView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)

    {:ok, put_date(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, put_date(socket)}
  end

  defp put_date(socket) do
    assign(socket, temperature: inspect(:calendar.local_time()))
  end
end
