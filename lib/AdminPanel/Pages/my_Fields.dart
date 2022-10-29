import 'package:flutter/material.dart';

class MyFields extends StatelessWidget{
  const MyFields({Key? key}):super(key: key);
  Future<void>showInformationDialog(BuildContext context) async{
    return await showDialog(
    context: context,
    builder: (context){
      final TextEditingController _textEditingController1 =TextEditingController();
       final TextEditingController _textEditingController2 =TextEditingController();
        final TextEditingController _textEditingController3 =TextEditingController();
         final TextEditingController _textEditingController4 =TextEditingController();
      return AlertDialog(
        content: Form(
          
          child:Column(children: [
          
          Text("Add New Field!",style: TextStyle(fontSize: 30,color: Color(0xFF363f93)),),
          SizedBox(height: 10,),
          TextFormField(controller: _textEditingController1,
          validator:(value){ return value!.isNotEmpty?null :"Invalid Field";
          },
          decoration: InputDecoration(hintText: "Enter Field Number"),
          ),
          SizedBox(height:10,),
          TextFormField(controller: _textEditingController2,
          validator:(value){ return value!.isNotEmpty?null :"Invalid Field";
          },
          decoration: InputDecoration(hintText: "Enter Field Place"),
          ),
             SizedBox(height:10,),
          TextFormField(controller: _textEditingController3,
          validator:(value){ return value!.isNotEmpty?null :"Invalid Field";
          },
          decoration: InputDecoration(hintText: "Enter Field Sport"),
          ),
             SizedBox(height:10,),
          TextFormField(controller: _textEditingController4,
          validator:(value){ return value!.isNotEmpty?null :"Invalid Field";
          },
          decoration: InputDecoration(hintText: "Enter Field Price/hr"),
          ),
        ],),
        
        ),
        actions:<Widget>[
          TextButton(child: Text('Add',style: TextStyle(color: Colors.deepPurpleAccent)),
          
          onPressed: (){
            Navigator.of(context).pop();
          },
          )
        ]
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fields'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Center(

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showInformationDialog(context);
        },
        child:Text('Add\nField'),
        backgroundColor: Colors.red,
        ),
    );
  }
}