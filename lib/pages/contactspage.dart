import 'package:flutter/material.dart';
import 'package:streaming_videocall_app/pages/joinscreen.dart';

class contacts extends StatefulWidget {
  const contacts({super.key});

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
   final TextEditingController _searchController = TextEditingController();
   final List<String> _allContacts = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Davis',
    'Diana Prince',
    'Eve Adams'
  ];
  List<String> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = _allContacts;
    _searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterContacts);
    _searchController.dispose();
    super.dispose();
  }

  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _allContacts
          .where((contact) => contact.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 11, 64, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 66, 112, 1),
        foregroundColor: Color.fromRGBO(244, 245, 251, 1),
        title: Text(
          "Contacts",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(  controller: _searchController,
                style: TextStyle(
                    color: Color.fromRGBO(1, 18, 24, 1),
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    fillColor: Color.fromRGBO(244, 245, 251, 1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(244, 245, 251, 1))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(244, 245, 251, 1)))),
              ),
              SizedBox(height: 20,),
               ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _filteredContacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromRGBO(5, 66, 112, 1),
                      child: ListTile(
                        title: Text(
                          _filteredContacts[index],
                          style: TextStyle(
                            color: Color.fromRGBO(244, 245, 251, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(Icons.account_circle, color: Color.fromRGBO(244, 245, 251, 1)),
                        trailing: IconButton(
                          icon: Icon(Icons.phone, color: Color.fromRGBO(244, 245, 251, 1)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return JoinScreen();
                            }));
                          },
                        ),
                      ),margin: EdgeInsets.all(10),
                    );
                  },
                ),
              SizedBox(height: 300,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(style: IconButton.styleFrom(
                    backgroundColor:  Color.fromRGBO(5, 66, 112, 1),
                    foregroundColor:  Color.fromRGBO(244, 245, 251, 1)
                  ),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return JoinScreen();
                    },));
                  }, icon: Icon(Icons.add_ic_call_rounded,),iconSize: 30,),
                ],
              ),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: Color.fromRGBO(5, 66, 112, 1),
              //         foregroundColor: Color.fromRGBO(244, 245, 251, 1)),
              //     onPressed: () {
              //       Navigator.push(context, MaterialPageRoute(
              //         builder: (context) {
              //           return JoinScreen();
              //         },
              //       ));
              //     },
              //     child: Text("Create call"))
            ],
          ),
        ),
      )),
    );
  }
}