// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:smesterproject/main.dart';
// import 'settings.dart';
//
// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});
//
//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Center(
//             child: Container(
//                 margin: const EdgeInsets.only(right: 50),
//                 child: const Text(
//                   'Penal Code',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                       color: Colors.brown),
//                 ))),
//       ),
//       drawer: Drawer(
//         backgroundColor: Colors.transparent,
//         child: Container(
//           decoration: const BoxDecoration(gradient: LinearGradient(
//             colors: [
//               Color(0xFFEADDBA),
//               Color(0xffC19A6C),
//               Color(0xffC19A6C),
//               Color(0xffD27D2D),
//             ],
//             stops: [
//               0.01,
//               0.5,
//               0.7,
//               1
//             ],
//             begin: Alignment.topCenter,
//
//             end: Alignment.bottomCenter,
//           )),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(left: 20.0, right: 8.0, top: 70, bottom: 50),
//                 child: Text(
//                   'Profile',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Sections'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Setting'),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const Settings(),
//                       ));
//                 },
//               ),
//               ListTile(
//                 title: const Text('logout'),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const MyLoginPage(title: ""),
//                       ));
//                   // Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//         height: double.infinity,
//         decoration: const BoxDecoration(gradient: LinearGradient(
//           colors: [
//             Color(0xFFEADDBA),
//             Color(0xffC19A6C),
//             Color(0xffC19A6B),
//             Color(0xffD27D2D),
//           ],
//           stops: [
//             0.2,
//             0.5,
//             0.7,
//             1
//           ],
//           begin: Alignment.topCenter,
//
//           end: Alignment.bottomCenter,
//         )),
//         child: SingleChildScrollView(
//           child: Container(
//             margin: const EdgeInsets.only(top: 100),
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(left: 10.0, top: 8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Hello, ',
//                         style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         'name variable',
//                         style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                       Text(
//                         '!',
//                         style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Text("You can search your queries here"),
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         border: Border.all(color: Colors.brown, width: 2,),
//                       ),
//                       child: Row(
//                         children: [
//                           const Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Opacity(
//                                 opacity: 0.5,
//                                 child: TextField(
//                                   decoration: InputDecoration(fillColor: Colors.blue,
//                                     hintText: 'Search...',
//                                     border: InputBorder.none,
//
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.search),
//                             onPressed: () {
//                               // Handle search icon tap
//                               // You can implement search functionality here
//                               // print('Search icon tapped');
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.03),
//                   padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.01, right:MediaQuery.sizeOf(context).width*0.01),
//                   height: MediaQuery.sizeOf(context).height*0.2,
//                   width: MediaQuery.sizeOf(context).width*1,
//                   child: CarouselSlider(
//                     items: [
//                        Padding(
//                          padding: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*0.01, right: MediaQuery.sizeOf(context).width*0.01),
//                          child: SizedBox(
//                           // height: MediaQuery.sizeOf(context).height*0.01,
//                           width: MediaQuery.sizeOf(context).width*0.8,
//                           child: const Card(
//                             child: ListTile(
//                               title: Text('Card 1'),
//                               subtitle: Text('Description for Card 1'),
//                             ),
//                           ),
//                                                ),
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*0.01, right: MediaQuery.sizeOf(context).width*0.01),
//                          child: SizedBox(
//                           // height: 100,
//                           width: MediaQuery.sizeOf(context).width*0.8,
//                           child: const Card(
//                             child: ListTile(
//                               title: Text('Card 2'),
//                               subtitle: Text('Description for Card 2'),
//                             ),
//                           ),
//                                                ),
//                        ),
//                        Padding(
//                          padding: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*0.01, right: MediaQuery.sizeOf(context).width*0.01),
//                          child: SizedBox(
//                           // height: 200,
//                           width: MediaQuery.sizeOf(context).width*0.8,
//                           child: const Card(
//                             child: ListTile(
//                               title: Text('Card 3'),
//                               subtitle: Text('Description for Card 3'),
//                             ),
//                           ),
//                                                ),
//                        ),
//                     ], options: CarouselOptions(autoPlay: true),
//                   ),
//                 ),
//                 const SingleChildScrollView(
//                   child: Column(children: [
//                     SizedBox(
//                       height: 200,
//                       width: 300,
//                       child: Card(
//                         child: ListTile(
//                           title: Text('Card 1'),
//                           subtitle: Text('Description for Card 1'),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: SizedBox(
//                         height: 200,
//                         width: 300,
//                         child: Card(
//                           child: ListTile(
//                             title: Text('Card 2'),
//                             subtitle: Text('Description for Card 2'),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: SizedBox(
//                         height: 200,
//                         width: 300,
//                         child: Card(
//                           child: ListTile(
//                             title: Text('Card 3'),
//                             subtitle: Text('Description for Card 3'),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 )
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'my_profile_page.dart'; // Import your profile page file
// Import your free legal advice page file
// Import your rate us page file
// Import your share page file
// Import your terms of use page file
import 'my_questions_page.dart'; // Import your my questions page file
import 'legal_guidance_page.dart'; // Import your legal guidance page file
import 'study_material_page.dart'; // Import your study material page file

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penal Code'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Implement your slider here
            // Implement your search bar here

            // Dropdown menu
            DropdownButton<String>(
              items: const [
                DropdownMenuItem(
                  value: 'home',
                  child: Text('Home'),
                ),
                DropdownMenuItem(
                  value: 'my_profile',
                  child: Text('My Profile'),
                ),
                DropdownMenuItem(
                  value: 'free_legal_advice',
                  child: Text('Free Legal Advice'),
                ),
                DropdownMenuItem(
                  value: 'rate_us',
                  child: Text('Rate Us'),
                ),
                DropdownMenuItem(
                  value: 'share',
                  child: Text('Share'),
                ),
                DropdownMenuItem(
                  value: 'terms_of_use',
                  child: Text('Terms of Use'),
                ),
              ],
              onChanged: (value) {
                // Handle dropdown item selection
                // You can use Navigator to navigate to different pages based on the selected value
              },
            ),

            // Implement your slider here

            // Icons below slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.question_answer),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyQuestionsPage()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.policy),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LegalGuidancePage()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.menu_book),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyMaterialPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle bottom navigation item taps
          // You can use Navigator to navigate to different screens based on the index
          switch (index) {
            case 0:
            // Navigate to home page
              break;
            case 1:
            // Navigate to search page
              break;
            case 2:
            // Navigate to book page
              break;
            case 3:
            // Navigate to profile page
              break;
          }
        },
      ),
    );
  }
}
