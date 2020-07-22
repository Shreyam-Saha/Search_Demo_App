import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoSearch(),
    );
  }
}

class DemoSearch extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
          )
        ],

      ),


    );
  }
}

class SearchData extends SearchDelegate<String> {
  String showname;
  final names = [
    "Liam",
    "Emma",
    "Noah",
    "Olivia",
    "William",
    "Ava",
    "James",
    "Isabella",
    "Oliver",
    "Sophia",
    "Benjamin",
    "Charlotte",
    "Elijah",
    "Mia",
    "Lucas",
    "Amelia",
    "Mason",
    "Harper",
    "Logan",
    "Evelyn",
    "Alexander",
    "Abigail",
    "Ethan",
    "Emily",
    "Jacob",
    "Elizabeth",
    "Micheal",
    "Mila",
    "Daniel",
    "Ella",
    "Henry",
    "Avery",
    "Jackson",
    "Sofia",
    "Sebastian",
    "Camila",
    "Aiden",
    "Aria",
    "Matthew",
    "Scarlett",
    "Samuel",
    "Victoria",
    "David",
    "Madison",
    "Joseph Luna",
    "Carter",
    "Grace",
    "Owen",
    "Chloe",
    "Wyatt",
    "Penelope",
    "John",
    "Layla",
    "Jack",
    "Riley",
    "Luke",
    "Zoey",
    "Jayden",
    "Nora",
    "Dylan",
    "Lily",
    "Grayson",
    "Eleanor",
    "Levi",
    "Hannah",
    "Isaac",
    "Lillian",
    "Gabriel",
    "Addison",
    "Julian",
    "Aubrey",
    "Mateo",
    "Ellie",
    "Anthony",
    "Stella",
    "Jaxon",
    "Natalie",
    "Lincoln",
    "Zoe",
    "Joshua",
    "Leah",
    "Christopher",
    "Hazel",
    "Andrew",
    "Violet",
    "Theodore",
    "Aurora",
    "Caleb",
    "Savannah",
    "Ryan",
    "Audrey",
    "Asher",
    "Brooklyn",
    "Nathan",
    "Bella",
    "Thomas",
    "Claire",
    "Leo",
    "Skylar"
  ];

  final recentNames = [
    "Zoe",
    "Joshua",
    "Leah",
    "Christopher",
  ];



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Center(
      child: Text("You have Selected $showname",style: TextStyle(
        fontSize: 20,fontWeight: FontWeight.w500,
      ),),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty
        ? recentNames
        : names.where((p) => p.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(

      itemBuilder: (context, index) => ListTile(
       onTap: (){
         print("Being Tapped");
         showname =suggestionList[index];
         showResults(context);
       },
        title:Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }
}
