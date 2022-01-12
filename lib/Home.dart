import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    _itens = [];
    for(int  i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
item["titulo"] = "Título ${i} Lorem ipsum dolor sit amet.";
item["descricao"] = "Descrição ${i} Lorem ipsum dolor sit amet. ipsum north thank you baby";
_itens.add(item);

    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (context, indice) {

            //Map<String, dynamic> item = _itens[indice];
            //print("item ${ _itens[indice]["titulo"]}");

            return ListTile(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text(_itens[indice]["titulo"]),
                        titlePadding: EdgeInsets.all(50),
                        content: Text(_itens[indice]["descricao"]),
                        actions: [
                          FlatButton(
                            onPressed: (){
                              print("Selecionado Sim");
                              Navigator.pop(context);
                            },
                            child: Text("Sim"),
                          ),
                          FlatButton(
                            onPressed: (){
                              print("Selecionado Não");
                              Navigator.pop(context);
                            },
                            child: Text("Não"),
                          ),
                        ],
                        backgroundColor: Color (0xFF2295F2),
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Color (0xFF575757),
                        ),
                        //contentPadding: EdgeInsets.all(80),
                      );
                    });
                //print("clique com onTap ${indice}");
              },
              /*onLongPress: (){
                print("clique com onLonPress");
              },*/
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),

            );
        })
      ),
    );
  }
}
