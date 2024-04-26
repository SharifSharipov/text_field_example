import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_field_example/src/features/generation_text_field/presentation/manager/index_cubit.dart';

class GeneRationTextField extends StatefulWidget {
  const GeneRationTextField({Key? key}) : super(key: key);

  @override
  State<GeneRationTextField> createState() => _GeneRationTextFieldState();
}

class _GeneRationTextFieldState extends State<GeneRationTextField> {
  List<TextEditingController> textControllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Dynamic text field '),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20),
              Text(
                'Counter: $state',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: textControllers.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(textControllers.length);
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: textControllers[index],
                            onChanged: (value) {
                              if (index == textControllers.length - 1 &&
                                  value.isNotEmpty) {
                                setState(() {
                                  textControllers.add(TextEditingController());
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
List<TextEditingController>myController=[
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];