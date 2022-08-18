import 'package:animal_sound2/second_page.dart';
import 'package:animal_sound2/widget/container.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp( const MaterialApp(
    title: 'Animal Sound',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final player = AudioPlayer();

  void playOrPause(String binatang) async {
     player.stop();
    await player.play(AssetSource('Audio/$binatang.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          // SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(25),
            child: const Text(
              "ANIMAL SOUND",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                ContainerHewan(
                    imageAssets: "images/sapi.jpg",
                    onTap: () => playOrPause('Sapi')),
                ContainerHewan(
                    imageAssets: "images/Kucing Kecil.jpeg",
                    onTap: () => playOrPause('Kucing')),
                ContainerHewan(
                    imageAssets: "images/Ayam Jantan.jpg",
                    onTap: () => playOrPause('Ayam')),
                ContainerHewan(
                    imageAssets: "images/Kambing.jpg",
                    onTap: () => playOrPause('Kambing')),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Text("Tap animal icon to listen",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal[200],
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                )),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade300),
            ),
            onPressed: () {
              player.stop();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SecondPage();
              }));
            },
            child: const Text("Suara Hewan Lainnya"),
          ),
        ],
      ),
    );
  }
}
