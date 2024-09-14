import 'dart:html';

void main() {
  querySelector('#content')!.innerHtml = '''
    <h1>Quản Lý Bài Hát</h1>
    <input id="title" placeholder="Tiêu đề bài hát">
    <input id="artist" placeholder="Nghệ sĩ">
    <input id="year" placeholder="Năm phát hành">
    <button id="addSong">Thêm Bài Hát</button>
    <ul id="songList"></ul>
  ''';

  final titleInput = querySelector('#title') as InputElement;
  final artistInput = querySelector('#artist') as InputElement;
  final yearInput = querySelector('#year') as InputElement;
  final addButton = querySelector('#addSong') as ButtonElement;
  final songList = querySelector('#songList') as UListElement;

  addButton.onClick.listen((event) {
    final title = titleInput.value;
    final artist = artistInput.value;
    final year = yearInput.value;

    if (title != null && artist != null && year != null) {
      final listItem = LIElement()
        ..text = '$title - $artist ($year)';
      songList.append(listItem);

      titleInput.value = '';
      artistInput.value = '';
      yearInput.value = '';
    }
  });
}
