import 'package:firebase_core/firebase_core.dart';
import 'package:food_recipe_app/firebase_options.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @prod
  @preResolve
  Future<FirebaseApp> provideFirebaseApp() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
