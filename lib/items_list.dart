import 'package:flutter/material.dart';

class SpacedItemsList extends StatelessWidget {
  const SpacedItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = [
      {
        "userId": 1,
        "id": 1,
        "title": "Este es el objeto 1",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      },
      {
        "userId": 1,
        "id": 2,
        "title": "Este es el objeto 2",
        "body":
            "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
      },
      {
        "userId": 1,
        "id": 3,
        "title": "Este es el objeto 3",
        "body":
            "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                dataList.length,
                (index) => ItemWidget(tarea: Tarea.fromJson(dataList[index])),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Tarea tarea;

  const ItemWidget({Key? key, required this.tarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 119, 31, 31), // Color de fondo de la tarjeta
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(id: tarea.id),
            ),
          );
        },
        child: SizedBox(
          height: 100,
          child: Center(
            child: Text(
              tarea.title,
              style: const TextStyle(
                // Estilo de texto simple
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Tarea:'),
      ),
      body: Center(
        child: Text(
          'El ID de la tarea es: $id',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Tarea {
  final int userId;
  final int id;
  final String title;
  final String body; // Nuevo campo body

  Tarea({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'], // Asignación del nuevo campo body
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
