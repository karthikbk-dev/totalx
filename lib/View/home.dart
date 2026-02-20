import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_test/View/Frame1.dart';
import 'package:totalx_machine_test/Viewmodel/user_provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  String? sortvalueradiobutton = 'ALL';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    final search_controller = TextEditingController();
    final namectrl = TextEditingController();
    final agectrl = TextEditingController();
    final searchFilterCtr = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
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
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setStateSheet) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Sort", style: TextStyle(fontSize: 18)),

                                  SizedBox(height: 20),
                                  RadioListTile(
                                    value: 'All',
                                    groupValue: sortvalueradiobutton,
                                    onChanged: (value) {
                                      setStateSheet(() {
                                        sortvalueradiobutton = value!;
                                      });
                                      if (value == 'All') {
                                        provider.filtereduserdetails =
                                            provider.userdetails;
                                      } else if (value == 'Age: Younger') {
                                        provider.sortByAge(true);
                                      } else if (value == 'Age: Elder') {
                                        provider.sortByAge(false);
                                      }
                                    },
                                    title: Text(
                                      'All',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),

                                  RadioListTile(
                                    value: 'Age: Elder',
                                    groupValue: sortvalueradiobutton,
                                    onChanged: (value) {
                                      setStateSheet(() {
                                        sortvalueradiobutton = value!;
                                      });
                                      if (value == 'All') {
                                        provider.filtereduserdetails =
                                            provider.userdetails;
                                      } else if (value == 'Age: Younger') {
                                        provider.sortByAge(true);
                                      } else if (value == 'Age: Elder') {
                                        provider.sortByAge(false);
                                      }
                                    },
                                    title: Text(
                                      'Age: Elder',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  RadioListTile(
                                    value: 'Age: Younger',
                                    groupValue: sortvalueradiobutton,
                                    onChanged: (value) {
                                      setStateSheet(() {
                                        sortvalueradiobutton = value!;
                                      });
                                      if (value == 'All') {
                                        provider.filtereduserdetails =
                                            provider.userdetails;
                                      } else if (value == 'Age: Younger') {
                                        provider.sortByAge(true);
                                      } else if (value == 'Age: Elder') {
                                        provider.sortByAge(false);
                                      }
                                    },
                                    title: Text(
                                      'Age: Younger',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.userdetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 76,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                  'assets/images/login_image.png',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      provider.userdetails[index].name ??
                                          'no name',

                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Age :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),

                                    Text(
                                      provider.userdetails[index].age ?? "",
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
