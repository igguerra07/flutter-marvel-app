import 'package:flutter/material.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data_impl.dart';
import 'package:marvel_app/src/pages/home/characters_change_notifier.dart';
import 'package:marvel_app/src/pages/home/home_page_state.dart';
import 'package:marvel_app/services/marvel_service.dart';
import 'package:marvel_app/src/repositories/characters_repository.dart';
import 'package:marvel_app/src/repositories/characters_repository_impl.dart';
import 'package:marvel_app/src/usescases/get_characters.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = http.Client();
    
    final marvelService = MarvelService(client: client);

    final charactersRemoteDataSource = CharactersRemoteDataSourceImpl(
      marvelService: marvelService,
    );

    final charactersRepository = CharacteresRepostioryImpl(
      charactersRemoteDataSource: charactersRemoteDataSource,
    );

    final getCharacters = GetCharacters(
      charactersRepository: charactersRepository,
    );

    final charactersNotifier = CharactersChangeNotifier(
      getCharacters: getCharacters,
    );

    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (_) => charactersNotifier..getCharacters(),
        child: Consumer<CharactersChangeNotifier>(
          builder: (BuildContext context, value, Widget? child) {
            final currentState = value.state;
            if (currentState is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (currentState is HomeFailureState) {
              return Center(
                child: Text(currentState.error.toString()),
              );
            }
            if (currentState is HomeSuccessState) {
              final characters = currentState.characters;
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: currentState.characters.length,
                itemBuilder: (_, index) => Text(characters[index].name),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
