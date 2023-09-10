import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswers {
  final _dio = Dio();
  Future<Message> getAnswers() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoAnswersModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}
