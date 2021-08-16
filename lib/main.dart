import 'package:flutter/material.dart';
import 'movie.dart';

void main() {
  runApp(MaterialApp(
    home: Mylistapp(),
  ));
}

class Mylistapp extends StatefulWidget {
  const Mylistapp({Key? key}) : super(key: key);

  @override
  _MylistappState createState() => _MylistappState();
}

List<movie> itm1 = [
  movie(name: 'mtg', director: 'uytre'),
  movie(name: 'reter', director: 'rtyui')
];

class _MylistappState extends State<Mylistapp> {
  Widget card(m) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${m.name}',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(
              '${m.director}',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: ListView.builder(
          itemCount: itm1.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onLongPress: () {
                  itm1.remove(itm1[index]);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Mylistapp()));
                },
                title: Text(itm1[index].name),
                trailing: Icon(Icons.thumb_down_alt),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => adit()));
        },
      ),
    );
  }
}

class adit extends StatefulWidget {
  const adit({Key? key}) : super(key: key);

  @override
  _aditState createState() => _aditState();
}

var g;
var h;

class _aditState extends State<adit> {
  @override
  final nameCon = new TextEditingController();
  final dicCon = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameCon,
            decoration:
                InputDecoration(hintText: "Type here", labelText: "Movie Name"),
          ),
          TextField(
            controller: dicCon,
            decoration: InputDecoration(
                hintText: "Type here", labelText: "ditector Name"),
          ),
          ElevatedButton(
              onPressed: () {
                g = nameCon.text;
                h = dicCon.text;
                itm1.insert(0, movie(name: g, director: h));
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Mylistapp()));
                print(itm1.length);
              },
              child: Text("save")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("hi");
        },
      ),
    );
  }
}
