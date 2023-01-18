import 'package:flutter/material.dart';
import 'package:housoo/data.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(
                height: 5,
              ),
              categories(),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const Text(
                "Nearby",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 5,
              ),
              body(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Location",
          style: TextStyle(color: Colors.grey.shade500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Aplachin, NY",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            Icon(Icons.notifications)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: "Search",
              filled: true,
              enabled: false,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 234, 234, 234))),
              fillColor: const Color.fromARGB(255, 234, 234, 234)),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget categories() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      categoryChildren(
          Image.asset(
            "assets/home.png",
            height: 40,
            width: 40,
          ),
          "House"),
      categoryChildren(
          Image.asset(
            "assets/appartment.png",
            height: 40,
            width: 40,
          ),
          "House"),
      categoryChildren(
          Image.asset(
            "assets/land.png",
            height: 40,
            width: 40,
          ),
          "House"),
      categoryChildren(
          Image.asset(
            "assets/town.png",
            height: 40,
            width: 40,
          ),
          "House"),
    ]);
  }

  Widget categoryChildren(Widget icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300)),
          child: icon,
        ),
        const SizedBox(height: 6),
        Text(text, style: const TextStyle(fontSize: 15))
      ],
    );
  }

  Widget body() {
    var formatter = NumberFormat('#,##,000');
    return SizedBox(
      height: 470,
      child: ListView(
        children: data
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10)),
                    height: 110,
                    child: Stack(
                      children: [
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 1.1,
                              child: Image.asset(
                                e['image'],
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          left: 120,
                          child: Text(
                            e['type'],
                            style: TextStyle(
                                fontSize: 16,
                                color: e['type'] == "House"
                                    ? Colors.red.shade900
                                    : Colors.teal),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          left: 120,
                          child: Text(
                            (e['address'] as Map)['line_1'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ),
                        Positioned(
                            top: 50,
                            left: 120,
                            child: Text(
                              (e['address'] as Map)['line_2'],
                              style: TextStyle(color: Colors.grey.shade500),
                            )),
                        Positioned(
                          left: 120,
                          bottom: 2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.bed,
                                color: Colors.red.shade900,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['no_of_bedrooms'].toString())
                            ],
                          ),
                        ),
                        Positioned(
                          left: 160,
                          bottom: 2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.bathroom_outlined,
                                color: Colors.red.shade900,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['no_of_bedrooms'].toString())
                            ],
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 0,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "\$${formatter.format(e['rent'])}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "/m",
                                    style:
                                        TextStyle(color: Colors.grey.shade500))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
