import {
  StyleSheet,
  Text,
  View,
  Image,
  TextInput,
  TouchableOpacity,
  ActivityIndicator,
} from "react-native";
import React from "react";
import Colors from "../Shared/Colors";
import { AntDesign } from "@expo/vector-icons";
import { StatusBar } from "expo-status-bar";
import Animated, {
  FadeIn,
  FadeInUp,
  FadeOut,
  FadeInDown,
} from "react-native-reanimated";
import { useNavigation } from "@react-navigation/native";
import { useContext } from "react";
import { useState } from "react";
import MyContext from "../Shared/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { endpoints } from "../Shared/GlobalApi";
import axios from "axios";
import { useEffect } from "react";
import ToastifyMessage from "../Shared/ToastifyMessage";

export default function Login() {
  const navigation = useNavigation();
  const [username, setUsername] = useState();
  const [password, setPassword] = useState();
  const [loading, setLoading] = useState(false);
  const [user, dispatch] = useContext(MyContext);
  const [show, setShow] = useState(false);
  const [error, setError] = useState("");
  const login = async () => {
    // Tạo form data để gửi trong yêu cầu
    const formData = new FormData();
    formData.append("username", username);
    formData.append("password", password);
    formData.append("client_id", "1AiXXkVfi9qbUKx1DyOgZsctavNp41KtQ5cYyRR8");
    formData.append(
      "client_secret",
      "f3UVn9RKPHYsU2ofcdmdSZsInsXaNQMGOF7MgenLfZdGHOZuz4kCO7b5DVhwyYJWQOXJ10FgMWh58oT1dqDXmJhuaAHYtXtvcYTiikEVpcaIYu2PCamBZXrB3FTQH1ZX"
    );
    formData.append("grant_type", "password");
    try {
      if (!username || !password) {
        setError("Please fill out all required fields.");
        setShow(true);
        console.log("Tên đăng nhập và mật khẩu không được trống");
        setTimeout(() => {
          setShow(false);
        }, 2000);
        // console.log(show)
        return;
      } else {
        setLoading(true);
        let response = await axios.post(endpoints["login"], formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        });
        // lưu vào AsyncStorage
        await AsyncStorage.setItem("token", response.data.access_token);
        let { data } = await axios.get(endpoints["current-user"], {
          headers: {
            Authorization: "Bearer " + response.data.access_token,
          },
        });
        // console.log('thông tin', data)
        console.log("Đăng nhập thành công");
        // console.log(response.data.access_token);

        navigation.navigate("home");
        // lưu thông tin user đăng nhập
        try {
          await AsyncStorage.setItem("user", JSON.stringify(data));
          dispatch({
            type: "login",
            payload: data,
          });
          // console.log('dispatch', data)
        } catch (error) {
          console.log("Lỗi khi lưu vào AsyncStorage:", error);
        }
        setLoading(false);
      }
    } catch (error) {
      console.log("Lỗi:", error);
      setError("Incorrect username or password.");
      setShow(true);
      setLoading(false);
    }
  };
  useEffect(() => {
    if (show === true) {
      const timer = setTimeout(() => {
        setShow(false);
      }, 2500);
      return () => clearTimeout(timer);
    }
  }, [show]);
  return (
    <View className="bg-white h-full w-full">
      <StatusBar style="light" />
      <Image
        className="h-full w-full absolute"
        source={require("./../Assets/Images/background.png")}
      />

      {/* lights: */}
      <View className="flex-row justify-around w-full absolute">
        <Animated.Image
          entering={FadeInUp.delay(200).duration(1000).springify().damping(3)}
          className="h-[225] w-[90]"
          source={require("./../Assets/Images/light.png")}
        />
        <Animated.Image
          entering={FadeInUp.delay(300).duration(1000).springify().damping(3)}
          className="h-[160] w-[65]"
          source={require("./../Assets/Images/light.png")}
        />
      </View>

      {/* title and form: */}
      <View className="h-full w-full flex justify-around pt-44 pb-10">
        {/* Title: */}
        <View className="flex items-center">
          <Animated.Text
            entering={FadeInUp.duration(1000).springify()}
            className="text-white font-bold tracking-wider text-5xl"
          >
            Login
          </Animated.Text>
        </View>

        {/* Form: */}
        <View className="flex items-center mx-4 space-y-4">
          <Animated.View
            entering={FadeInDown.duration(1000).springify()}
            className="bg-black/5 p-5 rounded-2xl w-full"
          >
            <TextInput
              value={username}
              onChangeText={(t) => setUsername(t)}
              placeholder="Username"
              placeholderTextColor={"gray"}
            />
          </Animated.View>

          <Animated.View
            entering={FadeInDown.delay(200).duration(1000).springify()}
            className="bg-black/5 p-5 rounded-2xl w-full mb-3"
          >
            <TextInput
              value={password}
              onChangeText={(t) => setPassword(t)}
              placeholder="Password"
              placeholderTextColor={"gray"}
              secureTextEntry
            />
          </Animated.View>

          <Animated.View
            entering={FadeInDown.delay(400).duration(1000).springify()}
            className="w-full"
          >
            {loading === true ? (
              <ActivityIndicator />
            ) : (
              <>
                <TouchableOpacity
                  onPress={login}
                  className="w-full bg-sky-400 p-3 rounded-2xl mb-3"
                >
                  <Text className="text-xl font-bold text-white text-center">
                    Log In
                  </Text>
                </TouchableOpacity>
              </>
            )}
          </Animated.View>
          <Animated.View
            entering={FadeInDown.delay(600).duration(1000).springify()}
            className="flex-row justify-center"
          >
            <Text>Don't have an account? </Text>
            <TouchableOpacity onPress={() => navigation.push("Signup")}>
              <Text className="text-sky-600">Sign Up</Text>
            </TouchableOpacity>
          </Animated.View>
        </View>
      </View>
      {show === true && (
        <ToastifyMessage
          type="danger"
          text={error}
          description="Đăng nhập thất bại"
        />
      )}
    </View>
  );
}

const styles = StyleSheet.create({});
