import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Image,
  ScrollView,
  ActivityIndicator,
} from "react-native";
import React, { useCallback, useEffect, useState } from "react";
import { Ionicons } from "@expo/vector-icons";
import Colors from "../Shared/Colors";
import CourseContent from "./CourseContent";
import YoutubePlayer from "react-native-youtube-iframe";
import { useNavigation, useRoute } from "@react-navigation/native";
import { FontAwesome } from "@expo/vector-icons";
import { api, endpoints } from "../Shared/GlobalApi";
import axios from "axios";
import { useWindowDimensions } from "react-native";
import RenderHtml from "react-native-render-html";
import HTML from "react-native-render-html";
import CommentSection from "./CommentSection";

export default function VideoPlayer() {
  const navigation = useNavigation();
  const param = useRoute();
  const { detailCourse } = param.params;
  console.log("id", detailCourse);
  const [videoChapter, setvideoChapter] = useState([]);
  let count = 0;

  // This is for Youtube iframe:
  const [playing, setPlaying] = useState(false);
  const [lesson, setLessons] = useState(null);
  const onStateChange = useCallback((state) => {
    if (state === "ended") {
      setPlaying(false);
    }
  }, []);
  const loadLessons = async () => {
    try {
      let res = await axios.get(endpoints["lessons"](detailCourse.id));
      console.log("get_lesson", res.data);
      setLessons(res.data);
    } catch (ex) {
      console.error(ex);
    }
  };
  useEffect(() => {
    loadLessons();
  }, []);
  return (
    <ScrollView style={styles.container}>
      <TouchableOpacity onPress={() => navigation.goBack()}>
        <Ionicons name="arrow-back" size={24} color="black" />
      </TouchableOpacity>
      <View>
        <Text style={styles.nameCourse}>{detailCourse?.subject}</Text>
        <Text style={styles.author}>By Tuan Dang</Text>
        <YoutubePlayer
          height={200}
          play={playing}
          videoId={"XKHEtdqhLK8"}
          onChangeState={onStateChange}
        />

        {/* Description: */}
        <Text style={styles.aboutCourse}>Description</Text>
        {console.log(detailCourse)}
        <View style={styles.courseDesc}>
          {detailCourse == null || detailCourse == undefined ? (
            <></>
          ) : (
            <RenderHtml source={{ html: detailCourse?.content }} />
          )}
        </View>
        {/* <Text style={styles.courseDesc}>{detailCourse?.content}</Text> */}

        {/* Course Parts: */}
        {/* <View>
				<Text style={styles.aboutCourse}>Course Content</Text>
				
				{lesson === null ? (
				<ActivityIndicator />
					) : (
						
						lesson.map(s => {
							count+=1
							return (
								<TouchableOpacity key={s.id} style={styles.courseContentContainer} onPress={()=>navigation.navigate('video-player')}>
									<Text style={styles.indexNum}>0{count}</Text>
									<Text style={styles.partTitle}>{s.subject}</Text>
									<FontAwesome style={styles.playIcon} name="play-circle" size={24} color="black" />
								</TouchableOpacity>
							)
						})
					) }
    		</View> */}

        {/* Comments: */}
        <CommentSection param={detailCourse} />
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 30,
    paddingTop: 30,
    backgroundColor: Colors.bgColor,
  },
  nameCourse: {
    fontSize: 22,
    fontWeight: "bold",
    marginTop: 18,
    marginBottom: 2,
  },
  author: {
    color: Colors.gray,
    marginBottom: 10,
  },
  imgCourseDetail: {
    width: "100%",
    height: 210,
    borderRadius: 8,
  },
  aboutCourse: {
    fontSize: 18,
    fontWeight: "bold",
    marginTop: 10,
    marginBottom: 8,
  },
  courseDesc: {
    color: "red",
  },
  aboutCourse: {
    fontSize: 18,
    fontWeight: "bold",
    marginTop: 22,
    marginBottom: 8,
  },
  courseContentContainer: {
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
