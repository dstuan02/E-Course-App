import { ScrollView, Button, StyleSheet, Text, View } from "react-native";
import React from "react";
import WelcomeHeader from "../Components/WelcomeHeader";
import SearchBar from "../Components/SearchBar";
import Colors from "../Shared/Colors";
import Slider from "../Components/Slider";
import VideoCoursesList from "../Components/VideoCoursesList";
import BasicCoursesList from "../Components/BasicCoursesList";
import AdvancedCourseList from "../Components/AdvancedCourseList";

export default function Home() {
  return (
    <ScrollView style={styles.container}>
      <WelcomeHeader />
      {/* <SearchBar /> */}
      <Slider />
      <VideoCoursesList />
      <BasicCoursesList />
      <AdvancedCourseList />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    backgroundColor: Colors.bgColor,
  },
});
