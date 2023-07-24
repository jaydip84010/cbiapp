import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "My Flutter Project";
  String subtitle = "hi this is pdf viwer demo";
  final tableData = [
    ['Description', 'Excl Vat', 'Vat', 'Incl Vat'],
    ['Transfer Attorney Fees', '\$100', '\$20', '\$120'],
    ['Postages And Petties', '\$50', '\$10', '\$60'],
    ['Deeds Office Fees', '\$200', '\$40', '\$240'],
    ['Electronic Generation Fee', '\$30', '\$6', '\$36'],
    ['Fica Registration Fee', '\$40', '\$8', '\$48'],
    ['Rates Clearance Fee', '\$80', '\$16', '\$96'],
    ['Transfer Duty', '\$150', '\$30', '\$180'],
    ['Transfer Duty Receipt Fee', '\$20', '\$4', '\$24'],
    ['Deeds Office Search Fee', '\$10', '\$2', '\$12'],
    ['Total', '\$680', '\$136', '\$816'],
  ];

  // Calculate Total
  double totalExclVat = 0;
  double totalVat = 0;
  double totalInclVat = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 60,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    makepdf();
                  },
                  child: Center(
                    child: Text(
                      'Generate pdf',
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> makepdf() async {
    final pdf = pw.Document();
    final Directory? directory = await getTemporaryDirectory();
    print(directory);
    File file = File("${directory?.path}/demo.pdf");
    final ByteData header =
        await rootBundle.load('assets/images/cbiheader.png');
    final ByteData footer =
        await rootBundle.load('assets/images/cbi footer.png');
    final Uint8List cheader = header.buffer.asUint8List();
    final Uint8List cfooter = footer.buffer.asUint8List();
    for (int i = 1; i < tableData.length; i++) {
      totalExclVat += double.parse(tableData[i][1].substring(1));
      totalVat += double.parse(tableData[i][2].substring(1));
      totalInclVat += double.parse(tableData[i][3].substring(1));
    }
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Image(pw.MemoryImage(cheader),
                  height: 100, width: 450, fit: pw.BoxFit.fill),
              pw.SizedBox(height: 10),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Column(children: [
                  pw.Text('PURCHASE PRICE :1,20,000.00',
                      style: pw.TextStyle(
                        fontSize: 8,
                      )),
                  pw.Text('DATE CREATED :8/22/2022 11:20:05 AM',
                      style: pw.TextStyle(
                        fontSize: 8,
                      )),
                  pw.Text('TO:Evette@bassoninc.co.za',
                      style: pw.TextStyle(
                        fontSize: 8,
                      ))
                ])
              ]),
              pw.Center(
                child: pw.Container(
                  padding: pw.EdgeInsets.all(20),
                  child: pw.Table(
                    border: pw.TableBorder.all(
                      width: 0.5,
                    ),
                    defaultColumnWidth: pw.IntrinsicColumnWidth(),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.all(5),
                            child: pw.Text(
                              tableData[0][0],
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 8,
                              ),
                            ),
                          ),
                          for (int i = 1; i < tableData[0].length; i++)
                            pw.Padding(
                              padding: pw.EdgeInsets.all(5),
                              child: pw.Text(
                                tableData[0][i],
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 8,
                                ),
                                textAlign: pw.TextAlign.right,
                              ),
                            ),
                        ],
                      ),
                      for (int i = 1; i < tableData.length - 1; i++)
                        pw.TableRow(
                          children: [
                            pw.Padding(
                              padding: pw.EdgeInsets.all(5),
                              child: pw.Text(
                                tableData[i][0],
                                style: pw.TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                            ),
                            for (int j = 1; j < tableData[i].length; j++)
                              pw.Padding(
                                padding: pw.EdgeInsets.all(5),
                                child: pw.Text(
                                  tableData[i][j],
                                  style: pw.TextStyle(
                                    fontSize: 8,
                                  ),
                                  textAlign: pw.TextAlign.right,
                                ),
                              ),
                          ],
                          decoration: pw.BoxDecoration(
                            color: (i % 2 == 0)
                                ? PdfColors.grey200
                                : PdfColors.white,
                          ),
                        ),
                      pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.all(5),
                            child: pw.Text(
                              tableData.last[0],
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 8,
                                color: PdfColors.white,
                              ),
                            ),
                          ),
                          for (int i = 1; i < tableData.last.length; i++)
                            pw.Padding(
                              padding: pw.EdgeInsets.all(5),
                              child: pw.Text(
                                tableData.last[i],
                                style: pw.TextStyle(
                                  fontSize: 8,
                                  color: PdfColors.white,
                                ),
                                textAlign: pw.TextAlign.right,
                              ),
                            ),
                        ],
                        decoration: pw.BoxDecoration(color: PdfColors.red),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Image(pw.MemoryImage(cfooter),
                  height: 200, width: 500, fit: pw.BoxFit.fill)
            ]);
      },
    ));

    await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }
}
