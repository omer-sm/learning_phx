defmodule LearningPhxWeb.ResTestHTML do
  use LearningPhxWeb, :html

  def index(assigns) do
    ~H"""
    <ul>
      <li :for={user <- assigns["users"]}><%= user %></li>
    </ul>
    <%= IO.inspect(assigns["users"])%>
    """
  end

  def show(assigns) do
    ~H"""
    <%= IO.inspect(assigns["user"])%>
    """
  end
end
