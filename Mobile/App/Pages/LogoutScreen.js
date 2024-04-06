import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  ScrollView,
  Image,
} from "react-native";
import React, { useContext } from "react";
import { FontAwesome } from "@expo/vector-icons";
import { SafeAreaView } from "react-native-safe-area-context";
import { AntDesign } from "@expo/vector-icons";
import { Ionicons } from "@expo/vector-icons";
import Colors from "../Shared/Colors";
import { useNavigation } from "@react-navigation/native";
import { MaterialIcons } from "@expo/vector-icons";
import { Feather } from "@expo/vector-icons";
import { Fontisto } from "@expo/vector-icons";
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from "../Shared/MyContext";

export default function LogoutScreen() {
  const navigation = useNavigation();
  const [current_user, dispatch] = useContext(MyContext);

  const logout = async () => {
    await AsyncStorage.removeItem("token");
    navigation.navigate("Login");
  };
  return (
    <View style={styles.container}>
      <TouchableOpacity
        style={styles.arrowBack}
        onPress={() => navigation.goBack()}
      >
        <Ionicons name="arrow-back" size={24} color="#fff" />
      </TouchableOpacity>

      {/* Logout page: */}
      <View style={styles.logoutContainer}>
        <Text style={styles.profile}>Profile</Text>

        <View style={styles.profileImgContainer}>
          <Image
            style={styles.profileImg}
            source={require('./../Assets/Images/shiba.png')}
            // source={{ uri: current_user?.avatar_url }}
          />
          <Text style={styles.profileUserName}>
            {current_user.last_name} {current_user.first_name}
          </Text>
          <Text style={styles.profileEmail}>{current_user?.email}</Text>
        </View>

        <View style={styles.profileOption}>
          <View>
            <View style={styles.optionContainer}>
              <Feather name="home" size={30} color={Colors.primary} />
              <Text style={styles.optionText}>Home</Text>
            </View>
            <View style={styles.optionContainer}>
              <MaterialIcons name="save-alt" size={30} color={Colors.primary} />
              <Text style={styles.optionText}>Saved</Text>
            </View>
            <View style={styles.optionContainer}>
              <Fontisto name="email" size={30} color={Colors.primary} />
              <Text style={styles.optionText}>{current_user?.email}</Text>
            </View>
          </View>
          <TouchableOpacity style={styles.LogoutBtn} onPress={logout}>
            <MaterialIcons name="logout" size={30} color="#fff" />
            <Text style={styles.optionTextLog}>Log out</Text>
          </TouchableOpacity>
        </View>
      </View>
      {/* End: Logout page */}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: Colors.primary,
  },
  arrowBack: {
    paddingTop: 34,
    paddingLeft: 30,
  },
  // Logout page:
  logoutContainer: {
    margin: 0,
    padding: 0,
    paddingTop: 20,
  },
  profile: {
    fontSize: 38,
    fontWeight: "bold",
    textAlign: "center",
    color: Colors.white,
    marginBottom: 22,
  },
  profileImgContainer: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
  },
  profileImg: {
    width: 150,
    height: 150,
    borderRadius: '78%',
  },
  profileUserName: {
    fontSize: 26,
    fontWeight: "bold",
    color: Colors.white,
    marginTop: 8,
  },
  profileEmail: {
    fontSize: 18,
    color: Colors.white,
    paddingVertical: 10,
  },
  profileOption: {
    backgroundColor: Colors.bgColor,
    paddingTop: 50,
  },
  optionContainer: {
    flexDirection: "row",
    alignItems: "center",
    gap: 10,
    marginBottom: 30,
    paddingHorizontal: 50,
  },
  LogoutBtn: {
    flexDirection: "row",
    alignItems: "center",
    height: 60,
    width: "90%",
    gap: 10,
    backgroundColor: "#d63741",
    borderRadius: 30,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 10,
    marginBottom: 0,
    marginRight: "auto",
    marginLeft: "auto",
  },
  optionText: {
    color: '#000',
    fontSize: 18,
  },
  optionTextLog: {
    fontSize: 18,
    fontWeight: "bold",
    color: Colors.white,
  },
});
