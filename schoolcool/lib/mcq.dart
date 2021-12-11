import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Mcq extends StatelessWidget {
  const Mcq({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "MCQs",
            style: TextStyle(
              fontSize: 30,
              color: kPrimaryDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          backgroundColor: kPrimaryLightColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Image.asset('assets/Icons/Removedbg/Editprof.png'),
                          GestureDetector(
                            onTap: () {}, // handle your image tap here
                            child: Image.asset(
                              'assets/Icons/Removedbg/phy.png',
                              // fit: BoxFit.cover, // this is the solution for border
                              // width: 110.0,
                              // height: 110.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {}, // handle your image tap here
                            child: Image.asset(
                              'assets/Icons/Withbg/chem_withbg.png',
                              // fit: BoxFit.cover, // this is the solution for border
                              // width: 110.0,
                              // height: 110.0,
                            ),
                          ),
                          // Image.asset('assets/Icons/Removedbg/aboutus.png'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {}, // handle your image tap here
                            child: Image.asset(
                              'assets/Icons/Removedbg/bot.png',
                              // fit: BoxFit.cover, // this is the solution for border
                              // width: 110.0,
                              // height: 110.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {}, // handle your image tap here
                            child: Image.asset(
                              'assets/Icons/Removedbg/zoo.png',
                              fit: BoxFit.cover, // this is the solution for border
                              width: 110.0,
                              height: 110.0,
                            ),
                          ),
                          // Image.asset('assets/Icons/Removedbg/Editprof.png'),
                          // Image.asset('assets/Icons/Removedbg/aboutus.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/testimonial1.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/testimonial2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/testimonial3.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    // color: kPrimaryDarkColor,
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),

                // const Padding(
                //   padding: EdgeInsets.all(20),
                //   child: Text("Profile", style: TextStyle(
                //     fontSize:35,
                //     letterSpacing:1.2,
                //     color:kPrimaryDarkColor,
                //     fontWeight:FontWeight.w600,
                //   )
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.all(2.0),
                //   width: MediaQuery.of(context).size.width/2,
                //   height: MediaQuery.of(context).size.width/2,
                //   decoration: BoxDecoration(
                //     border:Border.all(color:kPrimaryColor, width:2),
                //     shape:BoxShape.circle,
                //     color: kPrimaryLightColor,
                //     image: const DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage('assets/avatar.png')
                //     )
                //   )
                // )
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text('Getting Started',
                    style: TextStyle(fontSize: 55, color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                    ),
                // const Center(
                  
                  // child: Text(
                  //   'Getting Started',
                  //   textAlign: TextAlign.center,
                  //   // padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  //   style: TextStyle(
                  //   fontSize: 45,
                    // fontFamily: 
                    // color: kPrimaryColor,
                    // fontWeight: FontWeight.w600,
            // ),
                    
              ],
            ),
          ],
        ));
  }
}
