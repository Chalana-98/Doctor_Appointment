import 'package:dc_appoinment/components/button.dart';
import 'package:dc_appoinment/components/custom_appbar.dart';
import 'package:dc_appoinment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  //for favarite button
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          //Favarite Button
          IconButton(
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: FaIcon(
                isFav ? Icons.favorite_outlined : Icons.favorite_border_sharp,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const AboutDoctor(),
          //Details about doctor
          const DetailBody(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Button(
                width: double.infinity,
                title: 'Book Appoinment',
                onPressed: () {
                  //navigate to booking page
                  Navigator.of(context).pushNamed('booking_page');
                },
                disable: false),
          )
        ],
      )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/doctor_2.jpg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Dr Richard Tan',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'MBBS (International Medical University UK), MSC in Royal Medical College UK',
              style: TextStyle(color: Colors.grey, fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'IDH General Hospital',
              style: TextStyle(color: Colors.black, fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(children: [
        Config.spaceSmall,
        //doctor exp, patient and rating
        const DoctorInfo(),
        Config.spaceMedium,
        const Text(
          'About Doctors',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        //Config.spaceSmall,
        // const Text(
        //   'Dr. Richerd Tan is a experience Doctor',
        //   style: TextStyle(fontWeight: FontWeight.w500, height: 1.5),
        //   softWrap: true,
        //   textAlign: TextAlign.justify,
        // ),
      ]),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        InfoCard(
          label: 'Patients',
          value: '109',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experiences',
          value: '10 Years',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Config.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ));
  }
}
