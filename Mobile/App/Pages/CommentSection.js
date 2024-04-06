import {
  Button,
  Dimensions,
  Image,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from "react-native";
import React, { useContext, useEffect, useState } from "react";
import { Ionicons } from "@expo/vector-icons";
import CommentItem from "../Components/CommentItem";
import MyContext from "../Shared/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";
import axios from "axios";
import { api, endpoints } from "../Shared/GlobalApi";
import { useRoute } from "@react-navigation/native";
import { Feather } from "@expo/vector-icons";

import moment from "moment";
const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;
export default function CommentSection() {
  const [comments, setComments] = useState([]);

  const [content, setContent] = React.useState();
  const param = useRoute();
  const { detailCourse } = param.params;
  const [current_user] = useContext(MyContext);
  const [commentsTemp, setCommentsTemp] = useState([]);
  const loadComments = async () => {
    try {
      let res = await axios.get(endpoints["comments"](detailCourse.id));
      // console.log("load comment", res.data);
      setComments(res.data);
    } catch (ex) {
      console.error(ex);
    }
  };
  const addComment = async () => {
    try {
      let token = await AsyncStorage.getItem("token");
      //   console.log("accessToken", token);
      let res = await api(token).post(
        endpoints["add-comment"](detailCourse.id),
        {
          content: content,
        }
      );
      // lưu comment mới vào danh sách comment đã có
      setComments((current) => [res.data, ...current]);
      setContent("");
    } catch (ex) {
      console.error(ex);
    }
  };

  useEffect(() => {
    loadComments();
  }, []);
  return (
    <View>
      <Text style={styles.commentTitle}>Comment</Text>
      {/* Comment body: */}
      <View style={styles.container}>
        <View style={styles.containerInput}>
          <Image
            style={styles.avatar}
            source={require("./../Assets/Images/home-user.png")}
          />
          <TextInput
            style={styles.input}
            placeholder={"Add a comment..."}
            value={content}
            onChangeText={(t) => setContent(t)}
          />

          <TouchableOpacity style={styles.sendIcon} onPress={addComment}>
            <Ionicons name="send-sharp" size={26} color="black" />
          </TouchableOpacity>
        </View>
      </View>
      {/* A single comment: */}
      <ScrollView style={{ height: 250 }}>
        {comments.length <= 0 ? (
          <Text
            style={{
              marginVertical: 20,
              color: "gray",
              fontStyle: "italic",
            }}
          >
            Hãy thêm bình luận mới
          </Text>
        ) : (
          comments.map((c) => (
            <View style={styles.container}>
              {current_user?.avatar_url === null ? (
                <>
                  <Image
                    style={styles.avatar}
                    source={{
                      uri: "https://res.cloudinary.com/dhdca9ibd/image/upload/v1712114864/courseapp/fdslekh2zaxtvbwhdw97.jpg",
                    }}
                  />
                </>
              ) : (
                <>
                  <Image
                    style={styles.avatar}
                    source={{ uri: current_user?.avatar_url }}
                  />
                </>
              )}

              <View style={styles.containerText}>
                <Text style={styles.displayName}>{c.user.username}</Text>
                <Text style={styles.commentText}>{c.content}</Text>
                <Text
                  style={[
                    styles.displayName,
                    {
                      color: "gray",
                      fontWeight: "normal",
                      fontStyle: "italic",
                    },
                  ]}
                >
                  {moment(c.created_date).fromNow()}
                </Text>
              </View>
            </View>
          ))
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  commentTitle: {
    fontSize: 22,
    fontWeight: "bold",
    marginTop: 18,
    marginBottom: 2,
  },
  container: {
    marginTop: 4,
    // marginBottom: 20,
    flex: 1,
    justifyContent: "flex-start",
  },
  containerInput: {
    flexDirection: "row",
    padding: 10,
    paddingLeft: 0,
    alignItems: "center",
    justifyContent: "center",
  },
  avatar: {
    height: 44,
    width: 44,
  },
  input: {
    width: "82%",
    marginBottom: 8,
    borderBottomWidth: 1,
    padding: 6,
    marginRight: 8,
    marginLeft: 1,
    // shadowOffset: {
    //   width: 0,
    //   height: 4,
    // },
    // shadowOpacity: 0.5, // Độ mờ của shadow
    // shadowRadius: 5, // Bán kính của shadow
    // elevation: 5, // Chỉ áp dụng cho Android, tạo shadow dựa trên elevation
  },
  sendIcon: {
    padding: 4,
  },
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
    fontSize: 15,
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
