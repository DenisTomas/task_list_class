import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tasks'),
        ),
        body: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: ListView(
            children: const [
              Task(
                  'Learn Flutter',
                  'https://ih1.redbubble.net/image.1076687066.0716/st,small,507x507-pad,600x600,f8f8f8.jpg',
                  5),
              Task(
                  'Play Bass',
                  'https://www.ikmultimedia.com/products/modobass2/images/2.0.2/new_bass_comp.jpg',
                  5),
              Task(
                  'Clean the House',
                  'https://www.mensjournal.com/wp-content/uploads/2019/09/shutterstock_557357668.jpg?w=900&quality=86&strip=all',
                  3),
              Task(
                  'Cook Lunch',
                  'https://cdn1.vectorstock.com/i/1000x1000/04/50/chef-cooking-dinner-at-table-in-kitchen-vector-32060450.jpg',
                  2),
              Task(
                  'Sleep',
                  'https://domf5oio6qrcr.cloudfront.net/medialibrary/11203/283fb478-5554-44aa-b37f-7917a90f38d7.jpg',
                  4),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = !opacity;
            });
          },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int dificulty;

  const Task(this.name, this.photo, this.dificulty, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int lvl = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white70,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: (widget.dificulty >= 1)
                                  ? Colors.blue[700]
                                  : Colors.blue[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: (widget.dificulty >= 2)
                                  ? Colors.blue[700]
                                  : Colors.blue[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: (widget.dificulty >= 3)
                                  ? Colors.blue[700]
                                  : Colors.blue[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: (widget.dificulty >= 4)
                                  ? Colors.blue[700]
                                  : Colors.blue[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: (widget.dificulty >= 5)
                                  ? Colors.blue[700]
                                  : Colors.blue[300],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              lvl++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up_outlined),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white70,
                        value: (widget.dificulty > 0)
                            ? (lvl / widget.dificulty) / 10
                            : 1,
                      ),
                    ),
                    Text(
                      'Lvl: $lvl',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
