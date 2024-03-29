import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
    ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _Jk = ""; // _ berarti private
  List<String> agama=["Islam","Kristen","Hindu","Budha"];

  String _agama = "Islam";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJk(String value){
    setState(() {
     _Jk=value; 
    });
  }

  void pilihAgama(String value){
    setState(() {
     _agama=value; 
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200,
        child: new Column(
          children: <Widget>[
            new Text(
              "Nama LEngkap : ${controllerNama.text}"
            ),
            new Text(
              "Password : ${controllerPass.text}"
            ),
            new Text(
              "Moto Hidup : ${controllerMoto.text}"
            ),
            new Text(
              "Jenis Kelamin : $_Jk"
            ),
            new Text(
              "Agama: $agama"
            ),
          ],
        ),
      )
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Form"),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20),),
                new TextField(
                  controller: controllerPass,
                  obscureText: true, //agar text **
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20),),
                new TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    hintText: "Moto Hidup",
                    labelText: "Moto Hidup",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20),),
                new RadioListTile(
                  value: "Laki-Laki",
                  title: new Text("Laki laki"),
                  groupValue: _Jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Pilih jika anda laki"),
                ),
                new RadioListTile(
                  value: "PErempuan",
                  title: new Text("Perempuan"),
                  groupValue: _Jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Pilih jika anda cewek"),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20),),
                new Row(
                  children: <Widget>[
                    new Text("Agama",style: new TextStyle(fontSize: 18,color: Colors.black),),
                    new Padding(padding: new EdgeInsets.only(right: 10)),
                    new DropdownButton(
                      onChanged: (String value){
                        pilihAgama(value);
                      },
                      value: _agama,
                      items: agama.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                new RaisedButton(
                  child: new Text("Ok"),
                  color: Colors.blue,
                  onPressed: (){kirimdata();},
                )
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}