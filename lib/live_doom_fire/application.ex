defmodule LiveDoomFire.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(LiveDoomFireWeb.Endpoint, []),
      {Phoenix.PubSub, [name: LiveDoomFire.PubSub, adapter: Phoenix.PubSub.PG2]}
    ]

    opts = [strategy: :one_for_one, name: LiveDoomFire.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    LiveDoomFireWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
