import 'package:edusync_hub/app/routes/route_paths.dart';
import 'package:edusync_hub/core/widgets/buttons/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdditionalDetailsPage extends StatelessWidget {
  const AdditionalDetailsPage({super.key});

  static const route = '/additionalDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the Additional Details Page'),
            //   button to contunue to homepage
            SizedBox(
              height: 20,
            ),
            AppButton(
                text: "Go to home",
                onPressed: () {
                  context.goNamed(AppRoute.home.name);
                },
            width: 200,
            )
          ],
        ),
      ),
    );
  }
}
