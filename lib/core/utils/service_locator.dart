import 'package:get_it/get_it.dart';
import 'package:smart_tumour_detector/core/utils/api_service.dart';
import 'package:smart_tumour_detector/features/auth/data/repositories/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService( ));
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
