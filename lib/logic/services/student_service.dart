import '../data/dummy_data.dart';
import '../models/student_model.dart';

class StudentService {
  // Singleton
  StudentService._internal();

  static final StudentService _instance = StudentService._internal();

  factory StudentService() => _instance;

  // Menyimpan data mahasiswa
  final List<StudentModel> _students = List.from(dummyStudents);

  /// Mengambil seluruh data mahasiswa
  List<StudentModel> getAllStudents() {
    return List.from(_students);
  }

  /// Mengambil satu mahasiswa berdasarkan NIM
  StudentModel? getStudentByNim(String nim) {
    try {
      return _students.firstWhere(
            (student) => student.nim == nim,
      );
    } catch (_) {
      return null;
    }
  }

  /// Menambahkan mahasiswa baru
  void addStudent(StudentModel student) {
    _students.add(student);
  }

  /// Menghapus mahasiswa berdasarkan NIM
  void deleteStudent(String nim) {
    _students.removeWhere(
          (student) => student.nim == nim,
    );
  }

  /// Memperbarui data mahasiswa
  void updateStudent(StudentModel student) {
    final index = _students.indexWhere(
          (item) => item.nim == student.nim,
    );

    if (index != -1) {
      _students[index] = student;
    }
  }

  /// Pencarian berdasarkan nama atau NIM
  List<StudentModel> searchStudents(String keyword) {
    if (keyword.trim().isEmpty) {
      return getAllStudents();
    }

    final query = keyword.toLowerCase();

    return _students.where((student) {
      return student.name.toLowerCase().contains(query) ||
          student.nim.toLowerCase().contains(query);
    }).toList();
  }

  /// Filter berdasarkan jurusan
  List<StudentModel> filterByMajor(String major) {
    if (major == "All") {
      return getAllStudents();
    }

    return _students.where((student) {
      return student.major == major;
    }).toList();
  }

  /// Mengambil jumlah mahasiswa
  int totalStudents() {
    return _students.length;
  }

  /// Mengambil mahasiswa aktif
  List<StudentModel> activeStudents() {
    return _students.where((student) {
      return student.isActive;
    }).toList();
  }
}