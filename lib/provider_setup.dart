import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'provider/app_provider.dart';


List<SingleChildWidget> providers = independentServices;

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider.value(value: AppProvider()),
];
