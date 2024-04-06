import { Dimensions, FlatList, Image, StyleSheet, Text, View } from 'react-native'
import React from 'react'

export default function Slider() {
  return (
    <View style={styles.container}>
        {/* <FlatList 
            data={slider}
            renderItem={({item}) => (
                <View>...<View/>
            )}
        /> */}
        <View style={{width: '100%'}}>
            <Image 
                style={styles.imgSlider} 
                source={require('./../Assets/Images/slider.png')}/>
        </View>
        
    </View>
  )
}

const styles = StyleSheet.create({
    container: {
        marginTop: 24,
    },
    imgSlider: {
        // width: Dimensions.get('screen').width,
        width: '100%',
        height: 200,
        borderRadius: 10,
    },
})