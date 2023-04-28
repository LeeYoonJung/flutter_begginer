import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({Key? key}) : super(key: key);

  @override
  State<MyFormValidation> createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode nameFocusNode;

  final nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // form 안에 있을 경우 validate 기능 사용할 경우
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
                    if (_formKey.currentState!.validate()) {
                      // valid
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('처리중')));
                    }
                  },
                  child: const Text('완료'),
                ),
              ),
              // form 안에 있을 경우 validate 기능 사용 안할 경우
              TextField(
                controller: nameController,
                onChanged: (text) {
                  print(text);
                },
                focusNode: nameFocusNode,
                decoration: const InputDecoration(
                  hintText: '이름을 입력해주세요.',
                  border: InputBorder.none,
                  labelText: '이름',
                ),
                autofocus: true,
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
                child: const Text('포커스'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(nameController.text);
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: Text(nameController.text),
                    );
                  });
                },
                child: const Text('TextFeild 값 확인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
