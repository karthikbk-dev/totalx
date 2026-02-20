import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_test/View/Frame1.dart';
import 'package:totalx_machine_test/Viewmodel/user_provider.dart';
//import 'package:totalx_machine_test/View/newuser.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController searchController;
  String selectedSort = 'All';

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();

    Future.microtask(
      () => Provider.of<UserProvider>(context, listen: false).fetchdata(),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: () {
          showDialog(context: context, builder: (_) => const newuser());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        toolbarHeight: 69,
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: 5),
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
          // ---------------- SEARCH + FILTER ----------------
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      provider.searchUser(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search by name",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => _showSortBottomSheet(provider),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.filter_list, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // ---------------- USER LIST ----------------
          Expanded(
            child: provider.filtereduserdetails.isEmpty
                ? const Center(child: Text("No data found"))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: provider.filtereduserdetails.length,
                    itemBuilder: (context, index) {
                      final user = provider.filtereduserdetails[index];

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Avatar
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: user.image != null
                                    ? MemoryImage(base64Decode(user.image!))
                                    : const AssetImage("assets/images/1234.jpg")
                                          as ImageProvider,
                              ),

                              const SizedBox(width: 15),

                              // User Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user.name ?? 'No Name',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Age: ${user.age ?? ''}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "Number: ${user.phone ?? ''}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

  void _showSortBottomSheet(UserProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateSheet) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sort",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  RadioListTile<String>(
                    value: 'All',
                    groupValue: selectedSort,
                    onChanged: (value) {
                      setStateSheet(() => selectedSort = value!);
                      provider.resetFilter();
                      Navigator.pop(context);
                    },
                    title: const Text("All"),
                  ),

                  RadioListTile<String>(
                    value: 'Age: Elder',
                    groupValue: selectedSort,
                    onChanged: (value) {
                      setStateSheet(() => selectedSort = value!);
                      provider.sortByAge(ascending: false);
                      Navigator.pop(context);
                    },
                    title: const Text("Age: Elder"),
                  ),

                  RadioListTile<String>(
                    value: 'Age: Younger',
                    groupValue: selectedSort,
                    onChanged: (value) {
                      setStateSheet(() => selectedSort = value!);
                      provider.sortByAge(ascending: true);
                      Navigator.pop(context);
                    },
                    title: const Text("Age: Younger"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
