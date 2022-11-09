import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(
        
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Currency calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

    final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);

}

final textOrgien = TextEditingController();
final textDestino = TextEditingController();

String op1 = "USD";
String op2 = "COP";

List<DropdownMenuItem<String>> Listamoneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];


List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.amber, Icon(Icons.abc)),
  calculadora("8", Colors.amber, Icon(Icons.abc)),
  calculadora("7", Colors.amber, Icon(Icons.abc)),
  calculadora("6", Colors.amber, Icon(Icons.abc)),
  calculadora("5", Colors.amber, Icon(Icons.abc)),
  calculadora("4", Colors.amber, Icon(Icons.abc)),
  calculadora("3", Colors.amber, Icon(Icons.abc)),
  calculadora("2", Colors.amber, Icon(Icons.abc)),
  calculadora("1", Colors.amber, Icon(Icons.abc)),
  calculadora("Limpiar", Color.fromARGB(255, 115, 156, 195), Icon(Icons.cleaning_services)),
  calculadora("0", Colors.amber, Icon(Icons.abc)),
  calculadora("=", Color.fromARGB(255, 158, 157, 152), Icon(Icons.abc)),


];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Text("Moneda Origen: "),
                DropdownButton(
                  value: op1,
                  items: Listamoneda,
                  onChanged: (String? x){
                    setState((){
                      op1 = x.toString();
                    } );
                  }),
                Text("    Moneda Destino: "),
                DropdownButton(
                  value: op2,
                  items: Listamoneda,
                  onChanged: (String? x){
                    setState((){
                      op2 = x.toString();
                    } );
                  }),
              ],
            ),
            TextField(
              controller: textOrgien,
              decoration: InputDecoration(
              labelText: "Origen",
              hintText: "0",
              icon: Icon(Icons.monetization_on)
            )),
            TextField(
              controller: textDestino,
              decoration: InputDecoration(
                labelText: "Destino",
                hintText: "0",
                icon: Icon(Icons.monetization_on)
              )),
            Expanded(
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 3
                ),
              itemCount: cal.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(179, 207, 200, 200), width: 1),
                    borderRadius: BorderRadius.circular(200),
                  ), 
                  elevation: 15,
                  color: cal[index].color,
                  child: ListTile(
                    title: Center(
                      child: index == 9
                      ? cal[index].icono
                      : Text(
                          cal[index].titulo,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40
                          ),
                        ),
                      ),

                      onTap: () {
                        if (index < 9 || index == 10) {
                          textOrgien.text = textOrgien.text + cal[index].titulo;
                        } else if (index == 9){
                          //textOrigen.clear(); //opcion 1
                          textOrgien.text = "";
                          textDestino.text = "";
                        } else {
                          if (op1 == "USD" && op2 == "COP"){
                            textDestino.text = (double.parse(textOrgien.text)*5100).toString();
                          } else if (op1 == "USD" && op2 == "EUR"){
                            textDestino.text = (double.parse(textOrgien.text)*1).toString();
                          } else if (op1 == "EUR" && op2 == "USD"){
                            textDestino.text = (double.parse(textOrgien.text)*1).toString();
                          } else if (op1 == "EUR" && op2 == "COP"){
                            textDestino.text = (double.parse(textOrgien.text)*5100).toString();
                          } else if (op1 == "COP" && op2 == "USD"){
                            textDestino.text = (double.parse(textOrgien.text)*0.0002).toString();
                          } else if (op1 == "COP" && op2 == "EUR"){
                            textDestino.text = (double.parse(textOrgien.text)*0.0002).toString();
                          } else {textDestino.text=textOrgien.text;
                          }
                        }             
                        print(cal[index].titulo);
                      },

                    )
                  );
                }
              ),
            ),
          ],
        ), 
      ), 
    );
  }
}
