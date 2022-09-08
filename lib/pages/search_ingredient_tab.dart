import 'package:flutter/material.dart';

class SearchIngredientsTab extends StatefulWidget {
  const SearchIngredientsTab({Key? key}) : super(key: key);

  @override
  State<SearchIngredientsTab> createState() => _SearchIngredientsTabState();
}

class _SearchIngredientsTabState extends State<SearchIngredientsTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Replace this container with your Map widget
        Column(
          children: [
            Container(
              height: 200.0,
              color: Colors.blue,
            ),
          ],
        ),
        Positioned(
          top: 10,
          right: 15,
          left: 15,
          child: Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                IconButton(
                  splashColor: Colors.grey,
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "Search..."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text('RD'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
