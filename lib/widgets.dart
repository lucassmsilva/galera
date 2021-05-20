import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key key,
    @required this.img_src,
    @required this.input_search,
  }) : super(key: key);

  final img_src;
  final input_search;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ImageBackground(img_src: img_src),
        Positioned(
          bottom: 30.0,
          child: Container(
              height: 50,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: input_search,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            iconSize: 30,
          ),
        ),
      ],
    );
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    Key key,
    @required this.img_src,
    this.divisor = 3,
  }) : super(key: key);

  final img_src;
  final divisor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / divisor,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        img_src,
        fit: BoxFit.cover,
      ),
    );
  }
}

class WriteSignature extends StatefulWidget {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.blue,
  );

  @override
  _WriteSignatureState createState() => _WriteSignatureState();
}

class _WriteSignatureState extends State<WriteSignature> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.center, children: <Widget>[
          Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Signature(
                controller: widget._controller,
                width: 300,
                height: 300,
                backgroundColor: Colors.transparent,
              )),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                widget._controller.clear();
              },
              icon: Icon(Icons.delete),
              iconSize: 30,
            ),
          ),
        ]),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () async {
              if (widget._controller.isNotEmpty) {
                var data = await widget._controller.toPngBytes();

                Navigator.pop(context, data);
              }
              ;
            },
            child: Text(
              'Confirmar',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
