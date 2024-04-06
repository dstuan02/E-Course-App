import {
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from "react-native";
import React from "react";
import { Feather } from "@expo/vector-icons";
import Colors from "../Shared/Colors";
import { useState } from "react";

export default function SearchBar({ onSearch }) {
  // const [search, setSearch] = useState(" ");

  // const formSearch = () => {
  //   if (search != undefined) onSearch(search);
  //   else console.log("undefined");
  // };
  return (
    <View style={styles.container}>
      <TextInput
        style={styles.left}
        // onChangeText={(text) => setSearch(text)}
        placeholder="Search"
      />
      <TouchableOpacity style={styles.right}>
        <Feather
          name="search"
          size={24}
          color={Colors.gray}
          style={{ marginRight: 10 }}
        />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    display: "flex",
    flexDirection: "row",
    backgroundColor: "#fff",
    paddingLeft: 16,
    borderRadius: 10,
    elevation: 2,
    marginTop: 10,
    alignItems: "center",
  },
  left: {
    width: "80%",
  },
  right: {
    width: "20%",
    borderLeftWidth: 1,
    borderLeftColor: "lightgray",
    paddingVertical: 20,
    paddingHorizontal: 10,
    justifyContent: "center",
    textAlign: "center",
    alignItems: "center",
    // marginLeft: 10,
    // backgroundColor: "red",
    // borderRadius: 10,
  },
});
