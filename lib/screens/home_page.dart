import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:untitled6/core/service_locator.dart';
import 'package:untitled6/domain/model/valyuta.dart';
import 'package:untitled6/service/constants/colors.dart';
import 'package:untitled6/service/constants/fonts.dart';
import 'package:untitled6/service/constants/strings.dart';
import 'package:untitled6/view/container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Valyuta> valyutas = [];
  bool check = false;


  void getAllData() async {
    valyutas = await repository.fetchAll();
    log("====$valyutas=====");
    setState(() {});
  }



  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 30),
            child: Text(
              CustomStrings.currency,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: CustomFonts.roboto,
                  color: CustomColors.darkBlue),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 37),
            child: Text(
              CustomStrings.check,
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: CustomFonts.roboto,
                  color: CustomColors.textColor),
            ),
          ),

          /// #Card
          CustomContainer(),

          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 65),
                child: Text(
                  CustomStrings.indicative,
                  style: TextStyle(fontSize: 18, color: CustomColors.textColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 93, top: 20),
                child: Text(
                  CustomStrings.oneSgd,
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.black,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
