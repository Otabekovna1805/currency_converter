import 'package:freezed_annotation/freezed_annotation.dart';
part 'valyuta.freezed.dart';
part 'valyuta.g.dart';

@freezed
class Valyuta with _$Valyuta {
  const factory Valyuta({
    required int id,
    required String code,
    required String ccy,
    required String ccyNmRU,
    required String ccyNmUZ,
    required String ccyNmUZC,
    required String ccyNmEN,
    required String nominal,
    required String rate,
    required String diff,
    required String date,
}) = _Valyuta;

  factory Valyuta.fromJson(Map<String, Object?> json) => _$ValyutaFromJson(json);
}

final json = {
  "id": 69,
  "Code": "840",
  "Ccy": "USD",
  "CcyNm_RU": "Доллар США",
  "CcyNm_UZ": "AQSH dollari",
  "CcyNm_UZC": "АҚШ доллари",
  "CcyNm_EN": "US Dollar",
  "Nominal": "1",
  "Rate": "11618.15",
  "Diff": "17.98",
  "Date": "01.08.2023"
};
