import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbUtils {
  static Database _profDB;
  static Database _msgDB;

  static final _databaseVersion = 1;

  // make this a singleton class
  DbUtils._privateConstructor();

  // only have a single app-wide reference to the database
  static final DbUtils instance = DbUtils._privateConstructor();

  // Get Profile Database to store and Edit User Profile.
  Future<Database> get profdb async {
    if (_profDB != null) return _profDB;
    // lazily instantiate the db the first time it is accessed
    _profDB = await _initprof();
    return _profDB;
  }

  // Get Db where chat_list and messages will be stored.
  Future<Database> get msgdb async {
    if (_msgDB != null) return _msgDB;
    // lazily instantiate the db the first time it is accessed
    _msgDB = await _initmsgs();
    return _msgDB;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initprof() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "sa.db");
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreateProfile);
  }

  _initmsgs() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "msgstore.db");
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreateMsgs);
  }

  // SQL code to create the database table
  Future _onCreateProfile(Database db, int version) async {
    await db.execute('''
          CREATE Table if not exists contacts (
            user_id varchar(30) NOT NULL,
            fullname varchar(30),
            email varchar(30)
          )
          '''); // Table for Contacts
    await db.execute('''
          CREATE Table if not exists ME (
            user_id varchar(30) NOT NULL,
            fullname varchar(30),
            email varchar(30)            
          )
          '''); // Table for My Profile.
  }

  Future _onCreateMsgs(Database db, int version) async {
    await db.execute('''
          CREATE TABLE chat_List (
            row_id integer key auto_increment,
            userId varchar(31),
            chatId varchar(127) UNIQUE NOT NULL
          )
          '''); // Table for chat_lists
  }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.

  Future<int> insertmsg(Map<String, dynamic> row) async {
    Database db = await instance.msgdb;
    String tbName = row["chatId"];
    String otherUser = row["from"];
    await db.execute("""
      CREATE TABLE IF NOT EXISTS $tbName (
        row_id integer key auto_increment,
        sender varchar(30),
        message varchar(256)
      )"""); // create new table if not exists.

    insertChatList({
      'userId': row["from"],
      'chatId': row["chatId"],
    }); // insert this chatId into chat_list table.
    return await db.insert(tbName, row);
  }

  Future<int> insertProf(Map<String, dynamic> row) async {
    Database db = await instance.profdb;
    String tbName = "ME";
    return await db.insert(tbName, row);
  }

  Future<int> insertChatList(Map<String, dynamic> row) async {
    Database db = await instance.msgdb;
    String tbName = "chat_list";
    return await db.insert(tbName, row,
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<int> insertContact(Map<String, dynamic> row) async {
    Database db = await instance.profdb;
    String tbName = "contacts";
    return await db.insert(tbName, row,
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<Map<String, dynamic>> getProfile() async {
    Database db = await instance.profdb;
    List<Map<String, dynamic>> mees = await db.query("ME");
    return mees[0];
  }

  Future<List<Map<String, dynamic>>> getChatList() async {
    Database db = await instance.msgdb;
    List<Map<String, dynamic>> chatids = await db.query(
      "chat_list",
      columns: ["chatId"],
    );
    return chatids;
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    Database db = await instance.profdb;
    List<Map<String, dynamic>> contacts = await db.query("contacts");
    return contacts;
  }

  Future<List<Map<String, dynamic>>> getRecentChats() async {
    Database db = await instance.profdb;
    List<Map<String, dynamic>> chatlists = await getChatList();
    List<Map<String, dynamic>> recentList;
    chatlists.forEach((element) async {
      Map<String, dynamic> tile = await fetchLastMessage(element["chatId"]);
      recentList.add(tile);
    });
    return recentList;
  }

  Future<Map<String, dynamic>> fetchLastMessage(String tbName) async {
    Database db = await instance.msgdb;
    Map<String, dynamic> tile;

    String query = "select max(row_id) from $tbName limit 1";
    int lastMsg = (await db.rawQuery(query))[0]["row_id"];

    query = "select * from $tbName where row_id = $lastMsg";
    return (await db.rawQuery(query))[0];
  }

  Future<List<Map<String, dynamic>>> fetchChats(String chatid) async {
    Database db = await instance.msgdb;
    return await db.query(chatid);
  }
}
/*
  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }
  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
*/