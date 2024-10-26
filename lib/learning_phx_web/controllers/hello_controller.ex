defmodule LearningPhxWeb.HelloController do
  use LearningPhxWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:val1, 1)
    |> render(:index)
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end

end
