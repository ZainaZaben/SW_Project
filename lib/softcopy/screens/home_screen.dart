import 'package:flutter_project_1st/softcopy/screens/details_screen.dart';
import 'package:flutter_project_1st/softcopy/widgets/book_rating.dart';

import './../consttants.dart';
import 'package:flutter/material.dart';
import './../widgets/reading_card_list.dart';


class softcopy extends StatefulWidget {
  const softcopy({super.key});

  @override
  State<softcopy> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<softcopy> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .1,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.displaySmall,
                        children: [
                          TextSpan(
                            text: "What are you \nreading ",
                            // style: TextStyle(
                            //   fontSize: 30,
                            // )
                          ),
                          TextSpan(
                            text: "Today?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                             // fontSize: 30,
                            )
                          )
                        ],
                      )
                    ),
                  ),
                  SizedBox(height: 30,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ReadingListCard(
                          image: "assets/security.jpg",
                          title: "Security",
                          auth: "DR.Abdullah Rashed",
                          pressDetails: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context){
                                  return DetailsScreen();
                                },
                              ),
                            );
                          },
                          pressRead: (){},
                        ),
                        ReadingListCard(
                          image: "assets/security.jpg",
                          title: "Security",
                          auth: "DR.Abdullah Rashed",
                          pressDetails: (){},
                          pressRead: (){},
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.displaySmall,
                            children: [
                              TextSpan(text: "Best of the "),
                              TextSpan(
                                text: "day!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ]
                          )
                        ),
                        beatOfTheDay(size, context),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.displaySmall,
                            children: [
                              TextSpan(text: "Continue "),
                              TextSpan(
                                text: "reading...", 
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(38.5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 33,
                                color: Color(0xFFD3D3D3).withOpacity(.84),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30, right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "security",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "DR.Abdullah Rashed",
                                                style: TextStyle(
                                                  color: kLightBlackColor,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: Text(
                                                  "chapter 2 of 4",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: kLightBlackColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/security.jpg",
                                          width: 55,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 7,
                                  width: size.width * .65,
                                  decoration: BoxDecoration(
                                    color: kProgressIndicator,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container beatOfTheDay(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 230,
      child: Stack(
        children: <Widget>[
           Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 24, top: 24, right: size.width * .35),
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAEAEA).withOpacity(.45),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "FOURTH WING", 
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "by Rebecca Yarros",
                        style: TextStyle(color: kLightBlackColor),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          BookRating(score: 4.9),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text("Violet Sorrengail is urged by the commanding general, who also ...",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: kLightBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset("assets/fourthWing.png"),
              width: size.width * .37,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 40,
                width: size.width * .35,
                child: TwoSideRoundedButton(
                  text: "Read",
                  radious: 24,
                  press: (){},
                ),
              ),
            ),
          ],
        ),
      );
  }
}



class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  final double radious;
  final VoidCallback press;
  const TwoSideRoundedButton({
    Key? key,
    required this.text,
    this.radious = 29,                
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radious),
            bottomRight: Radius.circular(radious),
          )
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}