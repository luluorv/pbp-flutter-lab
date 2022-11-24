# Tugas 7

### Stateless widget dan stateful widget
* Stateless widget: widget yang tidak berubah (immutable).
    - Berupa widget yang static
    - Tidak bergantung pada perubahan data atau perilaku
    - Tidak memiliki state
    - Contoh: Icon, IconButton dan Text

* Stateful widget: widget yang berubah saat runtime (mutable).
    - Berupa widget yang dinamis
    - Dapat diupdate saat runtime berdasarkan aksi oleh user atau perubahan data
    - Memiliki internal state dan dapat dirender ulang bila data input atau state widget berubah
    - Contoh: Checkbox, Radio Button dan Slider

### Widget dalam proyek
* `Center()`: align child widget ke tengah layar
* `Column()`: display children dalam array vertikal
* `Text()`: display sebuah string text dengan satu style
* `Stack()`: berisi list widget dan menempatkan mereka di atas satu sama lain
* `Align()`: menetapkan posisi child dan tidak hanya menengahkannya
* `FloatingActionButton()`: icon button yang dapat melakukan suatu aksi dalam aplikasi
* `Icon()`: menunjukkan icon tertentu

### Fungsi `setState()`
Pada pemanggilan `setState()`, framework akan diberikan notifikasi bahwa state internal objek telah berubah, sehingga framework akan menjadwalkan build untuk state dari objek. Variabel yang terdampak adalah variabel yang terdapat dalam fungsi `setState()` tersebut.

### Perbedaan `const` dan `final`
`const`:
* Variabel akan diinisialisasi saat compile-time dan sudah diassign saat runtime
* Hanya dapat didefinisikan dalam function
* Saat state diupdate, build method tidak diinisialisasi lagi
* Tidak bisa diganti saat runtime
* Digunakan bila value tidak akan diganti saat kode dijalankan 

`final`:
* Variabel akan diinisialisasi saat runtime dan hanya diassign sekali
* Variabel `final` dapat didefinisikan dalam class dan function
* Saat state diupdate, build method akan diinisialisasi lagi
* Digunakan bila value tidak diketahui saat compile-time

### Implementasi
* Membuat program flutter baru bernama `counter_7`
* Ubah `title` dalam `MaterialApp()` dan `MyHomePage()` menjadi "Program Counter"
* Membuat function `_incrementCounter()` dan `_decrementCounter()`
* Membuat tampilan text "GANJIL" dan "GENAP" menggunakan if statement, serta counter
* Membuat `Stack()` untuk floatingActionButton dan menambahkan function yang telah dibuat sebagai aksi yang dilakukan bila ditekan pada setiap button 

### Bonus
* Tambahkan if statement `if (_counter > 0)` pada button decrement agar hanya tampil bila counter lebih dari 1


# Tugas 8

### Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
* `Navigator.push`: dapat melakukan pop pada stack navigasi, sehingga masih memungkinkan untuk kembali ke halaman yang diakses sebelumnya
* `Navigator.pushReplacement`: top of stack akan diganti dengan page yang baru diakses, sehingga tidak dapat kembali ke halaman sebelumya

### Widget dalam proyek
* `Drawer`: panel dari tepi `Scaffold` yang berisi link navigasi dalam aplikasi
* `Column`: display children dalam array vertikal
* `Row`: display children dalam array horizontal
* `ListTitle`: Baris yang dapat berisi text dan icon
* `Text`: display sebuah string text dengan satu style
* `MaterialPageRoute`: rute modal yang menggantikan seluruh layar dengan transisi yang platform-adaptive
* `SingleChildScrollView`: box yang memungkinkan scroll satu widget
* `Container`: menggabungkan painting, positioning dan sizing widget
* `Padding`: menambahkan padding pada child
* `TextFormField`: `FormField` yang berisi `TextField`
* `ElevatedButton`: labeled child yang didisplay pada `Material` widget yang `Material.elevation`nya bertambah saat button ditekan 
* `TextStyle`: style yang mendeskripsikan format dan paint teks

### Jenis-jenis event dalam Flutter
* `onPressed`: dipanggil saat button ditekan
* `onLongPress`: dipanggil saat button ditekan lama
* `onHover`: dipanggil saat pointer masuk dan keluar area respon button
* `onFocusChange`: handler dipanggil saat fokus berubah
* `onChanged`: dipanggil saat terjadi perubahan pada value dalam `TextField`
* `onSaved`: dipanggil saat form disimpan

### Cara kerja `Navigator` dalam "mengganti" halaman
Saat menganti halaman, method `Navigator.push()` akan dipanggil. Method tersebut akan menambahkan sebuah rute ke dalam stack rute yang dimanage oleh `Navigator`. Bila ingin kembali ke halaman sebelumnya, maka method `Navigator.pop()` akan dipanggil yang akan melakukan pop pada stack.

### Implementasi
* Membuat drawer/hamburger menu agar dapat mengakses setiap halaman 
* Membuat model dan list untuk budget yang akan dimasukkan
* Menambahkan halaman form untuk menambahkan budget ke dalam list
* Menambahkan halaman untuk mendisplay budget menggunakan `ListView`

### Bonus
* Menambahkan button untuk memilih tanggal pada form dengan `DateTime` dan menambahkan atribut `tanggal` pada model budget
* Menambahkan tanggal dari budget di sebelah teks judul budget
* Membuat file baru untuk drawer dengan class `CustomDrawer` lalu tambahkan pada setiap halaman


# Tugas 9

### Pengambilan data JSON tanpa membubat model
Bisa, data JSON bida didecode melalui `jsonDecode()` dengan string JSON sebagai argumen methodnya. Namun, method ini mengembalina `Map<String, dynamic>`, sehingga sebelum runtime, tipe dari value tidak diketahui. Sedangkan bila menggunakan models, kode akan memiliki type safety, autocompletion dan compile-time exceptions.

### Widget dalam proyek
* `FutureBuilder`: membuat sebuah widget yang membangun dirinya sendiri berdasarkan snapshot terbaru dari interkasi dengan Future
* `ListView`: membuat scrollable array linear dari widget yang dapat dibuat 
* `GestureDetector`: membuat widget yang dapat mendeteksi gestur
* `Checkbox`: membuat meterial design checkbox

### Mekanisme pengambilan data JSON hingga ditampilkan pada Flutter
* Tambahkan package http untuk fetch data dari internet
* Membuat method untuk melakukan fetch data JSON dengan `http.get()`
* Membuat model yang akan berisi data dari network request
* Dalam model tambahkan juga factory constructor yang akan membuat objek tersebut dari JSON.
* Display data menggunakan widget FutureBuilder

### Implementasi
* Menambahkan model `MyWatchList`
* Membuat method `fetchWatchlist()` untuk mendapatkan data JSON
* Menambahkan halaman yang menampilkan setiap watchlist dan detailnya bila ditekan
* Menambahkan watchlist ke dalam drawer

### Bonus 
* Menambahkan checkbox pada watchlist
* Menambahkan border pada container watchlist
* Menempatkan method `fetchWatchList()` ke dalam file baru