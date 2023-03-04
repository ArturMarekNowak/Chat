defmodule Chat.MessengerTest do
  use Chat.DataCase

  alias Chat.Messenger

  describe "chat_conversations" do
    alias Chat.Messenger.Conversation

    import Chat.MessengerFixtures

    @invalid_attrs %{"\" title": nil}

    test "list_chat_conversations/0 returns all chat_conversations" do
      conversation = conversation_fixture()
      assert Messenger.list_chat_conversations() == [conversation]
    end

    test "get_conversation!/1 returns the conversation with given id" do
      conversation = conversation_fixture()
      assert Messenger.get_conversation!(conversation.id) == conversation
    end

    test "create_conversation/1 with valid data creates a conversation" do
      valid_attrs = %{"\" title": "some \" title"}

      assert {:ok, %Conversation{} = conversation} = Messenger.create_conversation(valid_attrs)
      assert conversation." title == "some \" title"
    end

    test "create_conversation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_conversation(@invalid_attrs)
    end

    test "update_conversation/2 with valid data updates the conversation" do
      conversation = conversation_fixture()
      update_attrs = %{"\" title": "some updated \" title"}

      assert {:ok, %Conversation{} = conversation} = Messenger.update_conversation(conversation, update_attrs)
      assert conversation." title == "some updated \" title"
    end

    test "update_conversation/2 with invalid data returns error changeset" do
      conversation = conversation_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_conversation(conversation, @invalid_attrs)
      assert conversation == Messenger.get_conversation!(conversation.id)
    end

    test "delete_conversation/1 deletes the conversation" do
      conversation = conversation_fixture()
      assert {:ok, %Conversation{}} = Messenger.delete_conversation(conversation)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_conversation!(conversation.id) end
    end

    test "change_conversation/1 returns a conversation changeset" do
      conversation = conversation_fixture()
      assert %Ecto.Changeset{} = Messenger.change_conversation(conversation)
    end
  end

  describe "chat_conversation_members" do
    alias Chat.Messenger.ConversationMember

    import Chat.MessengerFixtures

    @invalid_attrs %{"\" owner": nil}

    test "list_chat_conversation_members/0 returns all chat_conversation_members" do
      conversation_member = conversation_member_fixture()
      assert Messenger.list_chat_conversation_members() == [conversation_member]
    end

    test "get_conversation_member!/1 returns the conversation_member with given id" do
      conversation_member = conversation_member_fixture()
      assert Messenger.get_conversation_member!(conversation_member.id) == conversation_member
    end

    test "create_conversation_member/1 with valid data creates a conversation_member" do
      valid_attrs = %{"\" owner": true}

      assert {:ok, %ConversationMember{} = conversation_member} = Messenger.create_conversation_member(valid_attrs)
      assert conversation_member." owner == true
    end

    test "create_conversation_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_conversation_member(@invalid_attrs)
    end

    test "update_conversation_member/2 with valid data updates the conversation_member" do
      conversation_member = conversation_member_fixture()
      update_attrs = %{"\" owner": false}

      assert {:ok, %ConversationMember{} = conversation_member} = Messenger.update_conversation_member(conversation_member, update_attrs)
      assert conversation_member." owner == false
    end

    test "update_conversation_member/2 with invalid data returns error changeset" do
      conversation_member = conversation_member_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_conversation_member(conversation_member, @invalid_attrs)
      assert conversation_member == Messenger.get_conversation_member!(conversation_member.id)
    end

    test "delete_conversation_member/1 deletes the conversation_member" do
      conversation_member = conversation_member_fixture()
      assert {:ok, %ConversationMember{}} = Messenger.delete_conversation_member(conversation_member)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_conversation_member!(conversation_member.id) end
    end

    test "change_conversation_member/1 returns a conversation_member changeset" do
      conversation_member = conversation_member_fixture()
      assert %Ecto.Changeset{} = Messenger.change_conversation_member(conversation_member)
    end
  end

  describe "chat_messages" do
    alias Chat.Messenger.Message

    import Chat.MessengerFixtures

    @invalid_attrs %{"\" content": nil}

    test "list_chat_messages/0 returns all chat_messages" do
      message = message_fixture()
      assert Messenger.list_chat_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messenger.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{"\" content": "some \" content"}

      assert {:ok, %Message{} = message} = Messenger.create_message(valid_attrs)
      assert message." content == "some \" content"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{"\" content": "some updated \" content"}

      assert {:ok, %Message{} = message} = Messenger.update_message(message, update_attrs)
      assert message." content == "some updated \" content"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_message(message, @invalid_attrs)
      assert message == Messenger.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messenger.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messenger.change_message(message)
    end
  end

  describe "chat_emojis" do
    alias Chat.Messenger.Emoji

    import Chat.MessengerFixtures

    @invalid_attrs %{code: nil, emoji_id: nil}

    test "list_chat_emojis/0 returns all chat_emojis" do
      emoji = emoji_fixture()
      assert Messenger.list_chat_emojis() == [emoji]
    end

    test "get_emoji!/1 returns the emoji with given id" do
      emoji = emoji_fixture()
      assert Messenger.get_emoji!(emoji.id) == emoji
    end

    test "create_emoji/1 with valid data creates a emoji" do
      valid_attrs = %{code: "some code", emoji_id: "some emoji_id"}

      assert {:ok, %Emoji{} = emoji} = Messenger.create_emoji(valid_attrs)
      assert emoji.code == "some code"
      assert emoji.emoji_id == "some emoji_id"
    end

    test "create_emoji/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_emoji(@invalid_attrs)
    end

    test "update_emoji/2 with valid data updates the emoji" do
      emoji = emoji_fixture()
      update_attrs = %{code: "some updated code", emoji_id: "some updated emoji_id"}

      assert {:ok, %Emoji{} = emoji} = Messenger.update_emoji(emoji, update_attrs)
      assert emoji.code == "some updated code"
      assert emoji.emoji_id == "some updated emoji_id"
    end

    test "update_emoji/2 with invalid data returns error changeset" do
      emoji = emoji_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_emoji(emoji, @invalid_attrs)
      assert emoji == Messenger.get_emoji!(emoji.id)
    end

    test "delete_emoji/1 deletes the emoji" do
      emoji = emoji_fixture()
      assert {:ok, %Emoji{}} = Messenger.delete_emoji(emoji)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_emoji!(emoji.id) end
    end

    test "change_emoji/1 returns a emoji changeset" do
      emoji = emoji_fixture()
      assert %Ecto.Changeset{} = Messenger.change_emoji(emoji)
    end
  end

  describe "chat_message_reactions" do
    alias Chat.Messenger.MessageReaction

    import Chat.MessengerFixtures

    @invalid_attrs %{}

    test "list_chat_message_reactions/0 returns all chat_message_reactions" do
      message_reaction = message_reaction_fixture()
      assert Messenger.list_chat_message_reactions() == [message_reaction]
    end

    test "get_message_reaction!/1 returns the message_reaction with given id" do
      message_reaction = message_reaction_fixture()
      assert Messenger.get_message_reaction!(message_reaction.id) == message_reaction
    end

    test "create_message_reaction/1 with valid data creates a message_reaction" do
      valid_attrs = %{}

      assert {:ok, %MessageReaction{} = message_reaction} = Messenger.create_message_reaction(valid_attrs)
    end

    test "create_message_reaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_message_reaction(@invalid_attrs)
    end

    test "update_message_reaction/2 with valid data updates the message_reaction" do
      message_reaction = message_reaction_fixture()
      update_attrs = %{}

      assert {:ok, %MessageReaction{} = message_reaction} = Messenger.update_message_reaction(message_reaction, update_attrs)
    end

    test "update_message_reaction/2 with invalid data returns error changeset" do
      message_reaction = message_reaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_message_reaction(message_reaction, @invalid_attrs)
      assert message_reaction == Messenger.get_message_reaction!(message_reaction.id)
    end

    test "delete_message_reaction/1 deletes the message_reaction" do
      message_reaction = message_reaction_fixture()
      assert {:ok, %MessageReaction{}} = Messenger.delete_message_reaction(message_reaction)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_message_reaction!(message_reaction.id) end
    end

    test "change_message_reaction/1 returns a message_reaction changeset" do
      message_reaction = message_reaction_fixture()
      assert %Ecto.Changeset{} = Messenger.change_message_reaction(message_reaction)
    end
  end

  describe "chat_seen_messages" do
    alias Chat.Messenger.SeenMessage

    import Chat.MessengerFixtures

    @invalid_attrs %{}

    test "list_chat_seen_messages/0 returns all chat_seen_messages" do
      seen_message = seen_message_fixture()
      assert Messenger.list_chat_seen_messages() == [seen_message]
    end

    test "get_seen_message!/1 returns the seen_message with given id" do
      seen_message = seen_message_fixture()
      assert Messenger.get_seen_message!(seen_message.id) == seen_message
    end

    test "create_seen_message/1 with valid data creates a seen_message" do
      valid_attrs = %{}

      assert {:ok, %SeenMessage{} = seen_message} = Messenger.create_seen_message(valid_attrs)
    end

    test "create_seen_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messenger.create_seen_message(@invalid_attrs)
    end

    test "update_seen_message/2 with valid data updates the seen_message" do
      seen_message = seen_message_fixture()
      update_attrs = %{}

      assert {:ok, %SeenMessage{} = seen_message} = Messenger.update_seen_message(seen_message, update_attrs)
    end

    test "update_seen_message/2 with invalid data returns error changeset" do
      seen_message = seen_message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messenger.update_seen_message(seen_message, @invalid_attrs)
      assert seen_message == Messenger.get_seen_message!(seen_message.id)
    end

    test "delete_seen_message/1 deletes the seen_message" do
      seen_message = seen_message_fixture()
      assert {:ok, %SeenMessage{}} = Messenger.delete_seen_message(seen_message)
      assert_raise Ecto.NoResultsError, fn -> Messenger.get_seen_message!(seen_message.id) end
    end

    test "change_seen_message/1 returns a seen_message changeset" do
      seen_message = seen_message_fixture()
      assert %Ecto.Changeset{} = Messenger.change_seen_message(seen_message)
    end
  end
end
