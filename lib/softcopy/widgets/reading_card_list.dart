import 'package:flutter/material.dart';
import './../consttants.dart';
import './../widgets/two_side_rounded_button.dart';
import 'package:community_material_icon/community_material_icon.dart';

class ReadingListCard extends StatelessWidget {
  final String image;
  final String  title;
  final String auth;
  final VoidCallback pressDetails;
  final VoidCallback pressRead;
  
  const ReadingListCard({
    super.key, 
    required this.image, 
    required this.title, 
    required this.auth, 
    required this.pressDetails, 
    required this.pressRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            width: 140,
          ),
          Positioned(
            left: 145,
            top: 20,
            child: Column(
              children: <Widget>[
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 7),
                        blurRadius: 20,
                        color: Color(0xFFD3D3D3).withOpacity(.5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Icon(
                      //   Icons.star,
                      //   color: kIconColor,
                      //   //size: 15,
                      // ),
                      Icon(CommunityMaterialIcons.crown, color: kIconColor,),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
              ],
            )
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 85, 
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                      style: TextStyle(color: kBlackColor),
                      children: [
                        TextSpan(
                          text: "$title\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: auth,
                          style: TextStyle(
                            color: kLightBlackColor,
                          ),
                        ),
                      ]
                    )),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: pressDetails,
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Details"),
                        ),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          text: "Read",
                          press: pressRead,
                        )
                      )
                    ],
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}