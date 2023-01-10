import '../add_share_users_page/add_share_users_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_calendar_page/main_calendar_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNormalSchdulePageWidget extends StatefulWidget {
  const AddNormalSchdulePageWidget({Key? key}) : super(key: key);

  @override
  _AddNormalSchdulePageWidgetState createState() =>
      _AddNormalSchdulePageWidgetState();
}

class _AddNormalSchdulePageWidgetState
    extends State<AddNormalSchdulePageWidget> {
  ApiCallResponse? accessToken1;
  ApiCallResponse? insertGoogleCalendar;
  ApiCallResponse? accessToken2;
  ApiCallResponse? respond2;
  DateTime? datePicked1;
  bool? switchListTileValue;
  DateTime? datePicked2;
  DateTime? datePicked3;
  TextEditingController? detailFieldController;
  TextEditingController? titleFieldController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    detailFieldController = TextEditingController();
    titleFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    detailFieldController?.dispose();
    titleFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'スケジュール作成',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 200),
                            reverseDuration: Duration(milliseconds: 200),
                            child: MainCalendarPageWidget(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.cancel_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 44,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: titleFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: 'タイトルを追加',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(36, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF0F1113),
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.dehaze_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: detailFieldController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: '説明を追加',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0F1113),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                        child: Icon(
                          Icons.access_time_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: SwitchListTile.adaptive(
                            value: switchListTileValue ??= true,
                            onChanged: (newValue) async {
                              setState(() => switchListTileValue = newValue!);
                            },
                            title: Text(
                              '終日',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!switchListTileValue!)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked1 = date);
                            },
                            currentTime: FFAppState().selectedDateStart == null
                                ? getCurrentTimestamp
                                : FFAppState().selectedDateStart!,
                            minTime: DateTime(0, 0, 0),
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: () => LocaleType.en,
                            ),
                          );

                          if (datePicked1 != null) {
                            FFAppState().update(() {
                              FFAppState().selectedDateStart = datePicked1;
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(56, 0, 0, 0),
                              child: Text(
                                dateTimeFormat(
                                  'Md',
                                  FFAppState().selectedDateStart,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            if (switchListTileValue == false)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                                child: Text(
                                  dateTimeFormat(
                                    'Hm',
                                    FFAppState().selectedDateStart,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (!switchListTileValue!)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                      child: InkWell(
                        onTap: () async {
                          await DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked2 = date);
                            },
                            currentTime: FFAppState().selectedDateEnd == null
                                ? getCurrentTimestamp
                                : FFAppState().selectedDateEnd!,
                            minTime: DateTime(0, 0, 0),
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: () => LocaleType.en,
                            ),
                          );

                          if (datePicked2 != null) {
                            FFAppState().update(() {
                              FFAppState().selectedDateEnd = datePicked2;
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(56, 0, 0, 0),
                              child: Text(
                                dateTimeFormat(
                                  'Md',
                                  FFAppState().selectedDateEnd,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            if (switchListTileValue == false)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                                child: Text(
                                  dateTimeFormat(
                                    'Hm',
                                    FFAppState().selectedDateEnd,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (switchListTileValue ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 8, 0, 16),
                      child: InkWell(
                        onTap: () async {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked3 = date);
                            },
                            currentTime: getCurrentTimestamp,
                            minTime: getCurrentTimestamp,
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: () => LocaleType.en,
                            ),
                          );

                          if (datePicked3 != null) {
                            FFAppState().update(() {
                              FFAppState().selectedDate = datePicked3;
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '終日の日付',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 26, 0),
                              child: Text(
                                dateTimeFormat(
                                  'Md',
                                  FFAppState().selectedDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(currentUserReference!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final columnUsersRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.people_rounded,
                              color: Colors.black,
                              size: 24,
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 200),
                                    reverseDuration:
                                        Duration(milliseconds: 200),
                                    child: AddShareUsersPageWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-0.85, 0.25),
                                  child: Text(
                                    '共有ユーザーの追加',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xCA0F1113),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Builder(
                            builder: (context) {
                              final shareUserMemory =
                                  columnUsersRecord.shareUserMemory!.toList();
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      List.generate(shareUserMemory.length,
                                          (shareUserMemoryIndex) {
                                    final shareUserMemoryItem =
                                        shareUserMemory[shareUserMemoryIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            shareUserMemoryItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final circleImageUsersRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: 35,
                                            height: 35,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              circleImageUsersRecord.photoUrl!,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (titleFieldController!.text == '') {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('警告'),
                                content: Text('タイトルを入力してください'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('戻る'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          if (switchListTileValue!) {
                            FFAppState().update(() {
                              FFAppState().addToShareUsersSelected(
                                  currentUserReference!);
                              FFAppState()
                                  .addToShareUserEmailList(currentUserEmail);
                            });
                            accessToken1 = await GetAccessTokenCall.call();
                            insertGoogleCalendar =
                                await SetGoogleCalendarCall.call(
                              summary: titleFieldController!.text,
                              description: detailFieldController!.text,
                              accessToken: GetAccessTokenCall.accessToken(
                                (accessToken1?.jsonBody ?? ''),
                              ).toString(),
                              startTime: functions.returnIsoTimeFormat(
                                  FFAppState().selectedDate),
                              endTime: functions.returnIsoTimeFormat(
                                  functions.getFutureDateTime(
                                      FFAppState().selectedDate)),
                              shareUserEmailListMap: functions
                                  .returnJsonEmail(
                                      FFAppState().shareUserEmailList.toList())
                                  ?.toString(),
                            );

                            final schedulesCreateData = {
                              ...createSchedulesRecordData(
                                timestamp: getCurrentTimestamp,
                                eventTitle: titleFieldController!.text,
                                eventDetail: detailFieldController!.text,
                                createBy: currentUserUid,
                                startTime: FFAppState().selectedDate,
                                endTime: functions.getFutureDateTime(
                                    FFAppState().selectedDate),
                                pdfCheck: false,
                                calendarId: getJsonField(
                                  (insertGoogleCalendar?.jsonBody ?? ''),
                                  r'''$.id''',
                                ).toString(),
                              ),
                              'share_user': FFAppState().shareUsersSelected,
                            };
                            await SchedulesRecord.collection
                                .doc()
                                .set(schedulesCreateData);
                            FFAppState().update(() {
                              FFAppState().deleteDisplayUsers = [];
                            });
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 200),
                                reverseDuration: Duration(milliseconds: 200),
                                child: MainCalendarPageWidget(),
                              ),
                            );
                          } else {
                            if (FFAppState().selectedDateStart! <
                                FFAppState().selectedDateEnd!) {
                              FFAppState().update(() {
                                FFAppState().addToShareUsersSelected(
                                    currentUserReference!);
                                FFAppState()
                                    .addToShareUserEmailList(currentUserEmail);
                              });
                              accessToken2 = await GetAccessTokenCall.call();
                              respond2 = await SetGoogleCalendarCall.call(
                                summary: titleFieldController!.text,
                                description: detailFieldController!.text,
                                accessToken: GetAccessTokenCall.accessToken(
                                  (accessToken2?.jsonBody ?? ''),
                                ).toString(),
                                startTime: functions.returnIsoTimeFormat(
                                    FFAppState().selectedDateStart),
                                endTime: functions.returnIsoTimeFormat(
                                    FFAppState().selectedDateEnd),
                                shareUserEmailListMap: functions
                                    .returnJsonEmail(FFAppState()
                                        .shareUserEmailList
                                        .toList())
                                    ?.toString(),
                              );

                              final schedulesCreateData = {
                                ...createSchedulesRecordData(
                                  eventTitle: titleFieldController!.text,
                                  eventDetail: detailFieldController!.text,
                                  createBy: currentUserUid,
                                  startTime: FFAppState().selectedDateStart,
                                  endTime: FFAppState().selectedDateEnd,
                                  timestamp: getCurrentTimestamp,
                                  pdfCheck: false,
                                  calendarId: getJsonField(
                                    (respond2?.jsonBody ?? ''),
                                    r'''$["id"]''',
                                  ).toString(),
                                ),
                                'share_user': FFAppState().shareUsersSelected,
                              };
                              await SchedulesRecord.collection
                                  .doc()
                                  .set(schedulesCreateData);
                              FFAppState().update(() {
                                FFAppState().deleteDisplayUsers = [];
                              });
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 200),
                                  reverseDuration: Duration(milliseconds: 200),
                                  child: MainCalendarPageWidget(),
                                ),
                              );
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('警告'),
                                    content: Text('開始時刻より終了時刻のほうが早いです'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('戻る'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        }

                        setState(() {});
                      },
                      text: '保存',
                      icon: Icon(
                        Icons.check_rounded,
                        size: 34,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
