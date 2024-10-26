import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiDemo extends StatefulWidget {
  const ConfettiDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConfettiDemoState createState() => _ConfettiDemoState();
}

class _ConfettiDemoState extends State<ConfettiDemo> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 5));
  }

  void _playConfetti() {
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confetti Animation')),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _playConfetti,
              child: const Text(
                'Celebrate!',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          ConfettiWidget(
            blastDirection: 121, // 90 degrees
            emissionFrequency: 0.08,
            numberOfParticles: 30,
            gravity: 0.1,
            colors: const [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.yellow,
              Colors.orange,
              Colors.pink,
            ],
            confettiController: _controller,
          ),
        ],
      ),
    );
  }
}
