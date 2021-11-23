class AuthRepository {
  Future<void> login() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> register() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
