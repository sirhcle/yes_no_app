import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textConntroller = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textConntroller.value.text;
            onValue(textValue);
            textConntroller.clear();
          },
        ));

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      controller: textConntroller,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //print('submit value: $value');
        textConntroller.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
