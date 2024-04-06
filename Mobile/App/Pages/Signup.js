import {
  StyleSheet,
  Text,
  View,
  Image,
  TextInput,
  TouchableOpacity,
  ScrollView,
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
import { endpoints } from "../Shared/GlobalApi";
import { useNavigation } from "@react-navigation/native";
import { useState } from "react";
import axios from "axios";
import { useEffect } from "react";
import ToastifyMessage from "../Shared/ToastifyMessage";

export default function Signup() {
  const navigation = useNavigation();
  const [user, setUser] = useState({
    first_name: "",
    last_name: "",
    username: "",
    password: "",
    email: "",
  });

  const [loading, setLoading] = useState(false);
  const [show, setShow] = useState(false);
  const [message, setMessage] = useState("");

  const validateInput = () => {
    for (let field in user) {
      if (user[field] === "") {
        setMessage("Please fill out all required fields.");
        setShow(true);
        return false;
      }
    }
    return true;
  };

  const register = async () => {
    setLoading(true);
    if (!validateInput()) {
      setLoading(false);
      return;
    }

    const formData = new FormData();
    for (let field in user) {
      formData.append(field, user[field]);
    }
    try {
      setLoading(true);
      let res = await axios.post(endpoints["register"], formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      setMessage("Đăng ký thành công");
      setShow(true);

      navigation.navigate("Login");

      setLoading(false);
    } catch (ex) {
      console.error(ex);
      setMessage("Đã xảy ra lỗi");
      setShow(true);
      setLoading(false);
    }
  };

  const change = (field, value) => {
    setUser((current) => {
      return { ...current, [field]: value };
    });
  };
  useEffect(() => {
    if (show === true) {
      const timer = setTimeout(() => {
        setShow(false);
      }, 2000);
      return () => clearTimeout(timer);
    }
  }, [show]);
  return (
    <View className="bg-white h-full w-full">
      	<StatusBar style="light" />
		<Image
			className="h-2/3 w-full absolute"
			source={require("./../Assets/Images/background.png")}
		/>

      {/* lights: */}
		<View className="flex-row justify-around w-full absolute">
			<Animated.Image
			entering={FadeInUp.delay(200).duration(1000).springify().damping(3)}
			className="h-[220] w-[90]"
			source={require("./../Assets/Images/light.png")}
			/>
			<Animated.Image
			entering={FadeInUp.delay(300).duration(1000).springify().damping(3)}
			className="bottom-20 h-[160] w-[65]"
			source={require("./../Assets/Images/light.png")}
			/>
		</View>

      {/* title and form: */}
		<View className="h-full w-full flex justify-around pt-32">
			{/* Title: */}
			<View className="flex items-center">
				<Animated.Text
					entering={FadeInUp.duration(1000).springify()}
					className="bottom-16 text-white font-bold tracking-wider text-5xl">
					Sign Up
				</Animated.Text>
			</View>

			{/* Form: */}
			<View className="flex items-center mx-4 space-y-4">
				{/* First name: */}
				<Animated.View
					entering={FadeInDown.delay(200).duration(1000).springify()}
					className="bg-black/5 p-5 rounded-2xl w-full">
					<TextInput
						value={user.first_name}
						onChangeText={(t) => change("first_name", t)}
						placeholder="Firstname"
						placeholderTextColor={"gray"}/>
				</Animated.View>
				
				{/* Last name: */}
				<Animated.View
					entering={FadeInDown.delay(400).duration(1000).springify()}
					className="bg-black/5 p-5 rounded-2xl w-full"
				>
					<TextInput
					value={user.last_name}
					onChangeText={(t) => change("last_name", t)}
					placeholder="Lastname"
					placeholderTextColor={"gray"}/>
				</Animated.View>
				
				{/* User name: */}
				<Animated.View
					entering={FadeInDown.delay(600).duration(1000).springify()}
					className="bg-black/5 p-5 rounded-2xl w-full">
					<TextInput
					value={user.username}
					onChangeText={(t) => change("username", t)}
					placeholder="Username"
					placeholderTextColor={"gray"}
					/>
				</Animated.View>

				<Animated.View
					entering={FadeInDown.delay(800).duration(1000).springify()}
					className="bg-black/5 p-5 rounded-2xl w-full"
				>
					<TextInput
					placeholder="Email"
					placeholderTextColor={"gray"}
					value={user.email}
					onChangeText={(t) => change("email", t)}
					/>
				</Animated.View>

				<Animated.View
					entering={FadeInDown.delay(1000).duration(1000).springify()}
					className="bg-black/5 p-5 rounded-2xl w-full mb-3"
				>
					<TextInput
					value={user.password}
					onChangeText={(t) => change("password", t)}
					placeholder="Password"
					placeholderTextColor={"gray"}
					secureTextEntry
					/>
				</Animated.View>

				<Animated.View
					entering={FadeInDown.delay(1200).duration(1000).springify()}
					className="w-full">
					<TouchableOpacity
					className="w-full bg-sky-400 p-3 rounded-2xl mb-3"
					onPress={register}
					>
					<Text className="text-xl font-bold text-white text-center">
						Sign Up
					</Text>
					</TouchableOpacity>
				</Animated.View>
				<Animated.View
					entering={FadeInDown.delay(1400).duration(1000).springify()}
					className="flex-row justify-center"
				>
					<Text>Already have an account? </Text>
					<TouchableOpacity onPress={() => navigation.push("Login")}>
					<Text className="text-sky-600">Login</Text>
					</TouchableOpacity>
				</Animated.View>
			</View>
		</View>
      {show === true && (
        <ToastifyMessage
			type="danger"
			text={message}
			description="Đăng ký thất bại"
        />
      )}
    </View>
  );
}

const styles = StyleSheet.create({});
