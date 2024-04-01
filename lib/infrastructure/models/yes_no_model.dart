import 'package:yes_no_app/domain/entities/message.dart';

class YesNomodel {
  final String answer;
  final bool forced;
  final String image;

  YesNomodel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNomodel.fromJsonMap(Map<String, dynamic> json) => YesNomodel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMssageEntity() => Message(
    text: answer == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.hers,
    imageuRL: image
  );
}
