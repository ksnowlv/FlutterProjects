  class RegistRequest {
    final String name;
    final int age;
    final String phone;
    final String verificationCode;

    RegistRequest({required this.name, required this.age, required this.phone, required this.verificationCode});

    Map<String, dynamic> toJson() {
      return {
        'name': name,
        'age': age,
        'phone': phone,
        'verification_code': verificationCode,
      };
    }
  }