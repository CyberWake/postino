abstract class E2EE {
  Future<String> generateKeys();
  Future<String> encryptMessage(String message, String key);
}
