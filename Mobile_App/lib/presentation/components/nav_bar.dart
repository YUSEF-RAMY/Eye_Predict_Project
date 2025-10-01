import 'package:eye_app/presentation/screens/old_picture_screen/old_picture_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen/home_screen.dart';


class NavBar extends StatelessWidget {
  final bool isHome;
  final bool isOldPicture;

  const NavBar({super.key, required this.isHome, required this.isOldPicture});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 68,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            children: [
              Spacer(
                flex: 12,
              ),
              GestureDetector(
                onTap: (){
                  if(isHome!=true){
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 28,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 18,
              ),
              GestureDetector(
                onTap: (){
                  if(isOldPicture!=true){
                    Navigator.pushReplacementNamed(context, OldPictureScreen.id);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    Text(
                      "Old Picture",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
