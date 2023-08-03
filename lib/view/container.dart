import 'package:flutter/material.dart';
import 'package:untitled6/core/service_locator.dart';
import 'package:untitled6/domain/model/valyuta.dart';
import 'package:untitled6/service/constants/colors.dart';
import 'package:untitled6/service/constants/fonts.dart';
import 'package:untitled6/service/constants/icons.dart';
import 'package:untitled6/service/constants/images.dart';
import 'package:untitled6/service/constants/strings.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  List<Valyuta> list = [];
  late final valyuta;
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  void getAll() async {
    String firstData = firstController.value.text.trim();
    String secondData = secondController.value.text.trim();
    if(firstData.isEmpty || secondData.isEmpty) {
      return;
    }
    list = await repository.fetchAllFlag();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 50, left: 40),
      child: Container(
        width: 320,
        height: 268,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CustomColors.containerColor,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 10),
                  color: CustomColors.dividerColor,
                  blurRadius: 80)
            ]),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      CustomStrings.amount,
                      style: TextStyle(
                          color: CustomColors.textColor, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Image(
                        image: CustomImages.cgd,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        CustomStrings.sgd,
                        style: TextStyle(
                            fontFamily: CustomFonts.roboto,
                            color: CustomColors.circleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                      PopupMenuButton(
                          child: const Image(image: CustomIcons.iconDown, height: 30,),
                          itemBuilder: (context) => [
                            for(int i = 0; i < list.length; i++)
                            PopupMenuItem(child: Text(list[0].ccy)),
                          ]
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        alignment: const Alignment(0.5, 0),
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: CustomColors.containerSmallColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: firstController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 115),
                child: Container(
                  height: 2,
                  width: MediaQuery.sizeOf(context).width,
                  color: CustomColors.dividerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 115, top: 90),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: CustomColors.circleColor,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: CustomIcons.icon,
                      height: 23,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 140,
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        CustomStrings.amount,
                        style: TextStyle(
                            color: CustomColors.textColor, fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Image(
                          image: CustomImages.usd,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          CustomStrings.usd,
                          style: TextStyle(
                              fontFamily: CustomFonts.roboto,
                              color: CustomColors.circleColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                        PopupMenuButton(
                            child: const Image(image: CustomIcons.iconDown, height: 30,),
                            itemBuilder: (context) => [
                              for(int i = 0; i < list.length; i++)
                                PopupMenuItem(child: Text(list.indexOf("Ccy" as Valyuta).toString())),
                            ]
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          alignment: const Alignment(0.5, 0),
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: CustomColors.containerSmallColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: secondController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                            ),
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
