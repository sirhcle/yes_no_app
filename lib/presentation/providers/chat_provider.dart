import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_anserws.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswers getYesNoAnswers = GetYesNoAnswers();

  List<Message> messageList = [
    Message(text: 'Hola bb', fromWho: FromWho.me),
    Message(text: 'Ya regresaste?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await getHerReply();
    }
    moveScrollTo();
    notifyListeners();
  }

  Future<void> getHerReply() async {
    final herMessage = await getYesNoAnswers.getAnswers();
    messageList.add(herMessage);
    moveScrollTo();
  }

  Future<void> moveScrollTo() async {
    await Future.delayed(Duration(milliseconds: 300));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
