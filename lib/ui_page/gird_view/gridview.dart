import 'package:flutter/material.dart';
import 'package:test_ui/ui_page/gird_view/tab_page.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(icon: Icons.mic, title: 'Record', onTap: () => print('Record')),
      GridItem(icon: Icons.upload_file, title: 'Upload', onTap: () => print('Upload')),
      GridItem(icon: Icons.play_arrow, title: 'Play', onTap: () => print('Play')),
      GridItem(
        icon: Icons.settings,
        title: 'Settings',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TwoTabPage()),
          );
        },
      ),
      GridItem(icon: Icons.person, title: 'Profile', onTap: () => print('Profile')),
      GridItem(icon: Icons.info, title: 'About', onTap: () => print('About')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("GridView with InkWell"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: item.onTap,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 40, color: Colors.teal[800]),
                    SizedBox(height: 12),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal[900],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  GridItem({required this.icon, required this.title, required this.onTap});
}
