import 'package:design_vkr/bloc/color_bloc.dart';
import 'package:design_vkr/screens/button_screen.dart';
import 'package:design_vkr/screens/radio_screen.dart';
import 'package:design_vkr/screens/text_field_screen.dart';
import 'package:design_vkr/utils/constants.dart';
import 'package:design_vkr/widgets/design_widgets/flat_button.dart';
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
            _buildNavigationButton(
              context,
              label: "На экран с кнопками",
              page: const ButtonScreen(),
            ),
            const SizedBox(
              height: verticalPadding,
            ),
            _buildNavigationButton(
              context,
              label: "На экран с радио",
              page: const RadioScreen(),
            ),
            const SizedBox(
              height: verticalPadding,
            ),
            _buildNavigationButton(
              context,
              label: "На экран с текстовыми полями",
              page: const TextFieldScreen(),
            ),
          ],
        ),
      ),
    );
  }

  CustomFlatButton _buildNavigationButton(
    BuildContext context, {
    required String label,
    required Widget page,
  }) {
    return CustomFlatButton(
      backgroundColor: primaryColor3,
      label: label,
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (__) => ColorBloc(),
            child: page,
          ),
        ),
      ),
    );
  }
}
