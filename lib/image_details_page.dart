import 'package:flutter/material.dart';

class ImageDetailsPage extends StatefulWidget {
  @override
  _ImageDetailsPageState createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  List<Widget> emojis = [];
  TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Details"),
      ),
      body: GestureDetector(
        onTapUp: _addEmoji,
        child: InteractiveViewer(
          transformationController: _controller,
          child: Stack(
            children: [
              Hero(
                tag: "image01",
                child: Image.asset('images/image01.jpg'),
              ),
              ...emojis,
            ],
          ),
        ),
      ),
    );
  }

  _addEmoji(TapUpDetails details) {
    var pos = _controller.toScene(details.localPosition);
    var emoji = Positioned(
      top: pos.dy - 10,
      left: pos.dx - 10,
      child: Container(
        width: 20,
        height: 20,
        child: Image.asset('images/emoji.png'),
      ),
    );
    setState(() {
      emojis.add(emoji);
    });
  }
}
