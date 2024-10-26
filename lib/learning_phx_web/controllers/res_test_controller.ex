defmodule LearningPhxWeb.ResTestController do
  use LearningPhxWeb, :controller
  @users ["user1", "user2", "user3"]

  def index(conn, _params) do
    render(conn, :index, %{"users" => @users})
  end

  def show(conn, %{"id" => id}) do
    render(conn, :show, %{"user" => Enum.at(@users, String.to_integer(id))})
  end

  def new(conn, _params) do
    conn
    |> put_flash(:error, "Redirected..")
    |> redirect(to: ~p"/hello")
  end
end
