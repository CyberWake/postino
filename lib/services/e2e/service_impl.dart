import 'package:pointycastle/api.dart' as crypto;
import 'package:pointycastle/export.dart';
import 'package:postino/services/e2e/service.dart';
import 'package:postino/services/service_locator.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';

class E2EEServiceImpl extends E2EE {
  @override
  Future<String> generateKeys() async {
    final keyHelper = RsaKeyHelper();
    final crypto.AsymmetricKeyPair keyPair =
        await keyHelper.computeRSAKeyPair(keyHelper.getSecureRandom());
    final String publicKey = keyHelper.removePemHeaderAndFooter(
      keyHelper.encodePublicKeyToPemPKCS1(keyPair.publicKey as RSAPublicKey),
    );
    final String privateKey = keyHelper.removePemHeaderAndFooter(
      keyHelper.encodePrivateKeyToPemPKCS1(keyPair.privateKey as RSAPrivateKey),
    );
    localDatabaseService.savePrivateKey(privateKey);
    return publicKey;
  }

  @override
  Future<String> encryptMessage(String message, String key) async {
    final keyHelper = RsaKeyHelper();
    final publicKey = keyHelper.parsePublicKeyFromPem(key);
    return encrypt(message, publicKey);
  }
}
