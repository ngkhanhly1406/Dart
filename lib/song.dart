class Song {
  String title;
  String artist;
  int year;

  Song(this.title, this.artist, this.year);

  // Phương thức hiển thị thông tin bài hát
  @override
  String toString() {
    return 'Tiêu đề: $title, Nghệ sĩ: $artist, Năm: $year';
  }
}
