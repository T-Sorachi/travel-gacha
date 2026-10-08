import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;

  final emojis = ['🗺️', '🗾', '🗺️', '🌏'];

  final images = [
  "https://images.unsplash.com/photo-1628926867153-b6bad577f000?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1629725593792-727bbe2255b2?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1514162646479-788afb83fdb9?q=80&w=2531&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1622607941338-38e1d2035b5a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1573718893672-86144926f4fb?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1673142424031-a96fffc2366c?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1598970398815-0dd6143f19d2?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1598538533536-0797be12f4d4?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1761052877909-9991be02ad10?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1718611810448-09926c861f88?q=80&w=985&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1654509480655-327cc2b46f86?q=80&w=927&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1469998265221-245c7148df5d?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1688417352506-e9d9770f05a1?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1568667256549-094345857637?q=80&w=1015&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
];

  Future<void> gacha() async {
    setState(() => loading = true);

    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }

    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('✈️旅行に行こう！'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.network(
                    images[n],
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 30),
          const Text('🧭', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}