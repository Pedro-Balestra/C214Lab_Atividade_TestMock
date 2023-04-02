import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:teste_mock/user.dart';

Future<User> fetchUser(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://rickandmortyapi.com/api/character/293'));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load :(');
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste Mock"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
              child: Text(
                "Aplicação que consome parcialmente uma Api sobre Rick And Morty",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FutureBuilder<User>(
              future: futureUser,
              builder: (context, value) {
                if (value.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Gender:   ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            value.data!.gender,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Name:   ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            value.data!.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Status:   ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            value.data!.status,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Speciecs:   ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            value.data!.species,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Gender:   ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            value.data!.gender,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ID:   ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '${value.data!.id}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Não consegui pegar a imagem diretamente pela API
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Image:   ',
                              style: TextStyle(fontSize: 20)),
                          Image.network(
                            "https://rickandmortyapi.com/api/character/avatar/293.jpeg",
                            width: 200, // largura desejada da imagem
                            height: 200, // altura desejada da imagem
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Não consegui pegar a imagem diretamente pela API
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Created:   ',
                              style: TextStyle(fontSize: 20)),
                          Text(
                            value.data!.created,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
