import 'package:flutter/material.dart';
import 'package:social_media_ui_app/constants/fonts.dart';

class ShowFonts extends StatefulWidget {

  static final String id ='/sf';

  @override
  _ShowFontsState createState() => _ShowFontsState();
}

class _ShowFontsState extends State<ShowFonts> with persianTextHelper {

  List fonts = [
    kF_Adobe_arabic_shin,
    kF_Adobe_shin_stouts,
    kF_Air_Strip_Arabic,
    kF_Aqlaam_Regular,
    kF_Bareeq_Regular,
    kF_Bedayah_v11,
    kF_B_NAZANIN,
    kF_Dima_Fantasy,
    kF_Far_DastNevis,
    kF_hekayat,
    kF_Nishan_Regular,
    kF_Rawafed_Zainab,
    kF_Sulimany_V2_Bold_Ornamented,
    kF_Sulimany_V2_Bold_Regular,
    kF_Vazir,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, idx) {
        return Column(
          children: <Widget>[
            idx == 0 ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Container(height: 8, color: Colors.black,),
            )
                : Container(),
            Text((idx==2||idx == 11?fixPersianText('سلام چطوری خوبی گل'):'سلام چطوری خوبی گل') + '\n'
//                + '' + '\n'
                + (idx==13|| idx==12 ?'NONE\n':'1234567890' + '\n' )+
                '۱۲۳۴۵۶۷۸۹۰',
              style: TextStyle(fontFamily: fonts[idx], fontSize: 62),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Container(height: 2, color: Colors.black,),
            )
            ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Text('name : \nkF_' + fonts[idx],)),
                  Text('number : \n${idx+1}',textAlign: TextAlign.center,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Container(height: 8, color: Colors.black,),
            )
          ],
        );
      }
        , itemCount: fonts.length,),
    );
  }
}
