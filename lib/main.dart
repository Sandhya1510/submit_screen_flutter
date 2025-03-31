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
            Text("Welcome to the Home Screen", style: TextStyle(color: Colors.deepOrange, fontSize: 22),),
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
    builder: (context) {
      return PremiseSheet();
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
    "AWQAF Properties",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                color: Colors.green[900],
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PREMISE TYPE",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0,),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Select The Premise Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6,),
                  child: ListView.builder(
                    itemCount: premiseTypes.length,
                    itemBuilder: (context, index) {
                      return Padding(padding: EdgeInsets.symmetric(vertical: 0,), // Spacing between items
                        child: RadioListTile(
                          title: Text(premiseTypes[index]),
                          value: premiseTypes[index],
                          groupValue: selectedPremise,
                          onChanged: (value) {
                            setState(() {
                              selectedPremise = value;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    selectedPremise != null
                        ? () {
                          Navigator.pop(context); //(Close the bottom sheet)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => NextScreen(selectedPremise!),
                            ),
                          );
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  disabledBackgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                ),
                child: Text("Submit", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
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
            ElevatedButton(                 //(Button for Navigate back to HomeScreen)
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,     //(Removes all previous routes)
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
