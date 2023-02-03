import 'package:flutter/material.dart';
import 'infoLists.dart';

class InfoCards extends StatefulWidget {
  final String name;
  final String image;
  final Color colors;
  final Text text;

  InfoCards({
    Key key,
    this.name,
    this.image,
    this.colors,
    this.text,
  }) : super(key: key);

  final Lists l = new Lists();

  InfoCards get infoc2 => new InfoCards(
        name: "Coffee",
        image: "assets/images/kahve.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.coffee[0] +
            "\n" +
            "\n" +
            l.coffee[1] +
            "\n" +
            "\n" +
            l.coffee[2] +
            "\n"
                "\n" +
            l.coffee[3]),
      );
  InfoCards get infoc3 => new InfoCards(
        name: "Oat",
        image: "assets/images/yulaf.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.oat[0] + "\n" + "\n" + l.oat[1] + "\n" + "\n" + l.oat[2]),
      );
  InfoCards get infoc4 => new InfoCards(
        name: "Nuts",
        image: "assets/images/kuruYemiş.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.nuts[0] + "\n" + "\n" + l.nuts[1] + "\n" + "\n" + l.nuts[2]),
      );
  InfoCards get infoc5 => new InfoCards(
        name: "Pineapple",
        image: "assets/images/ananas.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.pineapple[0] +
            "\n" +
            "\n" +
            l.pineapple[1] +
            "\n" +
            "\n" +
            l.pineapple[2] +
            "\n" +
            "\n" +
            l.pineapple[3]),
      );
  InfoCards get infoc6 => new InfoCards(
        name: "Banana",
        image: "assets/images/muz.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.banana[0] + "\n" + "\n" + l.banana[1] + "\n" + "\n" + l.banana[2]),
      );
  InfoCards get infoc7 => new InfoCards(
        name: "Fish",
        image: "assets/images/fish.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.fish[0] + "\n" + "\n" + l.fish[1] + "\n" + "\n" + l.fish[2]),
      );
  InfoCards get infoc8 => new InfoCards(
        name: "Egg",
        image: "assets/images/yumurta.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.egg[0] + "\n" + "\n" + l.egg[1] + "\n" + "\n" + l.egg[2]),
      );
  InfoCards get infoc9 => new InfoCards(
        name: "Meat",
        image: "assets/images/et.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.meat[0] + "\n" + "\n" + l.meat[1] + "\n" + "\n" + l.meat[2]),
      );
  InfoCards get infoc10 => new InfoCards(
        name: "Greens",
        image: "assets/images/yeşil.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.green[0] + "\n" + "\n" + l.green[1] + "\n" + "\n" + l.green[2]),
      );
  InfoCards get infoc11 => new InfoCards(
        name: "Milk Products",
        image: "assets/images/süt.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.milkP[0] + "\n" + "\n" + l.milkP[1] + "\n" + "\n" + l.milkP[2]),
      );
  InfoCards get infoc12 => new InfoCards(
        name: "Whole Wheat ",
        image: "assets/images/tamT.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.ww[0] + "\n" + "\n" + l.ww[1] + "\n" + "\n" + l.ww[2]),
      );
  InfoCards get infoc13 => new InfoCards(
        name: "Legumes",
        image: "assets/images/bakliyat.jpg",
        colors: Colors.blueGrey[300],
        text: Text(l.legume[0] + "\n" + "\n" + l.legume[1] + "\n" + "\n" + l.legume[2]),
      );

  @override
  _InfoCardsState createState() => _InfoCardsState();
}

class _InfoCardsState extends State<InfoCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(offset: Offset(0, 17), blurRadius: 17, spreadRadius: -23, color: Colors.black)],
        color: widget.colors,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          //tıklama özelliğini vermek için
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Do you know these ?"),
                    content: widget.text,
                    actions: [
                      FlatButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
          child: Column(
            children: [
              Image.asset(widget.image),
              Spacer(),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      padding: EdgeInsets.all(10),
    );
  }
}
