class LoginRespModel {
  final String accessToken;
  final String tokenType;
  final User user;

  LoginRespModel({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory LoginRespModel.fromJson(Map<String, dynamic> json) {
    return LoginRespModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      user: User.fromJson(json['user']['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'user': {'user': user.toJson()},
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String createdAt;
  final String updatedAt;
  final int status;
  final String phone;
  final String profilePhotoUrl;
  final String rolename;
  final List<Company> firmalar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.phone,
    required this.profilePhotoUrl,
    required this.rolename,
    required this.firmalar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      phone: json['phone'],
      profilePhotoUrl: json['profile_photo_url'],
      rolename: json['rolename'],
      firmalar:
          (json['firmalar'] as List).map((e) => Company.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'phone': phone,
      'profile_photo_url': profilePhotoUrl,
      'rolename': rolename,
      'firmalar': firmalar.map((e) => e.toJson()).toList(),
    };
  }
}

class Company {
  final int id;
  final int parentId;
  final String kodu;
  final String kisaUnvan;
  final int kapasite;
  final int asil;
  final int ikinci;
  final int ogle;
  final int shmId;
  final String renk;
  final String faturaUnvan;
  final String faturaAdres;
  final int faturaIl;
  final String vergiNo;
  final String efaturaPk;
  final bool status;
  final int paket;
  final String bsLogo;
  final String createdAt;
  final String updatedAt;
  final bool balonSistem;
  final Pivot pivot;

  Company({
    required this.id,
    required this.parentId,
    required this.kodu,
    required this.kisaUnvan,
    required this.kapasite,
    required this.asil,
    required this.ikinci,
    required this.ogle,
    required this.shmId,
    required this.renk,
    required this.faturaUnvan,
    required this.faturaAdres,
    required this.faturaIl,
    required this.vergiNo,
    required this.efaturaPk,
    required this.status,
    required this.paket,
    required this.bsLogo,
    required this.createdAt,
    required this.updatedAt,
    required this.balonSistem,
    required this.pivot,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      parentId: json['ParentId'],
      kodu: json['Kodu'],
      kisaUnvan: json['KisaUnvan'],
      kapasite: json['Kapasite'],
      asil: json['Asil'],
      ikinci: json['Ikinci'],
      ogle: json['Ogle'],
      shmId: json['ShmId'],
      renk: json['Renk'],
      faturaUnvan: json['FaturaUnvan'],
      faturaAdres: json['FaturaAdres'],
      faturaIl: json['FaturaIl'],
      vergiNo: json['VergiNo'],
      efaturaPk: json['EfaturaPk'],
      status: json['Status'],
      paket: json['Paket'],
      bsLogo: json['BsLogo'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      balonSistem: json['BalonSistem'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ParentId': parentId,
      'Kodu': kodu,
      'KisaUnvan': kisaUnvan,
      'Kapasite': kapasite,
      'Asil': asil,
      'Ikinci': ikinci,
      'Ogle': ogle,
      'ShmId': shmId,
      'Renk': renk,
      'FaturaUnvan': faturaUnvan,
      'FaturaAdres': faturaAdres,
      'FaturaIl': faturaIl,
      'VergiNo': vergiNo,
      'EfaturaPk': efaturaPk,
      'Status': status,
      'Paket': paket,
      'BsLogo': bsLogo,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'BalonSistem': balonSistem,
      'pivot': pivot.toJson(),
    };
  }
}

class Pivot {
  final int userId;
  final int companyId;

  Pivot({
    required this.userId,
    required this.companyId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'],
      companyId: json['company_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'company_id': companyId,
    };
  }
}
