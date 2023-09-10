import 'package:yes_no_app/domain/entities/message.dart';

class YesNoAnswersModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoAnswersModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoAnswersModel.fromJson(Map<String, dynamic> json) => YesNoAnswersModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'si' : 'no', 
      fromWho: FromWho.hers,
      image: image
    );
}
