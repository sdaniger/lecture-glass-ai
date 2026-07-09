import 'lecture.dart';

abstract class LectureRepositoryInterface {
  Future<List<Lecture>> getAll();
  Future<Lecture?> getById(int id);
  Future<Lecture> create(Lecture lecture);
  Future<Lecture> update(Lecture lecture);
  Future<void> delete(int id);
  Future<List<Lecture>> search(String query);
  Future<List<Lecture>> getRecent({required int limit});
  Stream<List<Lecture>> watchAll();
}