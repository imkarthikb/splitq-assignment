class User {
  int? id;
  int? userStatus;
  String? accessToken;
  String? userId;
  String? email;
  Null? onBoardDate;
  int? role;
  String? phone;
  bool? maintenance;
  String? refreshToken;
  bool? clinicExists;
  bool? pathologyExists;
  bool? pathologyStatus;
  Null? pathologyVerificationStatus;
  UserProfileDto? userProfileDto;

  User(
      {this.id,
      this.userStatus,
      this.accessToken,
      this.userId,
      this.email,
      this.onBoardDate,
      this.role,
      this.phone,
      this.maintenance,
      this.refreshToken,
      this.clinicExists,
      this.pathologyExists,
      this.pathologyStatus,
      this.pathologyVerificationStatus,
      this.userProfileDto});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userStatus = json['userStatus'];
    accessToken = json['accessToken'];
    userId = json['userId'];
    email = json['email'];
    onBoardDate = json['onBoardDate'];
    role = json['role'];
    phone = json['phone'];
    maintenance = json['maintenance'];
    refreshToken = json['refreshToken'];
    clinicExists = json['clinicExists'];
    pathologyExists = json['pathologyExists'];
    pathologyStatus = json['pathologyStatus'];
    pathologyVerificationStatus = json['pathologyVerificationStatus'];
    userProfileDto = json['userProfileDto'] != null
        ? new UserProfileDto.fromJson(json['userProfileDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userStatus'] = this.userStatus;
    data['accessToken'] = this.accessToken;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['onBoardDate'] = this.onBoardDate;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['maintenance'] = this.maintenance;
    data['refreshToken'] = this.refreshToken;
    data['clinicExists'] = this.clinicExists;
    data['pathologyExists'] = this.pathologyExists;
    data['pathologyStatus'] = this.pathologyStatus;
    data['pathologyVerificationStatus'] = this.pathologyVerificationStatus;
    if (this.userProfileDto != null) {
      data['userProfileDto'] = this.userProfileDto!.toJson();
    }
    return data;
  }
}

class UserProfileDto {
  String? firstName;
  String? lastName;
  Null? registrationNumber;
  Null? categoryDto;
  Null? dob;
  int? experience;
  Null? addressLine1;
  Null? addressLine2;
  Null? city;
  Null? country;
  Null? state;
  Null? pinCode;
  double? latitude;
  double? longitude;
  Null? landmark;
  Null? registrationImage;
  Null? userImage;
  String? gender;
  Null? bloodGroup;
  String? referCode;
  String? referredBy;
  Null? educationDtoList;
  Null? workExperienceDtoList;

  UserProfileDto(
      {this.firstName,
      this.lastName,
      this.registrationNumber,
      this.categoryDto,
      this.dob,
      this.experience,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.country,
      this.state,
      this.pinCode,
      this.latitude,
      this.longitude,
      this.landmark,
      this.registrationImage,
      this.userImage,
      this.gender,
      this.bloodGroup,
      this.referCode,
      this.referredBy,
      this.educationDtoList,
      this.workExperienceDtoList});

  UserProfileDto.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    registrationNumber = json['registrationNumber'];
    categoryDto = json['categoryDto'];
    dob = json['dob'];
    experience = json['experience'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    pinCode = json['pinCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    landmark = json['landmark'];
    registrationImage = json['registrationImage'];
    userImage = json['userImage'];
    gender = json['gender'];
    bloodGroup = json['bloodGroup'];
    referCode = json['referCode'];
    referredBy = json['referredBy'];
    educationDtoList = json['educationDtoList'];
    workExperienceDtoList = json['workExperienceDtoList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['registrationNumber'] = this.registrationNumber;
    data['categoryDto'] = this.categoryDto;
    data['dob'] = this.dob;
    data['experience'] = this.experience;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['pinCode'] = this.pinCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['landmark'] = this.landmark;
    data['registrationImage'] = this.registrationImage;
    data['userImage'] = this.userImage;
    data['gender'] = this.gender;
    data['bloodGroup'] = this.bloodGroup;
    data['referCode'] = this.referCode;
    data['referredBy'] = this.referredBy;
    data['educationDtoList'] = this.educationDtoList;
    data['workExperienceDtoList'] = this.workExperienceDtoList;
    return data;
  }
}
