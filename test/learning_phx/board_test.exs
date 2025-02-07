defmodule LearningPhx.BoardTest do
  use LearningPhx.DataCase

  alias LearningPhx.Board

  describe "posts" do
    alias LearningPhx.Board.Post

    import LearningPhx.BoardFixtures

    @invalid_attrs %{title: nil, content: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Board.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Board.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{title: "some title", content: "some content"}

      assert {:ok, %Post{} = post} = Board.create_post(valid_attrs)
      assert post.title == "some title"
      assert post.content == "some content"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{title: "some updated title", content: "some updated content"}

      assert {:ok, %Post{} = post} = Board.update_post(post, update_attrs)
      assert post.title == "some updated title"
      assert post.content == "some updated content"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Board.update_post(post, @invalid_attrs)
      assert post == Board.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Board.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Board.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Board.change_post(post)
    end
  end
end
