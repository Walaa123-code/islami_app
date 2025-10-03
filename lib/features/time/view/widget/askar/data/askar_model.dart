// class AzkarModel {
//   List<Zikr>? morning;
//   List<Zikr>? evening;
//   List<Zikr>? afterPrayer;
//   List<Zikr>? tasbeeh;
//   List<Zikr>? sleep;
//   List<Zikr>? wakeUp;
//   List<Zikr>? quranDuas;
//   List<Zikr>? prophetsDuas;
//
//   AzkarModel({
//     this.morning,
//     this.evening,
//     this.afterPrayer,
//     this.tasbeeh,
//     this.sleep,
//     this.wakeUp,
//     this.quranDuas,
//     this.prophetsDuas,
//   });
//
//   factory AzkarModel.fromJson(Map<String, dynamic> json) {
//     return AzkarModel(
//       morning: _parseZikrList(json['أذكار الصباح']),
//       evening: _parseZikrList(json['أذكار المساء']),
//       afterPrayer: _parseZikrList(json['أذكار بعد السلام من الصلاة المفروضة']),
//       tasbeeh: _parseZikrList(json['تسابيح']),
//       sleep: _parseZikrList(json['أذكار النوم']),
//       wakeUp: _parseZikrList(json['أذكار الاستيقاظ']),
//       quranDuas: _parseZikrList(json['أدعية قرآنية']),
//       prophetsDuas: _parseZikrList(json['أدعية الأنبياء']),
//     );
//   }
//
//   static List<Zikr>? _parseZikrList(dynamic data) {
//     if (data == null) return null;
//
//     if (data is List && data.isNotEmpty && data.first is List) {
//       data = data.first;
//     }
//
//     return (data as List).map((e) => Zikr.fromJson(e)).toList();
//   }
// }
//
// class Zikr {
//   String? category;
//   String? count;
//   String? description;
//   String? reference;
//   String? content;
//
//   Zikr({
//     this.category,
//     this.count,
//     this.description,
//     this.reference,
//     this.content,
//   });
//
//   factory Zikr.fromJson(Map<String, dynamic> json) {
//     return Zikr(
//       category: json['category'],
//       count: json['count'],
//       description: json['description'],
//       reference: json['reference'],
//       content: json['content'],
//     );
//   }
// }

class AzkarModel {
  List<Zikr>? morning;
  List<Zikr>? evening;
  List<Zikr>? afterPrayer;
  List<Zikr>? tasbeeh;
  List<Zikr>? sleep;
  List<Zikr>? wakeUp;
  List<Zikr>? quranDuas;
  List<Zikr>? prophetsDuas;

  AzkarModel({
    this.morning,
    this.evening,
    this.afterPrayer,
    this.tasbeeh,
    this.sleep,
    this.wakeUp,
    this.quranDuas,
    this.prophetsDuas,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      morning: _parseZikrList(json['أذكار الصباح']),
      evening: _parseZikrList(json['أذكار المساء']),
      afterPrayer: _parseZikrList(json['أذكار بعد السلام من الصلاة المفروضة']),
      tasbeeh: _parseZikrList(json['تسابيح']),
      sleep: _parseZikrList(json['أذكار النوم']),
      wakeUp: _parseZikrList(json['أذكار الاستيقاظ']),
      quranDuas: _parseZikrList(json['أدعية قرآنية']),
      prophetsDuas: _parseZikrList(json['أدعية الأنبياء']),
    );
  }

  static List<Zikr>? _parseZikrList(dynamic data) {
    if (data == null) return null;

    List<dynamic> flatList = [];

    if (data is List) {
      for (var item in data) {
        if (item is List) {
          flatList.addAll(item); // دمج القوائم الداخلية
        } else {
          flatList.add(item);
        }
      }
    }

    return flatList.map((e) => Zikr.fromJson(e)).toList();
  }
}

class Zikr {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  Zikr({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory Zikr.fromJson(Map<String, dynamic> json) {
    return Zikr(
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }
}
