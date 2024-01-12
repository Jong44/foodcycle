String capitalize(String nama) {
  List<String> words = nama.split(" ");
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] =
          words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }
  }
  return words.join(" ");
}
