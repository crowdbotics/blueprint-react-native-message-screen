import { createStackNavigator } from "react-navigation-stack";

import Chat from "./screens/chat";
import ChatList from "./screens/chatList";
import Comments from "./screens/comments";
import Home from "./screens";


export const MessagingBlueprintNavigator = createStackNavigator(
  {
    Home: { screen: Home },
    Chat: { screen: Chat },
    ChatList: { screen: ChatList },
    Comments: { screen: Comments },
  },
  {
    initialRouteName: "Home"
  }
);
