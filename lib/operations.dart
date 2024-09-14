import 'dart:io';

import 'package:flutter_application_1/song.dart';

// Tạo danh sách để lưu trữ các bài hát
List<Song> songs = [];

// Thao tác tạo
void createSong(String title, String artist, int year) {
  songs.add(Song(title, artist, year));
  print('Bài hát đã được thêm thành công.');
}

// Thao tác đọc
void readSongs() {
  if (songs.isEmpty) {
    print('Không có bài hát nào.');
  } else {
    for (var song in songs) {
      print(song);
    }
  }
}

// Thao tác cập nhật
void updateSong(int index, String title, String artist, int year) {
  if (index < 0 || index >= songs.length) {
    print('Chỉ mục không hợp lệ.');
    return;
  }
  songs[index] = Song(title, artist, year);
  print('Bài hát đã được cập nhật thành công.');
}

// Thao tác xóa
void deleteSong(int index) {
  if (index < 0 || index >= songs.length) {
    print('Chỉ mục không hợp lệ.');
    return;
  }
  songs.removeAt(index);
  print('Bài hát đã được xóa thành công.');
}

