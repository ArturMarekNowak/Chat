// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import CreateConversationFormHooks from "./create_conversation_form_hooks";
import ConversationListHooks from "./conversation_list_hooks";
import ConversationHooks from "./conversation_hooks";

let Hooks = { CreateConversationFormHooks, ConversationListHooks, ConversationHooks };

let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks })
liveSocket.connect()

Notification.requestPermission()