class RegisterRepository {
  Future<void> register() async {
    print('atemmpting register');

    await Future.delayed(Duration(seconds: 3));
    print('loggedIn');
  }
}
