class UserResponse  {
  final String? name;
  final String? email;
  final String? password;
  final String? dob;
  final String? gendar;

  const UserResponse({
     this.name,
    this.email,
     this.password,
    this.dob,
    this.gendar,
  });
  // factory UserResponse.fromJson(Map<String, dynamic> map) => _$UserResponseFromJson(map);


// factory UserResponse.fromJson(JSON? json) {
  //   return UserResponse(
  //     name: json?['name'] as String,
  //     email: json?['email'] as String?,
  //     password: json?['password'] as String,
  //     dob: json?['dob'] as String?,
  //     gendar: json?['gendar'] as String,
  //   );
  //
  // }
}

