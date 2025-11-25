import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Simpan foto dengan nama pengirim dan timestamp
  Future<void> savePhoto(String base64Image, String senderName) async {
    await _db.collection('photos').add({
      'image': base64Image,
      'sender': senderName,
      'timestamp': FieldValue.serverTimestamp(),
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  // Ambil semua foto, urutkan dari terbaru
  Stream<QuerySnapshot> getPhotos() {
    return _db
        .collection('photos')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Hapus foto
  Future<void> deletePhoto(String docId) async {
    await _db.collection('photos').doc(docId).delete();
  }
}