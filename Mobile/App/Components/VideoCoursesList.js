import {
  ScrollView,
  Image,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  FlatList,
  ActivityIndicator,
} from "react-native";
import React, { useState, useEffect } from "react";
import { useNavigation } from "@react-navigation/native";
import { api, endpoints } from "../Shared/GlobalApi";
import axios from "axios";
import Colors from "../Shared/Colors";

export default function VideoCoursesList({}) {
  const navigation = useNavigation();
  const [categories, setCategories] = useState(null);
  const [course, setCourse] = useState(null);

  const callAPI = async () => {
    try {
      let res = await axios.get(endpoints["categories"]);
      // console.log("danh sách", res.data[0]);
      setCategories(res.data[0]);
    } catch (error) {
      console.log(error);
    }
  };
  const getCourse = async () => {
    try {
      let res = await axios.get(endpoints["categories-course"](1));
      // console.log("danh sách", res.data);
      setCourse(res.data);
    } catch (error) {
      console.log(error);
    }
  };
  useEffect(() => {
    callAPI();
    getCourse();
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.courseText}>{categories?.name}</Text>
      <ScrollView horizontal={true}>
        {course === null ? (
          <ActivityIndicator />
        ) : (
          course.map((s) => {
            return (
              <TouchableOpacity
                key={s.id}
                onPress={() =>
                  navigation.navigate("course-detail", {
                    videoCourse: s,
                    categories: categories,
                  })
                }
              >
                <Image style={styles.imgCourse} source={{ uri: s.image_url }} />
                <View
                  style={{
                    marginRight: 10,
                    padding: 10,
                    backgroundColor: "#fff",
                    borderBottomLeftRadius: 8,
                    borderBottomRightRadius: 8,
                  }}
                >
                  <Text style={styles.nameCourse}>{s.subject}</Text>
                </View>
              </TouchableOpacity>
            );
          })
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginTop: 28,
  },
  nameCourse: {
    fontWeight: 'bold',
    fontSize: 16
  },
  courseText: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 12,
  },
  imgCourse: {
    width: 180,
    height: 100,
    marginRight: 10,
    borderTopLeftRadius: 8,
    borderTopRightRadius: 8,
  },
});
