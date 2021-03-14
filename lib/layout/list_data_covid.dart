import 'package:tga_login/style/color.dart';
import 'package:tga_login/style/text_style.dart';
import 'package:flutter/material.dart';

class ListCovid extends StatefulWidget {
  @override
  _ListCovidState createState() => _ListCovidState();
}

class _ListCovidState extends State<ListCovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, bottom: 15),
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
