import 'dart:collection';
import 'dart:io';

import '../sender_key_name.dart';
import 'sender_key_record.dart';
import 'sender_key_store.dart';

class InMemorySenderKeyStore extends SenderKeyStore {
  final store = HashMap<SenderKeyName, SenderKeyRecord>();

  @override
  Future<SenderKeyRecord> loadSenderKey(SenderKeyName senderKeyName) async {
    try {
      final record = store[senderKeyName];
      if (record == null) {
        return SenderKeyRecord();
      } else {
        return SenderKeyRecord.fromSerialized(record.serialize());
      }
    } on IOException catch (e) {
      throw AssertionError(e);
    }
  }

  @override
  Future<void> storeSenderKey(
      SenderKeyName senderKeyName, SenderKeyRecord record) async {
    store[senderKeyName] = record;
  }
}
