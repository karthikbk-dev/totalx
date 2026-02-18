import 'package:flutter/material.dart';
import 'package:totalx_machine_test/View/Frame1.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search_controller = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return newuser();
            },
          );
        },
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 69,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            Text(
              "Nilambur",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "search by name",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 76,
                    width: 340,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'assets/images/vidheyan.jpg',
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Age :34",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
