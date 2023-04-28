import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({Key? key}) : super(key: key);

  @override
  State<MyFormValidation> createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return '공백은 허용되지 않습니다.';
              }
            },
          ),
          //RaisedButton() deprecated
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  // valid
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('처리중')));
                }
              },
              child: const Text('완료'),
            ),
          )
        ],
      ),),
    );
  }
}
