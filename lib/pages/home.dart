// ignore_for_file: avoid_print, avoid_web_libraries_in_flutter, must_be_immutable

import 'dart:async';

import 'package:abdulla_nasar_portfolio/main.dart';
import 'package:abdulla_nasar_portfolio/pages/widget/hover.dart';
import 'package:abdulla_nasar_portfolio/utils/hex_color.dart';
import 'package:abdulla_nasar_portfolio/utils/quotes.dart';
import 'package:abdulla_nasar_portfolio/utils/reusable_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget buildListItem(String label, String value) {
  return ListTile(
    title: Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(value),
  );
}

List<Widget> myItems = [
  buildListItem('Name', 'Abdulla Nasar'),
  buildListItem('Age', '21'),
  buildListItem('Designation', 'Flutter Developer'),
  buildListItem('Phone', '+91 9207147500'),
  buildListItem('Email', 'abdullansr.connect@gmail.com'),
  buildListItem('Location', 'Bengaluru (Currently), Karnataka, India'),
];

const pdfPath = 'assets/abd.pdf';

final assetUrl = html.window.location.href + pdfPath;

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  bool isFlipped = false;
  late AnimationController controller;
  Color textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _updateTextColor();
    });
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _updateTextColor() {
    setState(() {
      textColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  void flipContainer() {
    setState(() {
      isFlipped = !isFlipped;
    });

    Future.delayed(const Duration(milliseconds: 10), () {
      if (controller.isDismissed) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("AFEE85"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1440) {
            return buildDesktopLayout();
          } else if (constraints.maxWidth >= 1024) {
            return buildDesktopLayout1();
          } else if (constraints.maxWidth >= 768) {
            return buildTabletLayout();
          } else if (constraints.maxWidth >= 425) {
            return buildMobileLayout();
          } else if (constraints.maxWidth >= 375) {
            return buildMobileLayout1();
          } else {
            return buildMobileLayout2();
          }
        },
      ),
    );

    //     Scaffold(
    //   backgroundColor: HexColor("AFEE85"),
    //   body: ResponsiveBuilder(
    //     builder: (context, constraints) {
    //       return ListView(
    //         padding: const EdgeInsets.only(top: 150),
    //         children: [
    //           Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50),
    //             child: Column(
    //               children: [
    //                 Hero(
    //                   tag: 'animatedContainer',
    //                   child: Visibility(
    //                     visible: !isFlipped,
    //                     child: AnimatedBuilder(
    //                       animation: controller,
    //                       builder: (context, child) {
    //                         double angle = math.pi * controller.value * 2;
    //                         return Transform(
    //                           transform: Matrix4.identity()
    //                             ..setEntry(3, 2, 0.00001)
    //                             ..rotateY(angle),
    //                           alignment: Alignment.center,
    //                           child: Container(
    //                             decoration: BoxDecoration(
    //                               gradient: LinearGradient(
    //                                 colors: [
    //                                   Colors.white,
    //                                   Colors.green.shade400.withOpacity(0.2),
    //                                   Colors.white,
    //                                 ],
    //                                 begin: Alignment.topLeft,
    //                                 end: Alignment.bottomRight,
    //                               ),
    //                               borderRadius: BorderRadius.circular(30),
    //                             ),
    //                             child: Padding(
    //                               padding: const EdgeInsets.symmetric(
    //                                 horizontal: 40.0,
    //                                 vertical: 20,
    //                               ),
    //                               child: Column(
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceEvenly,
    //                                     children: [
    //                                       Padding(
    //                                         padding: const EdgeInsets.symmetric(
    //                                             horizontal: 10.0),
    //                                         child: Text(
    //                                           "Abdulla Nasar",
    //                                           style: TextStyle(
    //                                             fontSize: 50,
    //                                             fontWeight: FontWeight.bold,
    //                                             fontFamily: "Praise",
    //                                             color: textColor,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       Expanded(
    //                                         child: Row(
    //                                           mainAxisAlignment:
    //                                               MainAxisAlignment.end,
    //                                           children: List.generate(
    //                                             socialMedia.length,
    //                                             (index) => Padding(
    //                                               padding: const EdgeInsets
    //                                                   .symmetric(
    //                                                   horizontal: 15.0),
    //                                               child: HoverZoomWidget(
    //                                                 imagePath:
    //                                                     socialMedia[index],
    //                                                 onTap: () {
    //                                                   index == 0
    //                                                       ? launchInstagram()
    //                                                       : index == 1
    //                                                           ? launchLinkedIn()
    //                                                           : launchGitHub();
    //                                                 },
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   SizedBox(
    //                                     height:
    //                                         MediaQuery.of(context).size.height /
    //                                             9,
    //                                   ),
    //                                   Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     children: [
    //                                       Column(
    //                                         crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                         children: [
    //                                           AnimatedTextKit(
    //                                             animatedTexts:
    //                                                 messages.map((message) {
    //                                               return TypewriterAnimatedText(
    //                                                 message,
    //                                                 textStyle: const TextStyle(
    //                                                   fontSize: 32.0,
    //                                                   fontWeight:
    //                                                       FontWeight.bold,
    //                                                 ),
    //                                                 speed: const Duration(
    //                                                     milliseconds: 200),
    //                                               );
    //                                             }).toList(),
    //                                             totalRepeatCount: 4,
    //                                             pause: const Duration(
    //                                                 milliseconds: 200),
    //                                             displayFullTextOnTap: true,
    //                                             stopPauseOnTap: true,
    //                                           ),
    //                                           text(
    //                                             giveText: "Flutter Developer",
    //                                             fontsize: 25,
    //                                             fontweight: FontWeight.bold,
    //                                             textColor: Colors.black,
    //                                           ),
    //                                           SizedBox(
    //                                             height: MediaQuery.of(context)
    //                                                     .size
    //                                                     .height /
    //                                                 20,
    //                                           ),
    //                                           text(
    //                                             giveText:
    //                                                 """I'm an experienced Flutter developer with a year of expertise.
    //     I've excelled in diverse projects, including e-commerce,
    //     job portals,and teaching apps.Proficient in Flutter,
    //     Dart, UI/UX design, and API integration, I ensure
    //     efficient project management with expertise in
    //     state management using GetX and Provider. """,
    //                                             maxLine: 6,
    //                                             fontsize: 20,
    //                                             fontweight: FontWeight.w400,
    //                                             textColor: Colors.black,
    //                                           ),
    //                                           SizedBox(
    //                                             height: MediaQuery.of(context)
    //                                                     .size
    //                                                     .height /
    //                                                 50,
    //                                           ),
    //                                           Row(
    //                                             children: [
    //                                               RawMaterialButton(
    //                                                 onPressed: () {
    //                                                   downloadPdf();
    //                                                 },
    //                                                 child: Container(
    //                                                   decoration: BoxDecoration(
    //                                                     color: Colors.black,
    //                                                     borderRadius:
    //                                                         BorderRadius
    //                                                             .circular(30),
    //                                                   ),
    //                                                   child: Padding(
    //                                                     padding:
    //                                                         const EdgeInsets
    //                                                             .all(10.0),
    //                                                     child: text(
    //                                                       giveText:
    //                                                           "Download CV",
    //                                                       fontsize: 20,
    //                                                       fontweight:
    //                                                           FontWeight.w400,
    //                                                       textColor:
    //                                                           Colors.white,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const SizedBox(
    //                                                 width: 50,
    //                                               ),
    //                                               RawMaterialButton(
    //                                                 hoverElevation: 20,
    //                                                 onPressed: () {
    //                                                   flipContainer();
    //                                                 },
    //                                                 child: MouseRegion(
    //                                                   onEnter: (_) {
    //                                                     setState(() {
    //                                                       isHovered = true;
    //                                                     });
    //                                                   },
    //                                                   onExit: (_) {
    //                                                     setState(() {
    //                                                       isHovered = false;
    //                                                     });
    //                                                   },
    //                                                   child: Container(
    //                                                     decoration:
    //                                                         BoxDecoration(
    //                                                       border: Border.all(
    //                                                           color:
    //                                                               Colors.black,
    //                                                           width: 2),
    //                                                       color: isHovered
    //                                                           ? HexColor(
    //                                                               "AFEE85")
    //                                                           : Colors.white,
    //                                                       borderRadius:
    //                                                           BorderRadius
    //                                                               .circular(30),
    //                                                     ),
    //                                                     child: Padding(
    //                                                       padding:
    //                                                           const EdgeInsets
    //                                                               .all(10.0),
    //                                                       child: text(
    //                                                         giveText:
    //                                                             "Know more",
    //                                                         fontsize: 20,
    //                                                         fontweight:
    //                                                             FontWeight.w400,
    //                                                         textColor:
    //                                                             Colors.black,
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                       Image.asset(
    //                                         "assets/image/photo.png",
    //                                         // fit: BoxFit.cover,
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                 ),
    //                 // Back Container (Different content)
    // BackContainer(
    //   isFlipped: isFlipped,
    //   controller: controller,
    //   textColor: textColor,
    //   launchInstagram: launchInstagram,
    //   launchLinkedIn: launchLinkedIn,
    //   launchGitHub: launchGitHub,
    //   listItemWidgets: myItems,
    //   downloadPdf: downloadPdf,
    //   flipContainer: flipContainer,
    // )
    //               ],
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );
  }

  Widget buildDesktopLayout() {
    return ListView(
      padding: const EdgeInsets.only(top: 150),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidget(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 25,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        text(
                                          giveText:
                                              """I'm an experienced Flutter developer with a year of expertise.
I've excelled in diverse projects, including e-commerce,
job portals,and teaching apps.Proficient in Flutter,
Dart, UI/UX design, and API integration, I ensure
efficient project management with expertise in
state management using GetX and Provider. """,
                                          maxLine: 6,
                                          fontsize: 20,
                                          fontweight: FontWeight.w400,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 20,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      "assets/image/photo.png",
                                      // fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDesktopLayout1() {
    return ListView(
      padding: const EdgeInsets.only(top: 150),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidget(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 25,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        text(
                                          giveText:
                                              """I'm an experienced Flutter developer with a year
of expertise.I've excelled in diverse projects,
including e-commerce,job portals,and teaching apps.
Proficient in Flutter,Dart, UI/UX design,
and API integration, I ensureefficient 
project management with expertise in 
state management using GetX and Provider. """,
                                          maxLine: 6,
                                          fontsize: 18,
                                          fontweight: FontWeight.w400,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 20,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: Image.asset(
                                        "assets/image/photo.png",
                                        // fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSmallDesktopLayout() {
    return ListView(
      padding: const EdgeInsets.only(top: 100),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidget(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 25,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        text(
                                          giveText:
                                              """I'm an experienced Flutter developer with a year of expertise.
I've excelled in diverse projects, including e-commerce,
job portals,and teaching apps.Proficient in Flutter,
Dart, UI/UX design, and API integration, I ensure
efficient project management with expertise in
state management using GetX and Provider. """,
                                          maxLine: 6,
                                          fontsize: 20,
                                          fontweight: FontWeight.w400,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 20,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 20,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      "assets/image/photo.png",
                                      // fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTabletLayout() {
    return ListView(
      padding: const EdgeInsets.only(top: 100),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidget(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 20,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        text(
                                          giveText:
                                              """I'm an experienced Flutter developer 
with a year of expertise.I've excelled
 in diverse projects, including e-commerce,
job portals,and teaching apps.Proficient 
in Flutter,Dart, UI/UX design, and 
API integration, I ensure efficient
project management with expertise in
state management using GetX and Provider. """,
                                          maxLine: 10,
                                          fontsize: 16,
                                          fontweight: FontWeight.w300,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 16,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 16,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: Image.asset(
                                        "assets/image/photo.png",
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobileLayout() {
    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidgetForMobile(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 16,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        SizedBox(
                                          height: 300,
                                          width: 300,
                                          child: Image.asset(
                                            "assets/image/photo.png",
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        text(
                                          giveText:
                                              """I'm an experienced Flutter developer
with a year of expertise.I've excelled
in diverse projects, including e-commerce,
job portals,and teaching apps.Proficient 
in Flutter,Dart, UI/UX design, and
API integration, I ensureefficient 
project managementwith expertise in 
state management usingGetX and Provider. """,
                                          maxLine: 10,
                                          fontsize: 16,
                                          fontweight: FontWeight.w400,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 16,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 16,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobileLayout1() {
    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidgetForMobile(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 14,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        SizedBox(
                                          height: 300,
                                          child: Image.asset(
                                            "assets/image/photo.png",
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        text(
                                          giveText:
                                              """I'm an experienced Flutter developer
with a year of expertise.
I've excelled in diverse
 projects, including e-commerce,
job portals,and teaching apps.
Proficient in Flutter,Dart, 
UI/UX design, and API integration, 
I ensureefficient project management
with expertise instate management using
GetX and Provider. """,
                                          maxLine: 10,
                                          fontsize: 15.9,
                                          fontweight: FontWeight.w400,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 16,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 16,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobileLayout2() {
    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Hero(
                tag: 'animatedContainer',
                child: Visibility(
                  visible: isFlipped,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double angle = math.pi * controller.value * 2;
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00001)
                          ..rotateY(angle),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.green.shade400.withOpacity(0.2),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Abdulla Nasar",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Praise",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          socialMedia.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: HoverZoomWidgetForMobilevery(
                                              imagePath: socialMedia[index],
                                              onTap: () {
                                                index == 0
                                                    ? launchInstagram()
                                                    : index == 1
                                                        ? launchLinkedIn()
                                                        : launchGitHub();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts:
                                              messages.map((message) {
                                            return TypewriterAnimatedText(
                                              message,
                                              textStyle: const TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            );
                                          }).toList(),
                                          totalRepeatCount: 4,
                                          pause:
                                              const Duration(milliseconds: 200),
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        text(
                                          giveText: "Flutter Developer",
                                          fontsize: 12,
                                          fontweight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                        ),
                                        SizedBox(
                                          height: 250,
                                          child: Image.asset(
                                            "assets/image/photo.png",
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        text(
                                          giveText: """I'm an experienced 
Flutter developerwith a
year of expertise.I've 
excelled in diverse projects,
including e-commerce, job 
portals and teaching apps.
Proficient in Flutter,Dart, 
UI/UX design, and 
API integration, I ensure 
efficient project management
with expertise in state management
using GetX and Provider. """,
                                          maxLine: 14,
                                          fontsize: 14,
                                          fontweight: FontWeight.w400,
                                          textColor: Colors.black,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        Row(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                downloadPdf();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: text(
                                                    giveText: "Download CV",
                                                    fontsize: 16,
                                                    fontweight: FontWeight.w400,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            RawMaterialButton(
                                              hoverElevation: 20,
                                              onPressed: () {
                                                flipContainer();
                                              },
                                              child: MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHovered = false;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2),
                                                    color: isHovered
                                                        ? HexColor("AFEE85")
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: text(
                                                      giveText: "Know more",
                                                      fontsize: 16,
                                                      fontweight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Back Container (Different content)
              BackContainer(
                isFlipped: isFlipped,
                controller: controller,
                textColor: textColor,
                launchInstagram: launchInstagram,
                launchLinkedIn: launchLinkedIn,
                launchGitHub: launchGitHub,
                listItemWidgets: myItems,
                downloadPdf: downloadPdf,
                flipContainer: flipContainer,
              )
            ],
          ),
        ),
      ],
    );
  }
}

void downloadPdf() async {
  final assetUrl = html.window.location.href + pdfPath;

  if (await canLaunchUrl(Uri.parse(assetUrl))) {
    await launchUrl(Uri.parse(assetUrl));
  } else {
    print('Could not launch $assetUrl');
  }
}

void launchInstagram() async {
  String instagramUrl = 'https://www.instagram.com/abdns._r/';
  launchUrl(Uri.parse(instagramUrl));
}

void launchLinkedIn() async {
  String linkedIn = 'https://www.linkedin.com/in/abdullanasarap/';
  launchUrl(Uri.parse(linkedIn));
}

void launchGitHub() async {
  String gitHub = 'https://github.com/AbdullaNasarAp';
  launchUrl(Uri.parse(gitHub));
}

class CustomSkillContainer extends StatelessWidget {
  final Skill skill;

  const CustomSkillContainer({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: text(
        giveText: skill.name,
        textAlignment: TextAlign.center,
        textColor: Colors.white,
        fontweight: FontWeight.w400,
      ),
    );
  }
}

class SkillProgressBar extends StatelessWidget {
  final Skill skill;
  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final Color borderColor;
  final Color progressColor;
  final Color headingColor;

  const SkillProgressBar({
    super.key,
    required this.skill,
    required this.containerWidth,
    required this.containerHeight,
    required this.borderRadius,
    required this.borderColor,
    required this.progressColor,
    required this.headingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          skill.name,
          style: TextStyle(
            color: headingColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor,
              width: 1.0,
            ),
          ),
          child: CustomPaint(
            painter: ProgressBarPainter(skill.progress, progressColor, 30),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final double borderRadius; // Added parameter for border radius

  ProgressBarPainter(this.progress, this.progressColor, this.borderRadius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;

    double progressBarWidth = size.width * progress;

    // Use a rounded rectangle instead of a regular rectangle
    RRect roundedRect = RRect.fromLTRBR(
        0, 0, progressBarWidth, size.height, Radius.circular(borderRadius));

    canvas.drawRRect(roundedRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BackContainer extends StatefulWidget {
  BackContainer({
    super.key,
    required this.isFlipped,
    required this.controller,
    required this.textColor,
    required this.launchInstagram,
    required this.launchLinkedIn,
    required this.launchGitHub,
    required this.downloadPdf,
    required this.flipContainer,
    required this.listItemWidgets,
  });
  final bool isFlipped;
  final AnimationController controller;
  final Color textColor;
  final Function launchInstagram;
  final Function launchLinkedIn;
  final Function launchGitHub;
  final Function downloadPdf;
  final Function flipContainer;
  bool isHovered = false;
  final List<Widget> listItemWidgets;
  @override
  State<BackContainer> createState() => _BackContainerState();
}

final List<Skill> skills = [
  Skill(name: "Flutter", progress: 0.8),
  Skill(name: "Dart", progress: 0.7),
  Skill(name: "C Programming", progress: 0.4),
  Skill(name: "HTML/CSS", progress: 0.3),
  Skill(name: "GraphQL", progress: 0.2),
  Skill(name: "Firebase", progress: 0.8),
  Skill(name: "Hasura", progress: 0.7),
];
final List<Skill> tools = [
  Skill(name: "UI/UX", progress: 0.8),
  Skill(name: "Git", progress: 0.6),
  Skill(name: "Figma", progress: 0.7),
  Skill(name: "VsCode", progress: 0.9),
  Skill(name: "Android Studio", progress: 0.7),
];
final List<Skill> otherskills = [
  Skill(name: "Punctuality", progress: 0.0),
  Skill(name: "Flexibility", progress: 0.0),
  Skill(name: "Time Management", progress: 0.0),
  Skill(name: "Work Ethics", progress: 0.0),
  Skill(name: "Team Work", progress: 0.0),
  Skill(name: "Problem Solving", progress: 0.0),
  Skill(name: "Creativity", progress: 0.0),
  Skill(name: "Design", progress: 0.0),
];

class _BackContainerState extends State<BackContainer> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !widget.isFlipped,
      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double angle = math.pi * widget.controller.value * 2;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.00001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 1440) {
                  return buildDesktopLayout();
                } else if (constraints.maxWidth >= 1024) {
                  return buildDesktopLayout1();
                } else if (constraints.maxWidth >= 768) {
                  return buildTabletLayout();
                } else if (constraints.maxWidth >= 425) {
                  return buildMobileLayout();
                } else if (constraints.maxWidth >= 375) {
                  return buildMobileLayout1();
                } else {
                  return buildMobileLayout2();
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildDesktopLayout() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade400.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Abdulla Nasar",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Praise",
                      color: widget.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      socialMedia.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: HoverZoomWidget(
                            imagePath: socialMedia[index],
                            onTap: () {
                              index == 0
                                  ? widget.launchInstagram()
                                  : index == 1
                                      ? widget.launchLinkedIn()
                                      : widget.launchGitHub();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "About Me",
                              fontsize: 40,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                height: 400,
                                width: 500,
                                child: ListView(
                                    shrinkWrap: true,
                                    children: widget.listItemWidgets),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "Technical",
                              fontsize: 40,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: skills.map((skill) {
                                return HoverZoom(
                                  hover: SkillProgressBar(
                                    skill: skill,
                                    containerWidth: 200.0,
                                    containerHeight: 10.0,
                                    borderRadius: 30.0,
                                    borderColor: Colors.black,
                                    progressColor: Colors.blue,
                                    headingColor: Colors.black,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "",
                              fontsize: 40,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Column(
                              children: tools.map((skill) {
                                return HoverZoom(
                                  hover: SkillProgressBar(
                                    skill: skill,
                                    containerWidth: 200.0,
                                    containerHeight: 10.0,
                                    borderRadius: 30.0,
                                    borderColor: Colors.black,
                                    progressColor: Colors.blue,
                                    headingColor: Colors.black,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "Other",
                              fontsize: 40,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 400,
                                width: 240,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: otherskills.map((skill) {
                                      return HoverZoom(
                                        hover:
                                            CustomSkillContainer(skill: skill),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                              width: 240,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: AnimatedQuoteList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            widget.downloadPdf();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: text(
                                giveText: "Download CV",
                                fontsize: 20,
                                fontweight: FontWeight.w400,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        RawMaterialButton(
                          hoverElevation: 20,
                          onPressed: () {
                            widget.flipContainer();
                          },
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                widget.isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                widget.isHovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: widget.isHovered
                                    ? HexColor("AFEE85")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: text(
                                  giveText: "Go Back",
                                  fontsize: 20,
                                  fontweight: FontWeight.w400,
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopLayout1() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade400.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Abdulla Nasar",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Praise",
                      color: widget.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      socialMedia.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: HoverZoomWidget(
                            imagePath: socialMedia[index],
                            onTap: () {
                              index == 0
                                  ? widget.launchInstagram()
                                  : index == 1
                                      ? widget.launchLinkedIn()
                                      : widget.launchGitHub();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "About Me",
                              fontsize: 32,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                height: 400,
                                width: 250,
                                child: ListView(
                                    shrinkWrap: true,
                                    children: widget.listItemWidgets),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "Technical",
                              fontsize: 32,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: skills.map((skill) {
                                return HoverZoom(
                                  hover: SkillProgressBar(
                                    skill: skill,
                                    containerWidth: 180.0,
                                    containerHeight: 10.0,
                                    borderRadius: 30.0,
                                    borderColor: Colors.black,
                                    progressColor: Colors.blue,
                                    headingColor: Colors.black,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "",
                              fontsize: 32,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Column(
                              children: tools.map((skill) {
                                return HoverZoom(
                                  hover: SkillProgressBar(
                                    skill: skill,
                                    containerWidth: 180.0,
                                    containerHeight: 10.0,
                                    borderRadius: 30.0,
                                    borderColor: Colors.black,
                                    progressColor: Colors.blue,
                                    headingColor: Colors.black,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "Other",
                              fontsize: 32,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 400,
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: otherskills.map((skill) {
                                      return HoverZoom(
                                        hover:
                                            CustomSkillContainer(skill: skill),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 150,
                              width: 180,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: AnimatedQuoteList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            widget.downloadPdf();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: text(
                                giveText: "Download CV",
                                fontsize: 20,
                                fontweight: FontWeight.w400,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        RawMaterialButton(
                          hoverElevation: 20,
                          onPressed: () {
                            widget.flipContainer();
                          },
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                widget.isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                widget.isHovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: widget.isHovered
                                    ? HexColor("AFEE85")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: text(
                                  giveText: "Go Back",
                                  fontsize: 20,
                                  fontweight: FontWeight.w400,
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabletLayout() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade400.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Abdulla Nasar",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Praise",
                      color: widget.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      socialMedia.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: HoverZoomWidget(
                            imagePath: socialMedia[index],
                            onTap: () {
                              index == 0
                                  ? widget.launchInstagram()
                                  : index == 1
                                      ? widget.launchLinkedIn()
                                      : widget.launchGitHub();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    giveText: "About Me",
                                    fontsize: 32,
                                    fontweight: FontWeight.bold,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 500,
                                    width: 180,
                                    child: ListView(
                                        shrinkWrap: true,
                                        children: widget.listItemWidgets),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                giveText: "Technical",
                                fontsize: 32,
                                fontweight: FontWeight.bold,
                                textColor: Colors.black,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: skills.map((skill) {
                                  return HoverZoom(
                                    hover: SkillProgressBar(
                                      skill: skill,
                                      containerWidth: 160.0,
                                      containerHeight: 10.0,
                                      borderRadius: 30.0,
                                      borderColor: Colors.black,
                                      progressColor: Colors.blue,
                                      headingColor: Colors.black,
                                    ),
                                  );
                                }).toList(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    giveText: "Other",
                                    fontsize: 32,
                                    fontweight: FontWeight.bold,
                                    textColor: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 400,
                                      width: 160,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Wrap(
                                          spacing: 8.0,
                                          runSpacing: 8.0,
                                          children: otherskills.map((skill) {
                                            return HoverZoom(
                                              hover: CustomSkillContainer(
                                                  skill: skill),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              giveText: "",
                              fontsize: 32,
                              fontweight: FontWeight.bold,
                              textColor: Colors.black,
                            ),
                            Column(
                              children: tools.map((skill) {
                                return HoverZoom(
                                  hover: SkillProgressBar(
                                    skill: skill,
                                    containerWidth: 160.0,
                                    containerHeight: 10.0,
                                    borderRadius: 30.0,
                                    borderColor: Colors.black,
                                    progressColor: Colors.blue,
                                    headingColor: Colors.black,
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                            const SizedBox(
                              height: 199,
                              width: 160,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: AnimatedQuoteList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            widget.downloadPdf();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: text(
                                giveText: "Download CV",
                                fontsize: 20,
                                fontweight: FontWeight.w400,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        RawMaterialButton(
                          hoverElevation: 20,
                          onPressed: () {
                            widget.flipContainer();
                          },
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                widget.isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                widget.isHovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: widget.isHovered
                                    ? HexColor("AFEE85")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: text(
                                  giveText: "Go Back",
                                  fontsize: 20,
                                  fontweight: FontWeight.w400,
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade400.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Abdulla Nasar",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Praise",
                      color: widget.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      socialMedia.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: HoverZoomWidgetForMobile(
                            imagePath: socialMedia[index],
                            onTap: () {
                              index == 0
                                  ? widget.launchInstagram()
                                  : index == 1
                                      ? widget.launchLinkedIn()
                                      : widget.launchGitHub();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    giveText: "About Me",
                                    fontsize: 25,
                                    fontweight: FontWeight.bold,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 500,
                                    width: 150,
                                    child: ListView(
                                        shrinkWrap: true,
                                        children: widget.listItemWidgets),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(
                                        giveText: "Technical",
                                        fontsize: 25,
                                        fontweight: FontWeight.bold,
                                        textColor: Colors.black,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: skills.map((skill) {
                                          return HoverZoom(
                                            hover: SkillProgressBar(
                                              skill: skill,
                                              containerWidth: 130.0,
                                              containerHeight: 10.0,
                                              borderRadius: 30.0,
                                              borderColor: Colors.black,
                                              progressColor: Colors.blue,
                                              headingColor: Colors.black,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text(
                                            giveText: "",
                                            fontsize: 25,
                                            fontweight: FontWeight.bold,
                                            textColor: Colors.black,
                                          ),
                                          Column(
                                            children: tools.map((skill) {
                                              return HoverZoom(
                                                hover: SkillProgressBar(
                                                  skill: skill,
                                                  containerWidth: 130.0,
                                                  containerHeight: 10.0,
                                                  borderRadius: 30.0,
                                                  borderColor: Colors.black,
                                                  progressColor: Colors.blue,
                                                  headingColor: Colors.black,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text(
                                            giveText: "Other",
                                            fontsize: 25,
                                            fontweight: FontWeight.bold,
                                            textColor: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 400,
                                              width: 120,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Wrap(
                                                  spacing: 8.0,
                                                  runSpacing: 8.0,
                                                  children:
                                                      otherskills.map((skill) {
                                                    return HoverZoom(
                                                      hover:
                                                          CustomSkillContainer(
                                                              skill: skill),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 250,
                                            width: 140,
                                            child: AnimatedQuoteList(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            widget.downloadPdf();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: text(
                                giveText: "Download CV",
                                fontsize: 20,
                                fontweight: FontWeight.w400,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        RawMaterialButton(
                          hoverElevation: 20,
                          onPressed: () {
                            widget.flipContainer();
                          },
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                widget.isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                widget.isHovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: widget.isHovered
                                    ? HexColor("AFEE85")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: text(
                                  giveText: "Go Back",
                                  fontsize: 20,
                                  fontweight: FontWeight.w400,
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout1() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade400.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Abdulla Nasar",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Praise",
                      color: widget.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      socialMedia.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: HoverZoomWidgetForMobilevery(
                            imagePath: socialMedia[index],
                            onTap: () {
                              index == 0
                                  ? widget.launchInstagram()
                                  : index == 1
                                      ? widget.launchLinkedIn()
                                      : widget.launchGitHub();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    giveText: "About Me",
                                    fontsize: 25,
                                    fontweight: FontWeight.bold,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 500,
                                    width: 150,
                                    child: ListView(
                                        shrinkWrap: true,
                                        children: widget.listItemWidgets),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(
                                        giveText: "Technical",
                                        fontsize: 25,
                                        fontweight: FontWeight.bold,
                                        textColor: Colors.black,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: skills.map((skill) {
                                          return HoverZoom(
                                            hover: SkillProgressBar(
                                              skill: skill,
                                              containerWidth: 130.0,
                                              containerHeight: 10.0,
                                              borderRadius: 30.0,
                                              borderColor: Colors.black,
                                              progressColor: Colors.blue,
                                              headingColor: Colors.black,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text(
                                            giveText: "",
                                            fontsize: 25,
                                            fontweight: FontWeight.bold,
                                            textColor: Colors.black,
                                          ),
                                          Column(
                                            children: tools.map((skill) {
                                              return HoverZoom(
                                                hover: SkillProgressBar(
                                                  skill: skill,
                                                  containerWidth: 130.0,
                                                  containerHeight: 10.0,
                                                  borderRadius: 30.0,
                                                  borderColor: Colors.black,
                                                  progressColor: Colors.blue,
                                                  headingColor: Colors.black,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text(
                                            giveText: "Other",
                                            fontsize: 25,
                                            fontweight: FontWeight.bold,
                                            textColor: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 400,
                                              width: 120,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Wrap(
                                                  spacing: 8.0,
                                                  runSpacing: 8.0,
                                                  children:
                                                      otherskills.map((skill) {
                                                    return HoverZoom(
                                                      hover:
                                                          CustomSkillContainer(
                                                              skill: skill),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 250,
                                            width: 140,
                                            child: AnimatedQuoteList(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            widget.downloadPdf();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: text(
                                giveText: "Download CV",
                                fontsize: 20,
                                fontweight: FontWeight.w400,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        RawMaterialButton(
                          hoverElevation: 20,
                          onPressed: () {
                            widget.flipContainer();
                          },
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                widget.isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                widget.isHovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: widget.isHovered
                                    ? HexColor("AFEE85")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: text(
                                  giveText: "Go Back",
                                  fontsize: 20,
                                  fontweight: FontWeight.w400,
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout2() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.green.shade400.withOpacity(0.2),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abdulla Nasar",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Praise",
                          color: widget.textColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(
                          socialMedia.length,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: HoverZoomWidgetForMobilevery(
                                imagePath: socialMedia[index],
                                onTap: () {
                                  index == 0
                                      ? widget.launchInstagram()
                                      : index == 1
                                          ? widget.launchLinkedIn()
                                          : widget.launchGitHub();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    giveText: "About Me",
                                    fontsize: 25,
                                    fontweight: FontWeight.bold,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 480,
                                    width: 150,
                                    child: ListView(
                                        shrinkWrap: true,
                                        children: widget.listItemWidgets),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(
                                        giveText: "Technical",
                                        fontsize: 20,
                                        fontweight: FontWeight.bold,
                                        textColor: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: skills.map((skill) {
                                          return HoverZoom(
                                            hover: SkillProgressBar(
                                              skill: skill,
                                              containerWidth: 130.0,
                                              containerHeight: 10.0,
                                              borderRadius: 30.0,
                                              borderColor: Colors.black,
                                              progressColor: Colors.blue,
                                              headingColor: Colors.black,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: tools.map((skill) {
                                              return HoverZoom(
                                                hover: SkillProgressBar(
                                                  skill: skill,
                                                  containerWidth: 130.0,
                                                  containerHeight: 10.0,
                                                  borderRadius: 30.0,
                                                  borderColor: Colors.black,
                                                  progressColor: Colors.blue,
                                                  headingColor: Colors.black,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   height: 30,
                                      // ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          text(
                                            giveText: "Other",
                                            fontsize: 20,
                                            fontweight: FontWeight.bold,
                                            textColor: Colors.black,
                                          ),
                                          SizedBox(
                                            height: 370,
                                            width: 120,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                children:
                                                    otherskills.map((skill) {
                                                  return HoverZoom(
                                                    hover: CustomSkillContainer(
                                                        skill: skill),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            widget.downloadPdf();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: text(
                                giveText: "Download CV",
                                fontsize: 14,
                                fontweight: FontWeight.w400,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RawMaterialButton(
                          hoverElevation: 20,
                          onPressed: () {
                            widget.flipContainer();
                          },
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                widget.isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                widget.isHovered = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                color: widget.isHovered
                                    ? HexColor("AFEE85")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: text(
                                  giveText: "Go Back",
                                  fontsize: 14,
                                  fontweight: FontWeight.w400,
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
