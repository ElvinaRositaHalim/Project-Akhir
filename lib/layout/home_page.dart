import 'package:tga_login/layout/form_inputan_covid.dart';
import 'package:tga_login/model/charts_modeling.dart';
import 'package:tga_login/style/color.dart';
import 'package:tga_login/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime time = DateTime.now();
  static List<charts.Series<OrdinalSales, String>> data() {
    final data = [
      new OrdinalSales('Sembuh', 5),
      new OrdinalSales('Meninggal', 100),
      new OrdinalSales('Rawat', 5),
      new OrdinalSales('Discarded', 25),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormCovid()));
        },
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 170,
                margin: EdgeInsets.only(top: 60, left: 15, right: 15),
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rumah Sakit Umum",
                          style: white20TextStyle,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: whiteColor,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "${time.day} ${time.month} ${time.year}",
                        style: white25TextStyle,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 200, child: SimpleBarChart(data())),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 15),
                            child: Text(
                              "List Covid",
                              style: textStyleBold,
                            ),
                          ),
                          itemCovid("Antono", "20/2/2020"),
                          itemCovid("Antono", "20/2/2020"),
                          itemCovid("Antono", "20/2/2020"),
                          itemCovid("Antono", "20/2/2020"),
                          itemCovid("Antono", "20/2/2020"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container itemCovid(String nama, String tanggal) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: whiteColor, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(3, 3)),
      ]),
      child: ListTile(
        title: Text(
          nama,
          style: textStyle,
        ),
        subtitle: Text(
          "Tgl Diagnosa " + tanggal,
          style: textStyleGrey,
        ),
        trailing: Column(
          children: [
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.edit,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
