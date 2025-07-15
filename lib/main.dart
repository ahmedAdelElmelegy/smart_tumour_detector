import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tumour_detector/core/local_notifcation_servieces/local_notifcation_services.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/core/utils/service_locator.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/view_model/cubit/nav_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tumour_detector/features/appointment/data/repo/appointment_repo.dart';
import 'package:smart_tumour_detector/features/appointment/data/repo/appointment_repo_impl.dart';
import 'package:smart_tumour_detector/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:smart_tumour_detector/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  setupServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await LocalNotifcationServices.init();
  await LocalNotifcationServices.requestNotificationPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppointmentRepo appointmentRepo = AppointmentRepoImpl();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavCubit>(
            create: (context) => NavCubit(appointmentRepo),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              authRepo: getIt.get<AuthRepoImpl>(),
            ),
          ),
          BlocProvider<DoctorsCubit>(
            create: (context) => DoctorsCubit(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.leagueSpartanTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        ),
      ),
    );
  }
}
