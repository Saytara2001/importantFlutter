import 'package:informermobile_flutter/data/local/constants/LocalDBConstants.dart';
import 'package:informermobile_flutter/data/model/auth/User.dart';
import 'package:sembast/sembast.dart';

class UserDataSource {


  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _postsStore = intMapStoreFactory.store(LocalDBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  //  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Future<Database> _db;

  // Constructor
  UserDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(User user) async {
    return await _postsStore.add(await _db, user.toMap());
  }

  Future<int> count() async {
    return await _postsStore.count(await _db);
  }

  Future<List<User>> getAllSortedByFilter({List<Filter> filters}) async {
    //creating finder
    final finder = Finder(
        filter: Filter.and(filters),
        sortOrders: [SortOrder(LocalDBConstants.FIELD_ID)]);

    final recordSnapshots = await _postsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<User> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final post = User.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      post.id = snapshot.key;
      return post;
    }).toList();
  }


  Future<int> update(User user) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(user.id));
    return await _postsStore.update(
      await _db,
      user.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(User user) async {
    final finder = Finder(filter: Filter.byKey(user.id));
    return await _postsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _postsStore.drop(
      await _db,
    );
  }
}
