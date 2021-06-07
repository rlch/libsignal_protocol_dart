import 'dart:typed_data';

import '../util/byte_util.dart';

class DisplayableFingerprint {
  DisplayableFingerprint(
      Uint8List localFingerprint, Uint8List remoteFingerprint) {
    localFingerprintNumbers = _getDisplayStringFor(localFingerprint);
    remoteFingerprintNumbers = _getDisplayStringFor(remoteFingerprint);
  }

  late String localFingerprintNumbers, remoteFingerprintNumbers;

  String getDisplayText() {
    if (localFingerprintNumbers.compareTo(remoteFingerprintNumbers) <= 0) {
      return localFingerprintNumbers + remoteFingerprintNumbers;
    } else {
      return remoteFingerprintNumbers + localFingerprintNumbers;
    }
  }

  String _getDisplayStringFor(Uint8List fingerprint) =>
      _getEncodedChunk(fingerprint, 0) +
      _getEncodedChunk(fingerprint, 5) +
      _getEncodedChunk(fingerprint, 10) +
      _getEncodedChunk(fingerprint, 15) +
      _getEncodedChunk(fingerprint, 20) +
      _getEncodedChunk(fingerprint, 25);

  String _getEncodedChunk(Uint8List hash, int offset) {
<<<<<<< HEAD:lib/src/fingerprint/displayable_fingerprint.dart
    final chunk = ByteUtil.byteArray5ToLong(hash, offset).remainder(100000);
=======
    var chunk = ByteUtil.byteArray5ToLong(hash, offset) % 100000;
>>>>>>> a0b4bc029623fbd9768e8ad41663ec571c8c1a54:lib/src/fingerprint/DisplayableFingerprint.dart
    return chunk.toString().padLeft(5, '0');
  }
}
