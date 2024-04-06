import { AntDesign } from "@expo/vector-icons";
import { duration } from "moment/moment";
import React, {
  forwardRef,
  useEffect,
  useImperativeHandle,
  useState,
} from "react";
import {StyleSheet, Text, View } from "react-native";
import Animated, {
  FadeIn,
  FadeInUp,
  FadeOut,
  FadeInDown,
  FlipInEasyX, FlipOutEasyX, BounceIn, LightSpeedInRight, LightSpeedOutLeft, LightSpeedOutRight, LightSpeedInLeft, BounceOut
} from "react-native-reanimated";

const ToastifyMessage = forwardRef(
  ({ type = "success", text, description, timeout }, ref) => {
    const TOAST_TYPE = {
      success: {
        bgColol: "#2ecc71",
        icon: "checkcircleo",
      },
      danger: {
        bgColol: "#e74c3c",
        icon: "closecircleo",
      },
      info: {
        bgColol: "#3498db",
        icon: "infocirlceo",
      },
      warning: {
        bgColol: "#f39c12",
        icon: "warning",
      },
    };
    const background = TOAST_TYPE[type].bgColol;
    const icon = TOAST_TYPE[type].icon;

    const [visible, setVisible] = useState(true);

    useImperativeHandle(ref, () => ({
      show: showToast,
    }));

    if (!visible) {
      return null;
    }
    return (
      <>
        <Animated.View
          entering={BounceIn.duration(500)} exiting={BounceOut}
          style={[style.container, { backgroundColor: background }]}
        >
          <View style={{ marginRight: 10 }}>
            <AntDesign name={icon} size={30} color={"#ffff"} />
          </View>
          <View>
            <Text style={style.text}>{text}</Text>
          </View>
        </Animated.View>
      </>
    );
  }
);
const style = StyleSheet.create({
  container: {
    // backgroundColor: 'red',
    // backgroundColor: backgroundColor,
    zIndex: 100,
    width: "90%",
    textAlign: "left",
    padding: 20,
    position: "absolute",
    top: "5%",
    marginHorizontal: "5%",
    borderRadius: 10,
    shadowColor: "#0000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.6,
    shadowRadius: 3.84,
    elevation: 5,
    flexDirection: "row",
    // justifyContent: 'space-evenly',
    alignItems: "center",
  },
  text: {
    color: "white",
  },
});
export default ToastifyMessage;
