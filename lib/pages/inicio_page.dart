
import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Avatar Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 1.0,
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/img/persona1.jpg"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/img/loading.gif"),
            image: AssetImage("assets/img/persona1.jpg"),
            fadeInDuration: Duration(milliseconds: 1000),
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}