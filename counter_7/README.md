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