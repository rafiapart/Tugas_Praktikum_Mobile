import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  Widget _infoCard(Widget icon, String text) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70),
        side: const BorderSide(color: Colors.black, width: 5),
      ),
      child: ListTile(
        leading: IconTheme(
          data: const IconThemeData(size: 30, color: Colors.blueGrey),
          child: icon,
        ),
        title: Text(
          text,
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/image/images.jpg'),
                radius: 70,
              ),
              const SizedBox(height: 12),
              Text(
                'Patrick Jane',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 35,
                  color: const Color(0xFFF5E6CA),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'KONSULTAN',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: const Color(0xFFF5E6CA),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 300,
                child: Divider(color: Colors.white),
              ),
              _infoCard(const Icon(Icons.call), '+9232 4212 3539'),
              _infoCard(const Icon(Icons.email), 'patrickjane@gmail.com'),
              _infoCard(const Icon(Icons.location_on), 'California, USA'),
              _infoCard(
                const FaIcon(FontAwesomeIcons.instagram),
                '@patrickjane',
              ),
            ],
          ),
        ),
      ),
    );
  }
}