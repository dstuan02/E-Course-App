import { StyleSheet, Text, View, Image, TouchableOpacity } from "react-native";
import React, { useEffect, useState } from "react";
import Colors from "../Shared/Colors";
import { Feather } from "@expo/vector-icons";
import axios from "axios";
import { endpoints } from "../Shared/GlobalApi";

export default function CommentItem() {
  const [comment, setComments] = useState("");
  const loadComments = async () => {
    try {
      let res = await axios.get(endpoints["comments"](detailCourse.id));
      console.log("load comment", res.data);
      setComments(res.data);
    } catch (ex) {
      console.error(ex);
    }
  };
  useEffect(() => {
    loadComments();
  }, [comment]);
  return (
    <View>
      {/* A single comment: */}
      <View style={styles.container}>
        <Image
          style={styles.avatar}
          source={require("./../Assets/Images/home-user.png")}
        />

        <View style={styles.containerText}>
          <Text style={styles.displayName}>@tuandang</Text>
          <Text style={styles.commentText}>
            This course is sogggggggggg good. Keep it going!
          </Text>

          <View style={styles.reactComment}>
            <TouchableOpacity style={styles.reactCommentBtn}>
              <Feather name="thumbs-up" size={24} color="black" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.reactCommentBtn}>
              <Feather name="thumbs-down" size={24} color="black" />
            </TouchableOpacity>
          </View>
        </View>
      </View>

      {/* A single comment: */}
      <View style={styles.container}>
        <Image
          style={styles.avatar}
          source={require("./../Assets/Images/home-user.png")}
        />

        <View style={styles.containerText}>
          <Text style={styles.displayName}>@tuandang</Text>
          <Text style={styles.commentText}>
            This course is so good. Keep it going!
          </Text>

          <View style={styles.reactComment}>
            <TouchableOpacity style={styles.reactCommentBtn}>
              <Feather name="thumbs-up" size={24} color="black" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.reactCommentBtn}>
              <Feather name="thumbs-down" size={24} color="black" />
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 18,
    flexDirection: "row",
    alignItems: "flex-start",
    flex: 1,
  },
  commentText: {
    flex: 1,
    marginLeft: 4,
    flexWrap: "wrap",
    fontSize: 14,
    marginVertical: 6, // margin top & bottom (dọc)
  },
  avatar: {
    height: 44,
    width: 44,
  },
  containerText: {
    marginHorizontal: 8,
  },
  displayName: {
    color: "grey",
    fontSize: 14,
    fontWeight: "bold",
  },
  // React Comment:
  reactComment: {
    flexDirection: "row",
  },
  reactCommentBtn: {
    padding: 8,
    paddingTop: 6,
    marginRight: 10,
  },
});
