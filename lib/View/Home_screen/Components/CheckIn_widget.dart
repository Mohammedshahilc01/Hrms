import 'package:flutter/material.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

class CheckInWidgetData extends StatelessWidget {
  const CheckInWidgetData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: TextData(
                name: 'Lets go to Work 🖊️',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextData(
                          name: 'Check in',
                          fontSize: 18,
                          color: Colors.white,
                        ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.center,
                child: TextData(
                  name: 'Your hours will be calculated here',
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
