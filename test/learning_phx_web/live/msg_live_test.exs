defmodule LearningPhxWeb.MsgLiveTest do
  use LearningPhxWeb.ConnCase

  import Phoenix.LiveViewTest
  import LearningPhx.ChatFixtures

  @create_attrs %{content: "some content", sender: "some sender"}
  @update_attrs %{content: "some updated content", sender: "some updated sender"}
  @invalid_attrs %{content: nil, sender: nil}

  defp create_msg(_) do
    msg = msg_fixture()
    %{msg: msg}
  end

  describe "Index" do
    setup [:create_msg]

    test "lists all msgs", %{conn: conn, msg: msg} do
      {:ok, _index_live, html} = live(conn, ~p"/msgs")

      assert html =~ "Listing Msgs"
      assert html =~ msg.content
    end

    test "saves new msg", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/msgs")

      assert index_live |> element("a", "New Msg") |> render_click() =~
               "New Msg"

      assert_patch(index_live, ~p"/msgs/new")

      assert index_live
             |> form("#msg-form", msg: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#msg-form", msg: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/msgs")

      html = render(index_live)
      assert html =~ "Msg created successfully"
      assert html =~ "some content"
    end

    test "updates msg in listing", %{conn: conn, msg: msg} do
      {:ok, index_live, _html} = live(conn, ~p"/msgs")

      assert index_live |> element("#msgs-#{msg.id} a", "Edit") |> render_click() =~
               "Edit Msg"

      assert_patch(index_live, ~p"/msgs/#{msg}/edit")

      assert index_live
             |> form("#msg-form", msg: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#msg-form", msg: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/msgs")

      html = render(index_live)
      assert html =~ "Msg updated successfully"
      assert html =~ "some updated content"
    end

    test "deletes msg in listing", %{conn: conn, msg: msg} do
      {:ok, index_live, _html} = live(conn, ~p"/msgs")

      assert index_live |> element("#msgs-#{msg.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#msgs-#{msg.id}")
    end
  end

  describe "Show" do
    setup [:create_msg]

    test "displays msg", %{conn: conn, msg: msg} do
      {:ok, _show_live, html} = live(conn, ~p"/msgs/#{msg}")

      assert html =~ "Show Msg"
      assert html =~ msg.content
    end

    test "updates msg within modal", %{conn: conn, msg: msg} do
      {:ok, show_live, _html} = live(conn, ~p"/msgs/#{msg}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Msg"

      assert_patch(show_live, ~p"/msgs/#{msg}/show/edit")

      assert show_live
             |> form("#msg-form", msg: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#msg-form", msg: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/msgs/#{msg}")

      html = render(show_live)
      assert html =~ "Msg updated successfully"
      assert html =~ "some updated content"
    end
  end
end
