import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import Login from "./App/Pages/Login";
import Home from "./App/Pages/Home";
import { NavigationContainer } from "@react-navigation/native";
import HomeNavigation from "./App/Navigations/HomeNavigation";
import CourseDetails from "./App/Pages/CourseDetails";
import CourseChapter from "./App/Pages/CourseChapter";
import VideoPlayer from "./App/Pages/VideoPlayer";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import CourseContent from "./App/Pages/CourseContent";
import { useReducer } from "react";
import MyUserReducer from "./App/Shared/MyUserReducer";
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from "./App/Shared/MyContext";

const Stack = createNativeStackNavigator();
export default function App() {
  const [user, dispatch] = useReducer(
    MyUserReducer,
    AsyncStorage.getItem("user") || null
  );
  return (
    <MyContext.Provider value={[user, dispatch]}>
      <NavigationContainer>
        <HomeNavigation />
        {/* <VideoPlayer/> */}
        {/* <CourseDetails/> */}
      </NavigationContainer>
    </MyContext.Provider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
