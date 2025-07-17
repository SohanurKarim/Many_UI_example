import 'package:flutter/material.dart';

class TwoTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text("2 Tab View Example"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tab One", icon: Icon(Icons.dashboard)),
              Tab(text: "Tab Two", icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // First Tab Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dashboard, size: 80, color: Colors.teal),
                  SizedBox(height: 20),
                  Text(
                    "This is Tab One",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Second Tab Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, size: 80, color: Colors.teal),
                  SizedBox(height: 20),
                  Text(
                    "This is Tab Two",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
