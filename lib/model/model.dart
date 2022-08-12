import 'dart:convert';

List<Tunnel> modelUserFromJson(String str) =>
    List<Tunnel>.from(json.decode(str).map((x) => Tunnel.fromJson(x)));

String modelUserToJson(List<Tunnel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tunnel {
  String id;
  String public_url;

  Tunnel({
    required this.id,
    required this.public_url,
  });

  factory Tunnel.fromJson(Map<String, dynamic> json) => Tunnel(
        id: json["id"],
        public_url: json["public_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "public_url": public_url,
      };
}

// class Answers {
//   String? answerA;
//   String? answerB;
//   String? answerC;
//   String? answerD;
//   String? answerE;
//   String? answerF;

//   Answers({
//     required this.answerA,
//     required this.answerB,
//     required this.answerC,
//     required this.answerD,
//     required this.answerE,
//     required this.answerF,
//   });

//   factory Answers.fromJson(Map<String, dynamic> json) => Answers(
//         answerA: json["answer_a"],
//         answerB: json["answer_b"],
//         answerC: json["answer_c"],
//         answerD: json["answer_d"],
//         answerE: json["answer_e"],
//         answerF: json["answer_f"],
//       );

//   Map<String, dynamic> toJson() => {
//         "answer_a": answerA,
//         "answer_b": answerB,
//         "answer_c": answerC,
//         "answer_d": answerD,
//         "answer_e": answerE,
//         "answer_f": answerF,
//       };
// }

// class CorrectAnswers {
//   String answer_a_correct;
//   String answer_b_correct;
//   String answer_c_correct;
//   String answer_d_correct;
//   String answer_e_correct;
//   String answer_f_correct;

//   CorrectAnswers({
//     required this.answer_a_correct,
//     required this.answer_b_correct,
//     required this.answer_c_correct,
//     required this.answer_d_correct,
//     required this.answer_e_correct,
//     required this.answer_f_correct,
//   });

//   factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
//         answer_a_correct: json["answer_a_correct"],
//         answer_b_correct: json["answer_b_correct"],
//         answer_c_correct: json["answer_c_correct"],
//         answer_d_correct: json["answer_d_correct"],
//         answer_e_correct: json["answer_e_correct"],
//         answer_f_correct: json["answer_f_correct"],
//       );

//   Map<String, dynamic> toJson() => {
//         "answer_a_correct": answer_a_correct,
//         "answer_b_correct": answer_b_correct,
//         "answer_c_correct": answer_c_correct,
//         "answer_d_correct": answer_d_correct,
//         "answer_e_correct": answer_e_correct,
//         "answer_f_correct": answer_f_correct,
//       };
// }
