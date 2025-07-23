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
                  // Icon(Icons.dashboard, size: 80, color: Colors.teal),
                  // SizedBox(height: 20),
                  // Text(
                  //   "This is Tab One",
                  //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  // ),
                  Card(
                    margin: EdgeInsets.all(12),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left side: Icon, Name, Email
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: Icon(Icons.person, size: 30),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'john.doe@example.com',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Right side: Call and Favorite Icons
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.call, color: Colors.green),
                                onPressed: () {
                                  // Call action
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.favorite_border, color: Colors.red),
                                onPressed: () {
                                  // Favorite action
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )

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
