import {
  FlatList,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";
import React, { useEffect } from "react";
import { FontAwesome } from "@expo/vector-icons";
import Colors from "../Shared/Colors";
import { useNavigation, useRoute } from "@react-navigation/native";
import { api, endpoints } from "../Shared/GlobalApi";

export default function CourseContent({}) {
  const navigation = useNavigation();
  const param = useRoute();
  const { courseId } = param.params;
  const loadLessons = async () => {
    try {
      let res = await api.get(endpoints["lessons"](courseId));
      // console.log('get_lesson', res.data)
      setLessons(res.data);
    } catch (ex) {
      console.error(ex);
    }
  };

  return (
    <View>
      <Text style={styles.aboutCourse}>Course Content</Text>

      <TouchableOpacity
        style={styles.container}
        onPress={() => navigation.navigate("video-player")}
      >
        <Text style={styles.indexNum}>01</Text>
        <Text style={styles.partTitle}>Introduction</Text>
        <FontAwesome
          style={styles.playIcon}
          name="play-circle"
          size={24}
          color="black"
        />
      </TouchableOpacity>
      <Text>{courseId}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  aboutCourse: {
    fontSize: 18,
    fontWeight: "bold",
    marginTop: 22,
    marginBottom: 8,
  },
  container: {
    display: "flex",
    flexDirection: "row",
    padding: 15,
    marginBottom: 8,
    borderRadius: 5,
    alignItems: "center",
    backgroundColor: Colors.white,
  },
  indexNum: {
    fontSize: 30,
    fontWeight: "bold",
    color: Colors.gray,
    paddingRight: 12,
  },
  partTitle: {
    fontSize: 16,
    fontWeight: "bold",
  },
  playIcon: {
    position: "absolute",
    right: 20,
    color: Colors.primary,
  },
});
