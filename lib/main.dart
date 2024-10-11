import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Lecture2',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Lecture2'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: ColorContainer(color: Colors.grey),
      floatingActionButton: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
    ),
  ));
}

class ColorContainer extends StatefulWidget {
  const ColorContainer({super.key, required this.color});

  final Color color;

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  late Color color;
  double textsize = 30;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color = Colors.amber;
        });
      },
      child: Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/sk.jpg', height: 200),
            Text(
              'Lecture2',
              style: TextStyle(fontSize: textsize),
            ),
             Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      textsize += 5;
                    });
                  },
                  child: Text('UP'),
                ),
                SizedBox(width: 20), 
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      textsize -= 5;
                    });
                  },
                  child: Text('DOWN'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
