import 'package:flutter/material.dart';
import '../constants/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.list, color: isListView ? Colors.blue : Colors.grey),
            onPressed: () => setState(() => isListView = true),
          ),
          IconButton(
            icon: Icon(Icons.grid_view,
                color: !isListView ? Colors.blue : Colors.grey),
            onPressed: () => setState(() => isListView = false),
          ),
          SizedBox(width: 10),
        ],
        elevation: 1,
      ),
      body: isListView ? _buildListView() : _buildGridView(),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
          ),
          child: Row(
            children: [
              Image.asset(cat.icon, height: 40),
              SizedBox(width: 16),
              Expanded(
                child: Text(cat.title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              Icon(Icons.arrow_forward, color: Colors.blue),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(cat.icon, height: 40),
              SizedBox(height: 8),
              Text(
                cat.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
