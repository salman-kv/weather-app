import 'package:dart_casing/dart_casing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/getx_controller.dart';
import 'package:weatherapp/model/image_selection_function.dart';

class HomeScreenWidget {
  locationText({required Controller controller}) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        Text(
          '${controller.weather.value!.areaName}',
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }

  greetingText({required DateTime datetime}) {
    return Text(
      datetime.hour >= 0 && datetime.hour < 12
          ? 'Good Morning'
          : datetime.hour >= 12 && datetime.hour < 16
              ? 'Good After Noon'
              : datetime.hour >= 16 && datetime.hour < 20
                  ? 'Good Evening'
                  : 'Good Night',
      style: GoogleFonts.poppins(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 27),
    );
  }

  imageWithDeatails(
      {required BuildContext context, required Controller controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: ImageSelection()
              .imageSelectionFunction(code: controller.weather.value.hashCode),
        ),
        Text(
          '${controller.weather.value!.tempMax!.toString().substring(0, 4)}° C',
          style: const TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          Casing.titleCase(controller.weather.value!.weatherMain!),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  ' ${DateFormat('EEEE dd -').format(controller.weather.value!.date!)} ${DateFormat().add_jm().format(controller.dateTime.value)} ',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )),
          ],
        )
      ],
    );
  }

  rowOfDeatails(
      {required BuildContext context, required Controller controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              singleDeatailesContainer(
                  deatail: DateFormat()
                      .add_jm()
                      .format(controller.weather.value!.sunrise!),
                  image: 'assets/images/11.png',
                  text: 'SunRise'),
              singleDeatailesContainer(
                deatail: DateFormat()
                    .add_jm()
                    .format(controller.weather.value!.sunset!),
                image: 'assets/images/12.png',
                text: 'SunSet',
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              singleDeatailesContainer(
                  deatail: controller.weather.value!.tempMax.toString(),
                  image: 'assets/images/13.png',
                  text: 'Temp Max'),
              singleDeatailesContainer(
                  deatail: controller.weather.value!.tempMin.toString(),
                  image: 'assets/images/14.png',
                  text: 'Temp Min')
            ],
          ),
        ],
      ),
    );
  }

  singleDeatailesContainer(
      {required String image, required String text, required String deatail}) {
    return Row(
      children: [
        SizedBox(
          height: 70,
          child: Image.asset(image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(deatail,
                style: const TextStyle(color: Colors.white, fontSize: 16))
          ],
        )
      ],
    );
  }
}
