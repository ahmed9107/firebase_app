import 'package:firebase_app/utils/helpers/dimensions.dart';
import 'package:firebase_app/view/widgets/big_text.dart';
import 'package:firebase_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Home Page',
          style: GoogleFonts.roboto(color: Theme.of(context).primaryColorLight)
        ),
        centerTitle: true,
        leading: Container()
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimensions.height45),
              child: Center(child: Image.asset(
                'assets/images/a.png',
                width: Dimensions.width100
              )),
            ),
            SizedBox(height: Dimensions.height25),
            const BigText(text: 'ahmed@gmail.com'),
            SizedBox(height: Dimensions.height25),
            CustomButton(
              onPressed: (){},
              text: 'Sign out'
            )
          ]
        ),
      ),
    );
  }
}