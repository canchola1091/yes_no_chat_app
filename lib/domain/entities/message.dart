
enum FromWho {
  me, hers
}

class Message {

  final String text;
  final String? imageuRL;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageuRL,
    required this.fromWho
  });

}
