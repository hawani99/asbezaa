// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    if (!mounted) return;

    setState(() {});
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 170.0,
        width: double.infinity,
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/erev/background.png"),
              fit: BoxFit.cover,
            ),
            boxShadow: [new BoxShadow(color: Colors.black, blurRadius: 8.0)],
            color: Colors.green),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, bottom: 18.0, right: 18.0, left: 18.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                new AssetImage("assets/images/erev/admin.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
