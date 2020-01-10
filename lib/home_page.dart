import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'campo_de_texto_costumizado.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dropdownValue = 'Selecionar';

  Widget botaoSelecao() {
     return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Selecionar','One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

  }

  TextField campoTexto(String label) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }


  void voltarPagina(BuildContext context, Widget page) async{
    String s = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));

    print(">> $s");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40.0,
            semanticLabel: "voltar",
          ),
          onPressed: () {
            /*voltar para pagina principal*/
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              CampoDeTextoFormularioCustomizado(
                rotulo: "Usuário",
                required: true,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "nome",
                required: true,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "E-mail",
                tipoDoInput: TextInputType.emailAddress,
                required: true,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Senha",
                required: true,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Confirmar senha",
                required: true,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              CampoDeTextoFormularioCustomizado(
                rotulo: "Telefone",
                tipoDoInput: TextInputType.number,
              ),
              Divider(
                height: 20.0,
                color: Colors.white10,
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text(
                      'Modelo',

                    )

                  ),
                  Expanded(
                    child: botaoSelecao(),
                  ),
                ],
              ),


              Divider(height: 30.0, color: Colors.white10),
              RaisedButton.icon(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                color: Colors.red,
                label: Text(
                  "Confirmar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  /*funcao para confirmar os dados com firebase*/
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}