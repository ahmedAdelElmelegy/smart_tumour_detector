import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/features/Lab%20Result/presentation/views/lab_result.dart';
import 'package:smart_tumour_detector/features/Medical%20File%20Upload/presentation/views/medical_file_upload.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/views/navbar.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/addreview.dart';
import 'package:smart_tumour_detector/features/appointment/presentation/view/widgets/cancel_reason.dart';
import 'package:smart_tumour_detector/features/auth/presentation/views/reset_password_view.dart';
import 'package:smart_tumour_detector/features/auth/presentation/views/login_view.dart';
import 'package:smart_tumour_detector/features/auth/presentation/views/forget_password_view.dart';
import 'package:smart_tumour_detector/features/auth/presentation/views/sign_up_view.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/favorite.dart';
import 'package:smart_tumour_detector/features/profile/presentation/views/edit_profil.dart';
import 'package:smart_tumour_detector/features/profile/presentation/views/help_screen.dart';
import 'package:smart_tumour_detector/features/profile/presentation/views/nottification_settings_screen.dart';
import 'package:smart_tumour_detector/features/profile/presentation/views/settings_screen.dart';
import 'package:smart_tumour_detector/features/splash/presentation/views/splash_view.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/doctorprofilebody.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/schudel_and_patirntdetails.dart';
import 'package:smart_tumour_detector/features/doctorProfile/presentation/views/widgets/yourAppointmentDetails.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/view_model/doctors_cubit/doctors_cubit.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/doctors_view.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/doctor_info.dart';
import 'package:smart_tumour_detector/features/doctors/presentation/views/widgets/rating.dart';
import 'package:smart_tumour_detector/core/model/doctor_model.dart';
import 'package:smart_tumour_detector/features/splash/presentation/views/splash.dart';

abstract class AppRoutes {
  static const kSplash = "/";
  static const kLogin = "/Login";
  static const kForgetPassword = "/ForgetPassword";
  static const kSignUp = "/SignUp";
  static const kReSetPassword = "/ReSetPassword";
  static const kDoctorList = "/DoctorList";
  static const kNavbar = "/NavBar";
  static const kDoctorInfo = '/DoctorInfo';
  static const kMedicalFileUpload = '/MedicalFileUpload';
  static const kLabResult = '/LabResult';
  static const kDoctorRating = '/DoctorRating';
  static const kCancelReason = '/CancelReason';
  static const kaddreviewpage = '/kaddreviewpage';
  static const kprofilepage = '/kprofilepage';
  static const kschudelandpatiendetails = '/SchudelAndPAtienDetails';
  static const kYourAppointmentDetails = '/YourAppointmentDetails';
  static const kFavorite = '/Favorite';

  static const kHelp = '/kHelp';
  static const kNotificationSettings = '/kNotificationSettings';
  static const kSettings = '/kSettings';
  static const kEditProfile = '/kEditProfile';

  static const kAddreview = '/Addreview';

  static final router = GoRouter(
    initialLocation: AppRoutes.kNavbar,
    routes: [
      GoRoute(
        path: kDoctorList,
        builder: (context, state) {
          return const DoctorList();
        },
      ),
      GoRoute(
        path: '/NavBar',
        builder: (context, state) => BlocProvider<DoctorsCubit>(
          create: (context) => DoctorsCubit(),
          child: const Navbar(),
        ),
      ),
      GoRoute(
        path: kDoctorInfo,
        builder: (context, state) {
          final DoctorModel doctorModel = state.extra as DoctorModel;
          return DoctorInfo(
            doctorModel: doctorModel,
          );
        },
      ),
      GoRoute(
        path: kMedicalFileUpload,
        builder: (context, state) => const MedicalFileUpload(),
      ),
      GoRoute(
        path: kLabResult,
        builder: (context, state) {
          final String result = state.extra as String;
          return LabResult(result: result);
        },
      ),
      GoRoute(
        path: kDoctorRating,
        builder: (context, state) {
          return const Rating();
        },
      ),
      GoRoute(
        path: kCancelReason,
        builder: (context, state) => const CancelReason(),
      ),
      GoRoute(
        path: kprofilepage,
        builder: (context, state) {
          final DoctorModel doctorModel = state.extra as DoctorModel;
          return DoctorProfileBody(
            doctorModel: doctorModel,
          );
        },
      ),
      GoRoute(
        path: kschudelandpatiendetails,
        builder: (context, state) {
          final DoctorModel doctorModel = state.extra as DoctorModel;
          return SchudelAndPAtienDetails(
            doctorModel: doctorModel,
          );
        },
      ),
      GoRoute(
        path: kYourAppointmentDetails,
        builder: (context, state) => const Yourappointmentdetails(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kSplash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kReSetPassword,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kSplash,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: kEditProfile,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: kSettings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: kNotificationSettings,
        builder: (context, state) => const NotificationSettingsScreen(),
      ),
      GoRoute(
        path: kHelp,
        builder: (context, state) => const HelpScreen(),
      ),
      GoRoute(
        path: kFavorite,
        builder: (context, state) => const Favorite(
          showAppBar: true,
        ),
      ),
      GoRoute(
          path: kAddreview,
          builder: (context, state) {
            final DoctorModel doctorModel = state.extra as DoctorModel;
            return Addreview(
              doctorModel: doctorModel,
            );
          }),
    ],
  );
}
