import 'package:flutter/material.dart';

import '../models/student_model.dart';
import '../services/student_service.dart';

class StudentController extends ChangeNotifier {
  final StudentService _service = StudentService();

  late List<StudentModel> _students;

  List<StudentModel> _filteredStudents = [];

  StudentController() {
    _students = _service.getAllStudents();
  }

  /// Seluruh data mahasiswa
  List<StudentModel> get students => List.unmodifiable(_students);

  /// Data hasil pencarian/filter
  List<StudentModel> get filteredStudents =>
      _filteredStudents.isEmpty ? _students : _filteredStudents;

  //------------------------------------
  // Refresh Data
  //------------------------------------

  void refreshData() {
    _students = _service.getAllStudents();
    notifyListeners();
  }

  //------------------------------------
  // Tambah Mahasiswa
  //------------------------------------

  void addStudent(StudentModel student) {
    _service.addStudent(student);

    _students = _service.getAllStudents();

    _filteredStudents.clear();

    notifyListeners();
  }

  //------------------------------------
  // Hapus Mahasiswa
  //------------------------------------

  void deleteStudent(String nim) {
    _service.deleteStudent(nim);

    _students = _service.getAllStudents();

    _filteredStudents.clear();

    notifyListeners();
  }

  //------------------------------------
  // Update Mahasiswa
  //------------------------------------

  void updateStudent(StudentModel student) {
    _service.updateStudent(student);

    _students = _service.getAllStudents();

    _filteredStudents.clear();

    notifyListeners();
  }

  //------------------------------------
  // Cari Mahasiswa
  //------------------------------------

  void searchStudent(String keyword) {
    if (keyword.trim().isEmpty) {
      _filteredStudents.clear();
    } else {
      _filteredStudents = _service.searchStudents(keyword);
    }

    notifyListeners();
  }

  //------------------------------------
  // Filter Jurusan
  //------------------------------------

  void filterMajor(String major) {
    if (major == "All") {
      _filteredStudents.clear();
    } else {
      _filteredStudents = _service.filterByMajor(major);
    }

    notifyListeners();
  }

  //------------------------------------
  // Ambil Detail Mahasiswa
  //------------------------------------

  StudentModel? getStudent(String nim) {
    return _service.getStudentByNim(nim);
  }

  //------------------------------------
  // Jumlah Mahasiswa
  //------------------------------------

  int totalStudents() {
    return _service.totalStudents();
  }

  //------------------------------------
  // Mahasiswa Aktif
  //------------------------------------

  List<StudentModel> activeStudents() {
    return _service.activeStudents();
  }

  //------------------------------------
  // Reset Filter
  //------------------------------------

  void clearFilter() {
    _filteredStudents.clear();
    notifyListeners();
  }
}