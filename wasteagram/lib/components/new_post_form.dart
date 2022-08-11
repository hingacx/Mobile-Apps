import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasteagram/models/wasteagram_entry.dart';

// Form that allows the user to input the amount of waste and create a new post
class NewPostForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final WasteagramEntry wasteagramEntry;

  const NewPostForm(
      {Key? key, required this.formKey, required this.wasteagramEntry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: .7,
              child: Semantics(
                textField: true,
                hint: 'Enter the amount of waste',
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Number of Waste',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    wasteagramEntry.setWastedItems(int.parse(value!));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
