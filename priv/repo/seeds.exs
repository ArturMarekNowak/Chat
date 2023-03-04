# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chat.Repo.insert!(%Chat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Chat.Auth.User
alias Chat.Messenger.Conversation
alias Chat.Messenger.ConversationMember
alias Chat.Auth
alias Chat.Messenger
alias Chat

{:ok, %User{id: u1_id}} = Auth.create_user(%{nickname: "User One"})
{:ok, %User{id: u2_id}} = Auth.create_user(%{nickname: "User Two"})

{:ok, %Conversation{id: conv_id}} = Chat.Messenger.create_conversation(%{title: "Modern Talking"})

{:ok, %ConversationMember{}} =
  Chat.Messenger.create_conversation_member(%{
    conversation_id: conv_id,
    user_id: u1_id,
    owner: true
  })

{:ok, %ConversationMember{}} =
  Chat.Messenger.create_conversation_member(%{
    conversation_id: conv_id,
    user_id: u2_id,
    owner: false
  })
