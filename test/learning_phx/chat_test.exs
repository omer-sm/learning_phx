defmodule LearningPhx.ChatTest do
  use LearningPhx.DataCase

  alias LearningPhx.Chat

  describe "msgs" do
    alias LearningPhx.Chat.Msg

    import LearningPhx.ChatFixtures

    @invalid_attrs %{content: nil, sender: nil}

    test "list_msgs/0 returns all msgs" do
      msg = msg_fixture()
      assert Chat.list_msgs() == [msg]
    end

    test "get_msg!/1 returns the msg with given id" do
      msg = msg_fixture()
      assert Chat.get_msg!(msg.id) == msg
    end

    test "create_msg/1 with valid data creates a msg" do
      valid_attrs = %{content: "some content", sender: "some sender"}

      assert {:ok, %Msg{} = msg} = Chat.create_msg(valid_attrs)
      assert msg.content == "some content"
      assert msg.sender == "some sender"
    end

    test "create_msg/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_msg(@invalid_attrs)
    end

    test "update_msg/2 with valid data updates the msg" do
      msg = msg_fixture()
      update_attrs = %{content: "some updated content", sender: "some updated sender"}

      assert {:ok, %Msg{} = msg} = Chat.update_msg(msg, update_attrs)
      assert msg.content == "some updated content"
      assert msg.sender == "some updated sender"
    end

    test "update_msg/2 with invalid data returns error changeset" do
      msg = msg_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_msg(msg, @invalid_attrs)
      assert msg == Chat.get_msg!(msg.id)
    end

    test "delete_msg/1 deletes the msg" do
      msg = msg_fixture()
      assert {:ok, %Msg{}} = Chat.delete_msg(msg)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_msg!(msg.id) end
    end

    test "change_msg/1 returns a msg changeset" do
      msg = msg_fixture()
      assert %Ecto.Changeset{} = Chat.change_msg(msg)
    end
  end
end
