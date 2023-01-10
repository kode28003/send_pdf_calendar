import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PdfViewPageWidget extends StatefulWidget {
  const PdfViewPageWidget({Key? key}) : super(key: key);

  @override
  _PdfViewPageWidgetState createState() => _PdfViewPageWidgetState();
}

class _PdfViewPageWidgetState extends State<PdfViewPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PDF View',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
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
              FlutterFlowPdfViewer(
                networkPath: functions.toString(FFAppState().pdfView),
                height: 300,
                horizontalScroll: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
