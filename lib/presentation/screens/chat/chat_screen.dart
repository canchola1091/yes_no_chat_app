import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrdRqhVzaZ8dtqVFX76Xqa13lM3aMp8O9jEg&usqp=CAU'),
              'https://imgs.search.brave.com/LBJgBhYjsnRColoRO4HL8aj6McWTrr9MSd-O2kwrVn8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMud2lraWEubm9j/b29raWUubmV0L2Rl/a3VuZ2Z1cGFuZGEv/aW1hZ2VzLzUvNWMv/S3VuZy1mdS1wYW5k/YS1Qby0yLWRlc2t0/b3Atd2FsbHBhcGVy/LmpwZy9yZXZpc2lv/bi9sYXRlc3Qvc2Nh/bGUtdG8td2lkdGgt/ZG93bi8zNTI_Y2I9/MjAxMTA5MDYyMDQx/MzcmcGF0aC1wcmVm/aXg9ZGU.jpeg'
            ),
          ),
        ),
        title: const Text('Adivinador'),
        centerTitle: false,
      ),
      body: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messagesList.length,
              itemBuilder: (context, index) {
                final Message message = chatProvider.messagesList[index];

                return (message.fromWho == FromWho.hers)
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message);
              }
            )
          ),
          MessageFieldBox(onValue: chatProvider.sendMessage)
        ]
      )
    ));
  }
}
