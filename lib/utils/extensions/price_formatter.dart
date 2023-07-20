import 'package:intl/intl.dart';

extension Formatterhelper on double {
  priceFormatter(String langCode) => NumberFormat.currency(
        locale: langCode,
        symbol: '',
      ).format(this);
}
