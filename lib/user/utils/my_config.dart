import 'package:nb_utils/nb_utils.dart';

import '../api_all/Auth/constants.dart';

String getAppUrl() {
  return "http://${getStringAsync(address)}:8080";
}
