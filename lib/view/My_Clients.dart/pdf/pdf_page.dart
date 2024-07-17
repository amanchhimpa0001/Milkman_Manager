import 'dart:io';

import 'package:flutter/services.dart';
import 'package:milkman_manager_app/helpers/all_icons.dart';

import 'package:milkman_manager_app/view/My_Clients.dart/pdf/pdf_api.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;

class MyInvoice {
  Future<File> generateInvoice() async {
    final pw.Document document = await pw.Document();

    final iconImage =
        (await rootBundle.load(Appicons.scner)).buffer.asUint8List();

    // List reportedItems = [];

    document.addPage(pw.Page(
      // pageFormat: PdfPageFormat(width, height),
      margin: pw.EdgeInsets.all(30),
      build: (context) => pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'INVOICE',
                    style: fs20Bold,
                  ),
                  pw.Text(
                    '#0001',
                    style: fs16Bold,
                  ),
                  pw.Text(
                    'Bill Date : 01-01-2024',
                    style: fs10Bold,
                  ),
                ],
              ),
            ],
          ),
          pw.Divider(),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Flexible(
                flex: 1,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Jordan Milk Dairy',
                      style: fs16Bold,
                    ),
                    addHeight(10),
                    pw.Text(
                      '#01, Talaki Gate, Near Bus Stand,\nRishi Nagar, Hisar (Haryana)',
                      style: fs10Bold,
                    ),
                    addHeight(10),
                    pw.Text(
                      '+91 - 890*****11',
                      style: fs10Bold,
                    ),
                    addHeight(10),
                    pw.Text(
                      'Bill Duration : 01 Dec to 31 Mar',
                      style: fs16Bold.copyWith(color: parmiry),
                    ),
                  ],
                ),
              ),
              pw.Flexible(
                flex: 1,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'Bill To:',
                      style: fs10Bold,
                    ),
                    addHeight(10),
                    pw.Text(
                      'Will Smith',
                      style: fs14Bold,
                    ),
                    addHeight(10),
                    pw.Text(
                      '#1230, Sector-14, Opp Shopping Complex, Hisar (Haryana)',
                      style: fs10Bold,
                      textAlign: pw.TextAlign.end,
                    ),
                    addHeight(10),
                    pw.Text(
                      '+91 - 890*****11',
                      style: fs10Bold,
                    ),
                  ],
                ),
              )
            ],
          ),
          addHeight(20),
          pw.Table(children: [
            for (var i = 0; i < 1; i++)
              pw.TableRow(children: [
                pw.Container(
                  height: 45,
                  width: 111,
                  decoration: pw.BoxDecoration(
                      color: parmiry, border: pw.Border.all(color: white)),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("Date",
                            style: pw.TextStyle(fontSize: 10, color: white)),
                      ]),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(10),
                  height: 45,
                  width: 136,
                  decoration: pw.BoxDecoration(
                      color: parmiry, border: pw.Border.all(color: white)),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text("Quantity (Ltr)",
                            style: pw.TextStyle(fontSize: 10, color: white)),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("Mor",
                                  style:
                                      pw.TextStyle(fontSize: 10, color: white)),
                              pw.Text("Eve",
                                  style:
                                      pw.TextStyle(fontSize: 10, color: white)),
                            ])
                      ]),
                ),
                pw.Container(
                  height: 45,
                  width: 111,
                  decoration: pw.BoxDecoration(
                      color: parmiry, border: pw.Border.all(color: white)),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("Rate",
                            style: pw.TextStyle(fontSize: 10, color: white)),
                      ]),
                ),
                pw.Container(
                  height: 45,
                  width: 111,
                  decoration: pw.BoxDecoration(
                      color: parmiry, border: pw.Border.all(color: white)),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("Line Total",
                            style: pw.TextStyle(fontSize: 10, color: white)),
                      ]),
                ),
              ])
          ]),
          pw.Table(children: [
            for (var i = 0; i < 10; i++)
              pw.TableRow(children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Container(
                        height: 36,
                        width: 111,
                        decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: blackLight)),
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text("01 Mar",
                                  style:
                                      pw.TextStyle(fontSize: 10, color: black)),
                            ]),
                      ),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Container(
                        padding: pw.EdgeInsets.all(10),
                        height: 36,
                        width: 111,
                        decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: blackLight)),
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text("2 Ltr",
                                        style: pw.TextStyle(
                                            fontSize: 10, color: black)),
                                    pw.Text("0 Ltr",
                                        style: pw.TextStyle(
                                            fontSize: 10, color: black)),
                                  ])
                            ]),
                      ),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Container(
                        height: 36,
                        width: 111,
                        decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: blackLight)),
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text("65.00",
                                  style:
                                      pw.TextStyle(fontSize: 10, color: black)),
                            ]),
                      ),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Container(
                        height: 36,
                        width: 111,
                        decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: blackLight)),
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text("Rs 130.00",
                                  style:
                                      pw.TextStyle(fontSize: 10, color: black)),
                            ]),
                      ),
                    ])
              ])
          ]),
          addHeight(20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Flexible(
                flex: 1,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Image(
                        pw.MemoryImage(
                          iconImage,
                        ),
                        height: 80),
                    //  pw.Image.asset(
                    //   "assets/images/scner.png",
                    //   scale: 3,
                    // ),
                    pw.Text(
                      "Scan the QR Code to make UPI payment.",
                      style: fs10Regular,
                    )
                  ],
                ),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Sub Total:",
                    style: fs10Regular,
                  ),
                  pw.Text(
                    "Previous Balance:",
                    style: fs10Regular,
                  ),
                  pw.Text(
                    "Grand Total:",
                    style: fs10Regular,
                  )
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Rs. 4,030.00",
                    style: fs10Regular,
                  ),
                  pw.Text(
                    "Rs. 3,030.00",
                    style: fs10Regular,
                  ),
                  pw.Text(
                    "Rs. 7,210.00",
                    style: fs10Regular,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    ));

    return await PdfApi.saveDocument(document: document, name: 'name.pdf');
  }

  pw.Table table() {
    return pw.Table(
        border: pw.TableBorder.all(color: PdfColor.fromHex("#fof0f0")),
        columnWidths: <int, pw.TableColumnWidth>{
          0: pw.FlexColumnWidth(100),
          1: pw.FlexColumnWidth(100),
          2: pw.FlexColumnWidth(100),
        },
        children: <pw.TableRow>[
          pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColor.fromHex("#009EFB")),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text("yqwfyd",
                      style: fs10Regular, textAlign: pw.TextAlign.left),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text("yqwfyd",
                      style: fs10Regular, textAlign: pw.TextAlign.left),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text("yqwfyd",
                      style: fs10Regular, textAlign: pw.TextAlign.left),
                )
              ]),
        ]);
  }

  /// bold Text
  pw.TextStyle fs24Bold =
      pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold);
  pw.TextStyle fs14Bold =
      pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold);
  pw.TextStyle fs12Bold =
      pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold);
  pw.TextStyle fs10Bold =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold);
  pw.TextStyle fs16Bold =
      pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold);

  // medium text
  pw.TextStyle fs20Bold =
      pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold);

  /// Regular Text
  pw.TextStyle fs14Regular =
      pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.normal);
  pw.TextStyle fs12Regular =
      pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal);
  pw.TextStyle fs10Regular =
      pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal);

  /// ** Colors **
  final green = PdfColor.fromHex("#3F9C00");
  final white = PdfColor.fromHex("#FFFFFF");
  final black = PdfColor.fromHex("#000000");
  final blackLight = PdfColor.fromHex("#B5B5B5");
  final darkBlue = PdfColor.fromHex("#26313A");
  final parmiry = PdfColor.fromHex("#4385AC");

  /// ** Add Spacing **
  pw.SizedBox addHeight(double height) => pw.SizedBox(height: height);
  pw.SizedBox addWidth(double width) => pw.SizedBox(width: width);

  static const double screenHeight = 852;
}
