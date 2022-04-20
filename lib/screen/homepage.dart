import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbkapp/const/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AudioCache _audioCache;

  @override
  void initState() {
    _audioCache = AudioCache(
      prefix: 'assets/sound/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> menu = [
      'Kompetensi Dasar',
      'Materi',
      'Quiz',
      'Video',
      'Live Conference',
    ];
    List<String> to = [
      '/kd',
      '/materi',
      '/quiz',
      '/video',
      '/feedback',
    ];
    List<IconData> icon = [
      FontAwesomeIcons.book,
      FontAwesomeIcons.bookOpen,
      FontAwesomeIcons.question,
      FontAwesomeIcons.video,
      FontAwesomeIcons.comments,
    ];
    return Scaffold(
        backgroundColor: Warna.bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang di Media Pembelajaran TIK',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadedScaleAnimation(
                      fadeDuration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/image/pc.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    for (int i = 0; i < 5; i++)
                      DelayedDisplay(
                          delay: Duration(milliseconds: i * 500),
                          child: CardMenu(
                            menu: menu[i],
                            to: to[i],
                            icon: icon[i],
                            audioCache: _audioCache,
                          )),
                  ],
                )),
          ),
        ));
  }
}

class CardMenu extends StatelessWidget {
  final String menu;
  final String to;
  final IconData icon;
  final AudioCache audioCache;
  const CardMenu(
      {Key? key,
      required this.menu,
      required this.to,
      required this.icon,
      required this.audioCache})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadedScaleAnimation(
      scaleDuration: const Duration(milliseconds: 800),
      fadeCurve: Curves.easeInOut,
      scaleCurve: Curves.easeInOut,
      child: InkWell(
        onTap: () {
          audioCache.play('klik.mp3');
          Get.toNamed(to);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Warna.baseColor),
          child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 45,
                    child: FaIcon(
                      icon,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    menu,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
