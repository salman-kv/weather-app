import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/getx_controller.dart';
import 'package:weatherapp/view/widgets/container_widget.dart';
import 'package:weatherapp/view/widgets/home_screen_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<Controller>(
        builder: (controller) {
          log('Building aan ------------------------------------');
          return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  ContainerWidget().backgroundContainer(),
                  ContainerWidget().backdropFilter(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeScreenWidget().locationText(controller: controller),
                        const SizedBox(
                          height: 5,
                        ),
                        HomeScreenWidget().greetingText(datetime: controller.dateTime.value),
                        HomeScreenWidget().imageWithDeatails(
                            context: context, controller: controller),
                        HomeScreenWidget().rowOfDeatails(context: context,controller: controller)
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
