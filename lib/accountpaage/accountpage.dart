import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1st/chatpage/chatpage.dart';
import 'package:flutter_project_1st/favoritepage/favoritepage.dart';
import 'package:flutter_project_1st/homepage/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_project_1st/accountpaage/data.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _currentIndex = 0;
  final double coverHeight = 240;
  final double profileHeight = 144;
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContenet(),
          buildTable(),
          buildMyProduct(),
        ],
      )
    );
  }

  
  Widget buildTop(){
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage(),
          ),
          Positioned(
            top: top,
            child: buildProfileImage(),
          )
        ],
      );
  }

  Widget buildContenet() => Column(
    children: [
      const SizedBox(height: 8),
      Text(
        'Dana Zaben',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
          'Flutter Software Engineer',
          style: TextStyle(fontSize: 20, color: Colors.black),
      ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              buildUploadPost(text: 'Upload Post'),
              const SizedBox(height: 12,),
          ],
        ),
        const SizedBox(height: 16),
        Divider(),
        const SizedBox(height: 16),
        buildAbout(),
        const SizedBox(height: 32),
    ],  
  );

  Widget buildAbout() => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'Flutter Software Engineer and Google Developer',
          style: TextStyle(fontSize: 18,height: 1.4),
        ),
    ]),
  );

  Widget buildUploadPost({
    required String text,
  }) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Upload Post',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ]
        ),
      );

  // Widget buildUploadPost(IconData icon) => Container(
  //   child: Material(
  //     shape: CircleBorder(),
  //     clipBehavior: Clip.hardEdge,
  //     color: Colors.transparent,
  //     child: InkWell(
  //       onTap: () {},
  //       child: Center(child: Icon(icon, size: 32,)),
  //     ),
  //   )
  // );

  Widget buildCoverImage() => Container(
  width: double.infinity,
  height: coverHeight,
  decoration: BoxDecoration(
    color: Color(0xFFc0edda),
    image: DecorationImage(
      image: AssetImage("assets/background.jpg"),
      fit: BoxFit.cover,
    ),
  ),
);


  Widget buildProfileImage() => Stack(
      children: [
        CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          //backgroundImage: AssetImage("assets/FLOWER2.jpg"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 46,
            width: 46,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.white),
                ),
                backgroundColor: const Color(0xFFF5F6F9),
              ),
              onPressed: () {},
              child: Image.asset("assets/camera.png"),
            ),
          ),
        ),
      ],
    );


  Widget buildTable() => Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Table(
          border: TableBorder.all(color: Colors.white30),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            const TableRow(
              decoration: BoxDecoration(
                color: Color(0xFFc0edda),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Name'),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Name'),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Name'),
                  ),
                ),
              ],
            ),
            ...List.generate(
              4,
              (index) => const TableRow(
                children: [ 
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cell 1'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cell 1'),
                    ),
                  ),
                 
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Cell 1'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget buildMyProduct() => Center(
  child: Container(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //const SizedBox(height: 16),
        Divider(),
        //const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Products',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              Text(
                'See All',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            childAspectRatio: 0.73,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(data[index]['color']),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                        ),
                        Image.network(
                          data[index]['image'],
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  data[index]['name'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  '₪'+ data[index]['price'],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            );
          },
        ),
      ],
    ),
  ),
);

   
}

