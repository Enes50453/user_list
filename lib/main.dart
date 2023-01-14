import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_info/model/model.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Information',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = Uri.parse('https://randomuser.me/api/?results=20');
  int? counter = 0;
  var userResult;
  String searchValue = '20';

  Future callUser() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = userInfoFromJson(response.body);
        if (mounted) {
          setState(() {
            counter = result?.results!.length;
            userResult = result;
          });
        }
        return result;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    callUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        backgroundColor: Color.fromARGB(155, 37, 211, 102),
        elevation: 8.0,
        title: const Text(
          'USER INFORMATIONS',
          style: TextStyle(color: Colors.white),
        ),
        onSearch: (value) {
          setState(() {
            if (value != '') {
              url = Uri.parse('https://randomuser.me/api/?results=$value');
            }
          });
        },
        searchHintText: "Please enter the number of users",
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: counter != null
                ? ListView.builder(
                    itemCount: counter,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(userResult!.results![index]!.name.first
                                .toString() +
                            " " +
                            userResult!.results![index]!.name.last.toString()),
                        subtitle:
                            Text(userResult!.results![index]!.email.toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              userResult!.results![index]!.picture.thumbnail),
                        ),
                        trailing: Icon(
                          getGender(
                              userResult!.results![index]!.gender.toString()),
                        ),
                        iconColor: Color.fromARGB(185, 37, 211, 102),
                      );
                    },
                  )
                : CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 37, 211, 102),
          child: Icon(Icons.refresh),
          onPressed: () {
            callUser();
          }),
    );
  }

  IconData? getGender(String userGender) {
    if (userGender == 'Gender.MALE') {
      return Icons.male;
    } else if (userGender == "Gender.FEMALE") {
      return Icons.female;
    } else {
      return Icons.person_sharp;
    }
  }
}
