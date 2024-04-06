import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import Home from "../Pages/Home";
import CourseDetails from "../Pages/CourseDetails";
import CourseChapter from "../Pages/CourseChapter";
import VideoPlayer from "../Pages/VideoPlayer";
import Login from "../Pages/Login";
import Signup from "../Pages/Signup";
import LogoutScreen from "../Pages/LogoutScreen";

const Stack = createNativeStackNavigator();
export default function HomeNavigation() {
  return (
    <Stack.Navigator
      initialRouteName="Login"
      screenOptions={{ headerShown: false }}
    >
      <Stack.Screen name="Login" component={Login} />
      <Stack.Screen name="Signup" component={Signup} />

      <Stack.Screen name="home" component={Home} />
      <Stack.Screen name="course-detail" component={CourseDetails} />
      <Stack.Screen name="course-chapter" component={CourseChapter} />
      <Stack.Screen name="video-player" component={VideoPlayer} />
      <Stack.Screen name="logout" component={LogoutScreen} />
    </Stack.Navigator>
  );
}

const styles = StyleSheet.create({});
