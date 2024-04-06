import {
  ScrollView,
  StyleSheet,
  Text,
  View,
  Image,
  TouchableOpacity,
  ActivityIndicator,
} from "react-native";
import Colors from "../Shared/Colors";
import { useNavigation } from "@react-navigation/native";
import React, { useState, useEffect } from "react";
import { api, endpoints } from "../Shared/GlobalApi";
import axios from "axios";

export default function BasicCoursesList() {
  const navigation = useNavigation();
  const [samSung, setSamSung] = useState(null);
  const [categories, setCategories] = useState(null);
  const callAPI = async () => {
    try {
      // let res = await axios.get(endpoints["categories"]);
      let res = await axios.get(endpoints["categories"]);
      // console.log("danh sách", res.data[1]);
      setCategories(res.data[1]);
      // console.log(myCourses.data)
    } catch (error) {
      console.log(error);
    }
  };
  const getCourse = async () => {
    try {
      let res = await axios.get(endpoints["categories-course"](2));
      // console.log("danh sách", res.data);
      setSamSung(res.data);
      // console.log(myCourses.data)
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
        {samSung === null ? (
          <ActivityIndicator />
        ) : (
          samSung.map((s) => {
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
  courseText: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 12,
  },
  imgCourse: {
    marginRight: 10,
    width: 180,
    height: 110,
    borderTopLeftRadius: 8,
    borderTopRightRadius: 8,
    // resizeMode: 'contain',
  },
  nameCourse: {
    fontSize: 16,
    fontWeight: "bold",
    paddingTop: 2,
    paddingBottom: 2,
  },
  lessonCourse: {
    color: Colors.gray,
  },
});
