import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _state = false;
  bool get state => _state;
  set state(bool _value) {
    _state = _value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  DateTime? _selectedDateEnd;
  DateTime? get selectedDateEnd => _selectedDateEnd;
  set selectedDateEnd(DateTime? _value) {
    _selectedDateEnd = _value;
  }

  DateTime? _selectedDateStart;
  DateTime? get selectedDateStart => _selectedDateStart;
  set selectedDateStart(DateTime? _value) {
    _selectedDateStart = _value;
  }

  String _pdfView = '';
  String get pdfView => _pdfView;
  set pdfView(String _value) {
    _pdfView = _value;
  }

  List<String> _sendMailUsers = [];
  List<String> get sendMailUsers => _sendMailUsers;
  set sendMailUsers(List<String> _value) {
    _sendMailUsers = _value;
  }

  void addToSendMailUsers(String _value) {
    _sendMailUsers.add(_value);
  }

  void removeFromSendMailUsers(String _value) {
    _sendMailUsers.remove(_value);
  }

  int _schedulesSelectedMonth = 0;
  int get schedulesSelectedMonth => _schedulesSelectedMonth;
  set schedulesSelectedMonth(int _value) {
    _schedulesSelectedMonth = _value;
  }

  List<DocumentReference> _shareUsersSelected = [];
  List<DocumentReference> get shareUsersSelected => _shareUsersSelected;
  set shareUsersSelected(List<DocumentReference> _value) {
    _shareUsersSelected = _value;
  }

  void addToShareUsersSelected(DocumentReference _value) {
    _shareUsersSelected.add(_value);
  }

  void removeFromShareUsersSelected(DocumentReference _value) {
    _shareUsersSelected.remove(_value);
  }

  List<DocumentReference> _deleteDisplayUsers = [];
  List<DocumentReference> get deleteDisplayUsers => _deleteDisplayUsers;
  set deleteDisplayUsers(List<DocumentReference> _value) {
    _deleteDisplayUsers = _value;
  }

  void addToDeleteDisplayUsers(DocumentReference _value) {
    _deleteDisplayUsers.add(_value);
  }

  void removeFromDeleteDisplayUsers(DocumentReference _value) {
    _deleteDisplayUsers.remove(_value);
  }

  String _resisterPhoto = '';
  String get resisterPhoto => _resisterPhoto;
  set resisterPhoto(String _value) {
    _resisterPhoto = _value;
  }

  bool _showFullFrendList = false;
  bool get showFullFrendList => _showFullFrendList;
  set showFullFrendList(bool _value) {
    _showFullFrendList = _value;
  }

  bool _showSearchUser = false;
  bool get showSearchUser => _showSearchUser;
  set showSearchUser(bool _value) {
    _showSearchUser = _value;
  }

  String _profileImageUrl = '';
  String get profileImageUrl => _profileImageUrl;
  set profileImageUrl(String _value) {
    _profileImageUrl = _value;
  }

  DateTime? _selectMonthBegin;
  DateTime? get selectMonthBegin => _selectMonthBegin;
  set selectMonthBegin(DateTime? _value) {
    _selectMonthBegin = _value;
  }

  DateTime? _selectMonthEnd;
  DateTime? get selectMonthEnd => _selectMonthEnd;
  set selectMonthEnd(DateTime? _value) {
    _selectMonthEnd = _value;
  }

  int _selectYear = 2022;
  int get selectYear => _selectYear;
  set selectYear(int _value) {
    _selectYear = _value;
  }

  int _selectMonth = 11;
  int get selectMonth => _selectMonth;
  set selectMonth(int _value) {
    _selectMonth = _value;
  }

  String _calendarAccessToken = '';
  String get calendarAccessToken => _calendarAccessToken;
  set calendarAccessToken(String _value) {
    _calendarAccessToken = _value;
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
  }

  List<String> _shareUserEmailList = [];
  List<String> get shareUserEmailList => _shareUserEmailList;
  set shareUserEmailList(List<String> _value) {
    _shareUserEmailList = _value;
  }

  void addToShareUserEmailList(String _value) {
    _shareUserEmailList.add(_value);
  }

  void removeFromShareUserEmailList(String _value) {
    _shareUserEmailList.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
