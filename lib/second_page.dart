import 'package:flutter/material.dart';
import 'package:animal_sound2/widget/container.dart';
import 'package:audioplayers/audioplayers.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

  void playOrPause(String hewan) async {
    player.stop();
    await player.play(AssetSource('Audio/$hewan.mp3'));
  }
    return Scaffold(
       backgroundColor: Colors.teal,
      body: Column(
        children: [
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
                    imageAssets: "images/guguk.jpg",
                    onTap: () => playOrPause('Anjing')),
                ContainerHewan(
                    imageAssets: "images/Kuda.jpeg",
                    onTap: () => playOrPause('Kuda')),
                ContainerHewan(
                    imageAssets: "images/Monkey.jpg",
                    onTap: () => playOrPause('Monyet')),
                ContainerHewan(
                    imageAssets: "images/Bebek.jpg",
                    onTap: () => playOrPause('Bebek')),
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
              Navigator.pop(context);
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              //   return const MyApp();
              // }));
            },
            child: const Text("Kembali"),
          ),
    ]));
  }
}