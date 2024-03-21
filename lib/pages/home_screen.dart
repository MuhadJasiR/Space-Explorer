import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_explorer/bloc/chat_bloc.dart';
import 'package:space_explorer/model/chat_message_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  ChatBloc chatBloc = ChatBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> message =
                  (state as ChatSuccessState).message;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/space_explorer.jpg",
                  ),
                )),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Text(
                                "SpaceExplorer",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.image_search_rounded,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: message.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black.withOpacity(0.5)),
                            child: Text(
                              message[index].parts.first.text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      )),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 100,
                        child: Center(
                            child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          controller: textEditingController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    if (textEditingController.text.isNotEmpty) {
                                      String text = textEditingController.text;
                                      textEditingController.clear();
                                      chatBloc.add(
                                          ChatGenerateNewTextMessageEvent(
                                              inputMessage: text));
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.send_outlined,
                                    color: Colors.white,
                                  )),
                              hintText: "Enter a prompt here",
                              hintStyle: TextStyle(
                                  color: Colors.grey[300],
                                  fontWeight: FontWeight.w300),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30)),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 35, 15, 69)),
                        )),
                      )
                    ],
                  ),
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
