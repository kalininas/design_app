import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/screens/button_screen.dart';
import 'package:design_vkr/screens/radio_screen.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFilledButton(
              backgroundColor: primaryColor3,
              label: "На экран с кнопками",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (__) => context.read<ColorBloc>(),
                    child: const ButtonScreen(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: verticalPadding,
            ),
            CustomFilledButton(
              backgroundColor: primaryColor3,
              label: "На экран с радио",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (__) => context.read<ColorBloc>(),
                    child: const RadioScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
