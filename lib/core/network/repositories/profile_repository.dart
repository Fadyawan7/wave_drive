

abstract class ProfileRepository {
  
  Future<void> deleteAccount();
  Future<void> logout();
  Future<void> copyToClipboard(String text);
}

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<void> copyToClipboard(String text) {
    // TODO: implement copyToClipboard
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<dynamic> updateProfile(profile) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  // final ProfileService _service;

  // ProfileRepositoryImpl(this._service);

  // @override
  // Future<UserProfile> getProfile() async {
  //   return await _service.getProfile();
  // }

  // @override
  // Future<UserProfile> updateProfile(UserProfile profile) async {
  //   return await _service.updateProfile(profile);
  // }

  // @override
  // Future<void> deleteAccount() async {
  //   return await _service.deleteAccount();
  // }

  // @override
  // Future<void> logout() async {
  //   return await _service.logout();
  // }

  // @override
  // Future<void> copyToClipboard(String text) async {
  //   return await _service.copyToClipboard(text);
  // }
}

