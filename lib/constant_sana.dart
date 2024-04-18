import 'package:flutter/material.dart';


const Color firstBackColor = Color(0xFFA8BEE7) ;
const Color secondBackColor = Color(0xFFAEC9DE) ;
const Color thirdBackColor = Color(0xFFBBC5CE) ;
const Color fourthBackColor = Color(0xFFBDB9C7) ;
const Color fifthBackColor = Color(0xFFD3C8CC) ;
const Color sixBackColor = Color(0xFFD3CACF) ;
const Color seventhBackColor = Color(0xFFDBD9DE) ;
const Color eightBackColor = Color(0xFFD7D2D8) ;
const Color greentheem = Color(0xFF3F968E) ;

const BoxDecoration gradientBackground = BoxDecoration(

    gradient: LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.bottomRight,

        colors: [
          firstBackColor,
          secondBackColor,
          thirdBackColor,
          fourthBackColor,
          fifthBackColor,
          sixBackColor,
          seventhBackColor,
          eightBackColor,


        ]
    )

);