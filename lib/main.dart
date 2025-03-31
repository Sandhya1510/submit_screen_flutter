import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showTheSheet(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
          ),
            child: Text("Start", style: TextStyle(color: Colors.white))
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
      return FractionallySizedBox(      //(It will display fullscreen)
        heightFactor: 1,
        child: PremiseSheet(),
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
    "AWQAF Properties",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            color: Colors.green[900],
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PREMISE TYPE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          // Text("Select The Premise Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select The Premise Type",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: premiseTypes.length,
              itemBuilder: (context, index) {
                return RadioListTile(               //(The premise types will display with radio buttons)
                    title: Text(premiseTypes[index]),
                    value: premiseTypes[index],
                    groupValue: selectedPremise,
                    onChanged: (value) {
                      setState(() {
                        selectedPremise = value;
                      });
                    }
                );
              },
            ),
          ),
          Divider(),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: selectedPremise != null
                ? () {
              Navigator.pop(context); //(Close the bottom sheet)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextScreen(selectedPremise!)),
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
    );
  }
}











































