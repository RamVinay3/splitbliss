class Food {
  Food({required this.header, required this.body, this.expanded = false});
  final String header;
  final List<String> body;
  bool expanded;
}
