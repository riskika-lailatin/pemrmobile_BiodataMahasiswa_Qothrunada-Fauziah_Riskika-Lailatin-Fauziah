class StudentModel {
  final String image;
  final String name;
  final String nim;
  final String major;
  final String semester;
  final String gender;
  final String birthDate;
  final String email;
  final String phone;
  final double gpa;
  final String address;
  final bool isActive;

  const StudentModel({
    required this.image,
    required this.name,
    required this.nim,
    required this.major,
    required this.semester,
    required this.gender,
    required this.birthDate,
    required this.email,
    required this.phone,
    required this.gpa,
    required this.address,
    this.isActive = true,
  });

  /// Mengubah object menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'nim': nim,
      'major': major,
      'semester': semester,
      'gender': gender,
      'birthDate': birthDate,
      'email': email,
      'phone': phone,
      'gpa': gpa,
      'address': address,
      'isActive': isActive,
    };
  }

  /// Membuat object dari Map
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      nim: map['nim'] ?? '',
      major: map['major'] ?? '',
      semester: map['semester'] ?? '',
      gender: map['gender'] ?? '',
      birthDate: map['birthDate'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      gpa: (map['gpa'] as num?)?.toDouble() ?? 0.0,
      address: map['address'] ?? '',
      isActive: map['isActive'] ?? true,
    );
  }

  /// Copy object dengan data baru
  StudentModel copyWith({
    String? image,
    String? name,
    String? nim,
    String? major,
    String? semester,
    String? gender,
    String? birthDate,
    String? email,
    String? phone,
    double? gpa,
    String? address,
    bool? isActive,
  }) {
    return StudentModel(
      image: image ?? this.image,
      name: name ?? this.name,
      nim: nim ?? this.nim,
      major: major ?? this.major,
      semester: semester ?? this.semester,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gpa: gpa ?? this.gpa,
      address: address ?? this.address,
      isActive: isActive ?? this.isActive,
    );
  }
}
