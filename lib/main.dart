import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[900],
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              print("Home icon pressed");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to the Home Screen",
              style: TextStyle(color: Colors.deepOrange, fontSize: 22),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showTheSheet(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              child: Text("Start", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

void _showTheSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    builder: (context) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: 650,
          width: 320,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: PremiseSheet(),
        ),
      );
    },
  );
}

class PremiseSheet extends StatefulWidget {
  @override
  _PremiseSheetState createState() => _PremiseSheetState();
}

class _PremiseSheetState extends State<PremiseSheet> {
  String? selectedPremise;
  final List<String> premiseTypes = [
    "Commercial",
    "Residential",
    "Patient Care (Hospital, Nursing Home, etc.)",
    "Government",
    "Industrial",
    "Mobile Home",
    "Multi Family",
    "Mixed Use",
    "House",
    "Villa",
  ];

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       appBar: PreferredSize(
  //         preferredSize: Size.fromHeight(50), // Adjust height
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: Color(0xFF01474D), // Background color of the AppBar
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20.0), // Top-left corner radius
  //               topRight: Radius.circular(20.0), // Top-right corner radius
  //             ),
  //           ),
  //           child: AppBar(
  //             automaticallyImplyLeading: false,
  //             backgroundColor: Colors.transparent,
  //             flexibleSpace: Padding(
  //               padding: EdgeInsets.only(left: 10, right: 15, bottom: 5),
  //               child: Align(
  //                 alignment: Alignment.bottomLeft,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   // Space between title and close button
  //                   children: [
  //                     Text(
  //                       "PREMISE TYPE",
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     GestureDetector(
  //                       onTap: () => Navigator.pop(context),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           shape: BoxShape.circle,
  //                         ),
  //                         padding: EdgeInsets.all(3),
  //                         child: Icon(
  //                           Icons.close_rounded,
  //                           color: Color(0xFF01474D),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       body: ClipRRect(
  //         borderRadius: BorderRadius.only(
  //           bottomLeft: Radius.circular(20.0),
  //           bottomRight: Radius.circular(20.0),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(left: 25, top: 10),
  //               child: Text(
  //                 "Select The Premise Type",
  //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: ListView.builder(
  //                   itemCount: premiseTypes.length,
  //                   itemBuilder: (context, index) {
  //                     return RadioListTile(
  //                       title: Text(premiseTypes[index]),
  //                       value: premiseTypes[index],
  //                       groupValue: selectedPremise,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           selectedPremise = value;
  //                         });
  //                       },
  //                       dense: true,
  //                       contentPadding: EdgeInsets.symmetric(
  //                         horizontal: 25,
  //                         vertical: -15,
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ),
  //             Divider(),
  //             Align(
  //               alignment: Alignment.center,
  //               child: ElevatedButton(
  //                 onPressed: selectedPremise != null
  //                     ? () {
  //                   Navigator.pop(context); // Close the bottom sheet
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => NextScreen(selectedPremise!),
  //                     ),
  //                   );
  //                 }
  //                     : null,
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Color(0xFFF6323E),
  //                   disabledBackgroundColor: Colors.grey,
  //                 ),
  //                 child: Text("Submit", style: TextStyle(color: Colors.white)),
  //               ),
  //             ),
  //             SizedBox(height: 8),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF01474D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.only(left: 10, right: 15, bottom: 5, top: 25),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PREMISE TYPE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(1),
                        child: Icon(
                          Icons.close_rounded,
                          color: Color(0xFF01474D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select The Premise Type",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: premiseTypes.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(premiseTypes[index]),
                  value: premiseTypes[index],
                  groupValue: selectedPremise,
                  onChanged: (value) {
                    setState(() {
                      selectedPremise = value;
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: -15,
                  ),
                );
              },
            ),
          ),
          Divider(),
          // Submit Button centered at the bottom
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed:
                  selectedPremise != null
                      ? () {
                        Navigator.pop(context); // Close the bottom sheet
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextScreen(selectedPremise!),
                          ),
                        );
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6323E),
                disabledBackgroundColor: Colors.grey,
              ),
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 8), // Small space after the button
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final String selectedPremise;

  NextScreen(this.selectedPremise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Premise", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have selected: $selectedPremise",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Successfully submitted",
              style: TextStyle(color: Colors.redAccent, fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Thank you for selecting the premise type",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              //(Button for Navigate back to HomeScreen)
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false, //(Removes all previous routes)
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              child: Text("Go to Home", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
