part of 'models.dart';

class Users extends Equatable {
  final int id;
  static String token;
  final String name,
      email,
      phoneNumber,
      photoURL,
      majors,
      studyProgram,
      yearGeneration,
      tokenNotif,
      roles,
      gender,
      address; //mahasiswa & admin

  final DateTime timeCreate, timeUpdate;
  Users({
    this.id,
    @required this.email,
    @required this.name,
    @required this.majors,
    @required this.studyProgram,
    @required this.yearGeneration,
    @required this.photoURL,
    @required this.phoneNumber,
    @required this.roles,
    @required this.gender,
    @required this.address,
    @required this.tokenNotif,
    this.timeCreate,
    this.timeUpdate,
  });
  @override
  List<Object> get props => [
        id,
        name,
        email,
        phoneNumber,
        photoURL,
        majors,
        studyProgram,
        tokenNotif,
        yearGeneration,
        roles,
        timeCreate,
        timeUpdate,
        gender,
        address
      ];

  factory Users.fromJson(Map<String, dynamic> data) {
    // storageURL
    return Users(
      id: data['id'],
      email: data['email'],
      name: data['name'],
      phoneNumber: data['phone_number'],
      photoURL: data['profile_photo_url'] ??
          '$storageURL' + data['profile_photo_path'],
      majors: data['majors'],
      studyProgram: data['study_program'],
      yearGeneration: data['year_generation'],
      tokenNotif: data['token_notif'],
      roles: data['roles'],
      gender: data['gender'],
      address: data['address'],
      timeCreate: DateTime.parse(data['created_at']),
      timeUpdate: DateTime.parse(data['updated_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
      'profile_photo_path': photoURL,
      'majors': majors,
      'study_program': studyProgram,
      'year_generation': yearGeneration,
      'roles': roles ?? 'Mahasiswa',
      'token_notif': tokenNotif,
      'gender': gender,
      'address': address,
    };
  }

  Users copyWith({
    String email,
    String name,
    String phoneNumber,
    String photoURL,
    String majors,
    String studyProgram,
    String yearGeneration,
    String gender,
    String address,
    String tokenNotif,
  }) {
    return Users(
        id: this.id,
        email: this.email,
        name: name ?? this.name,
        roles: this.roles,
        majors: majors ?? this.majors,
        studyProgram: studyProgram ?? this.studyProgram,
        yearGeneration: yearGeneration ?? this.yearGeneration,
        tokenNotif: tokenNotif ?? this.tokenNotif,
        photoURL: photoURL ?? this.photoURL,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        timeCreate: this.timeCreate,
        timeUpdate: timeUpdate ?? this.timeUpdate);
  }
}

List<Users> mockUser = [
  Users(
    id: 1,
    email: 'ayundaRyn@gmail.com',
    name: 'Ayunda Riyanti',
    majors: 'Teknik Informatika',
    studyProgram: 'D4 RPL',
    yearGeneration: '2018',
    photoURL:
        "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png",
    phoneNumber: '08971613199',
    roles: 'mahasiswa',
    tokenNotif: 'test',
    gender: 'L',
    address: 'Majalengka',
  ),
  Users(
    id: 2,
    email: 'maruf@gmail.com',
    name: 'Muhamad Abdan',
    majors: 'Teknik Informatika',
    studyProgram: 'D4 RPL',
    yearGeneration: '2018',
    photoURL:
        'https://asset-a.grid.id/crop/0x0:0x0/360x240/photo/2019/10/22/3877025586.jpg',
    phoneNumber: '08971613199',
    roles: 'mahasiswa',
    tokenNotif: 'test',
    gender: 'L',
    address: 'Majalengka',
  ),
  Users(
    id: 3,
    email: 'reynegodep@gmail.com',
    name: 'Reynego Depari',
    majors: 'Teknik Informatika',
    studyProgram: 'D4 RPL',
    yearGeneration: '2018',
    photoURL:
        "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png",
    phoneNumber: '08971613199',
    roles: 'mahasiswa',
    tokenNotif: 'test',
    gender: 'L',
    address: 'Majalengka',
  ),
];
