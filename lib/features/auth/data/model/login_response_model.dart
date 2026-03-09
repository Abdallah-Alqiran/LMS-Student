
class LoginResponseModel {
  final String message;
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  LoginResponseModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  Map<String, dynamic> toJson() {
  return {
    'message': message,
    'access': accessToken,     
    'refresh': refreshToken,    
    'user': user.toJson(),      
  };
}
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    
    return LoginResponseModel(
      message: json['message'] ?? '',
      accessToken: json['access'] ?? '',
      refreshToken: json['refresh'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }

  factory LoginResponseModel.error(String message) {
    return LoginResponseModel(
      message: message,
      accessToken: '',
      refreshToken: '',
      user: UserModel.fromJson({}),
    );
  }

  @override
  String toString() {
    return 'LoginResponseModel(message: $message)';
  }
}