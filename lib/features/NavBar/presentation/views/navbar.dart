import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_tumour_detector/core/services/stripe_key.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/view_model/cubit/nav_cubit.dart';
import 'package:smart_tumour_detector/features/NavBar/presentation/views/widgets/bottom_navbar_view.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    Stripe.publishableKey = StripeKey.puplishibleKey;
    return Scaffold(
      bottomNavigationBar: const BottomNavBarView(),
      body: BlocBuilder<NavCubit, NavState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavCubit>(context);

          return cubit.extraPage != null
              ? cubit.extraPage!
              : IndexedStack(
                  index: cubit.initialPage,
                  children: cubit.pages,
                );
        },
      ),
    );
  }
}
