import 'package:intl/intl.dart';

extension Formatterhelper on double {
  priceFormat(String langCode) => NumberFormat.currency(
        locale: langCode,
        symbol: '',
      ).format(this);
}
