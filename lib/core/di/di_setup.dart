import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String environment) =>
    getIt.init(environment: environment);
