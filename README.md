# PAB Mini Project 1

Aplikasi To Do List Flutter

## Deskripsi

Project ini merupakan Mini Project mata kuliah **Pemrograman Aplikasi Bergerak** yang dibuat menggunakan **Flutter**.

Aplikasi ini berfungsi sebagai manajemen tugas harian yang memungkinkan pengguna untuk menambahkan, melihat, mengedit, mengarsipkan, dan menghapus tugas dengan tampilan yang sederhana namun profesional.

Aplikasi juga dilengkapi dengan fitur navigasi beberapa halaman seperti **Inbox, Today, Upcoming, Calendar, dan Archive** untuk membantu pengguna mengatur aktivitas mereka dengan lebih terstruktur.

Selain itu pengguna juga dapat melihat tugas berdasarkan tanggal deadline serta melihat tugas langsung melalui tampilan kalender.

Aplikasi ini dibuat berdasarkan materi Flutter yang telah dipelajari selama perkuliahan.

---

# Fitur Aplikasi

### 1. Inbox (Semua Tugas)

- Menampilkan seluruh tugas yang belum diarsipkan
- Menampilkan judul tugas
- Menampilkan deskripsi tugas
- Menampilkan deadline tugas
- Fitur pencarian tugas
- Edit tugas
- Hapus tugas
- Arsipkan tugas

### 2. Tambah Tugas

- Form input tugas
- Memiliki minimal 3 input field
- Judul tugas
- Deskripsi tugas
- Deadline menggunakan kalender
- Navigasi ke halaman berbeda

### 3. Edit Tugas

- Mengubah judul
- Mengubah deskripsi
- Mengubah deadline
- Update data tugas

### 4. Today

- Menampilkan tugas yang deadline nya **hari ini**
- Tugas otomatis muncul berdasarkan tanggal sistem

### 5. Upcoming

- Menampilkan tugas yang deadline nya **setelah hari ini**
- Digunakan untuk melihat rencana kegiatan selanjutnya

### 6. Calendar View

- Menampilkan kalender bulanan
- Tanggal yang memiliki tugas ditandai dengan indikator
- Klik tanggal untuk melihat daftar tugas pada tanggal tersebut

### 7. Archive

- Menyimpan tugas yang telah diarsipkan
- Berguna agar halaman utama tetap rapi

### 8. Multi Page Navigation

Aplikasi memiliki beberapa halaman:

- Inbox
- Today
- Upcoming
- Calendar
- Archive
- Add Task
- Edit Task
- Task Detail

---

# Widget yang Digunakan

Berikut beberapa widget Flutter yang digunakan pada aplikasi ini:

### Layout Widget

- Scaffold
- AppBar
- Column
- Row
- Padding
- Expanded
- Container
- Card
- ListView
- ListView.builder
- SingleChildScrollView

### Input Widget

- TextField
- ElevatedButton
- IconButton
- FloatingActionButton
- Date Picker

### Navigation Widget

- Navigator
- MaterialPageRoute
- BottomNavigationBar

### Display Widget

- Text
- Icon
- Divider
- ListTile

Widget-widget tersebut digunakan untuk membangun tampilan aplikasi yang responsif dan mudah digunakan.

---

# Struktur Folder

```
lib
│
├── data
│   └── task_store.dart
│
├── models
│   └── task.dart
│
├── pages
│   ├── home_page.dart
│   ├── inbox_page.dart
│   ├── today_page.dart
│   ├── upcoming_page.dart
│   ├── calendar_page.dart
│   ├── archive_page.dart
│   ├── add_task_page.dart
│   ├── edit_task_page.dart
│   ├── task_detail_page.dart
│   └── main_navigation.dart
│
├── widgets
│   └── task_card.dart
│
├── theme
│   └── app_theme.dart
│
└── main.dart
```

---

# Teknologi yang Digunakan

- Flutter
- Dart
- Material UI

---

# Cara Menjalankan Project

1. Install Flutter

2. Clone repository

```
git clone https://github.com/Rafanov/PAB-MINPRO1.git
```

3. Masuk ke folder project

```
cd PAB-MINPRO1
```

4. Install dependency

```
flutter pub get
```

5. Jalankan aplikasi

```
flutter run
```

---

# Tujuan Project

Project ini dibuat untuk mempelajari:

- Struktur project Flutter
- Widget dasar Flutter
- Navigasi multi halaman
- Manajemen data pada aplikasi
- Implementasi form input
- Pengelolaan tugas harian menggunakan aplikasi mobile

---

# Author

Raihan Fariz N  
Sistem Informasi  
Universitas Mulawarman

---

# License

MIT License
