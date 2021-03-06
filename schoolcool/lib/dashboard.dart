import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';

class Dashboard extends StatelessWidget {
  // var email;
  // Dashboard({this.email});
  const Dashboard({Key key, TextEditingController email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          backgroundColor: kPrimaryLightColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 550,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(10, 90, 10, 0),
                    padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Image.asset('assets/Icons/Removedbg/Editprof.png'),
                            // GestureDetector(
                            //   onTap: () {}, // handle your image tap here
                            //   child: Image.asset(
                            //     'assets/Icons/Removedbg/Editprof.png',
                            //     // fit: BoxFit.cover, // this is the solution for border
                            //     width: 110.0,
                            //     height: 110.0,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'assets/Icons/Removedbg/aboutus.png',
                                // fit: BoxFit.cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
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
                                'assets/Icons/Removedbg/puzzels.png',
                                // fit: BoxFit.cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'assets/Icons/Removedbg/mcqs.png',
                                // fit: BoxFit.cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              CustomPaint(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  painter: Header()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("widget.email",
                        style: TextStyle(
                          fontSize: 35,
                          letterSpacing: 1.2,
                          color: kPrimaryDarkColor,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Container(
                      padding: const EdgeInsets.all(2.0),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: kPrimaryLightColor, width: 2),
                          shape: BoxShape.circle,
                          color: kPrimaryLightColor,
                          image: const DecorationImage(
                              // fit: BoxFit.cover,
                              image: NetworkImage(
                            'https://source.unsplash.com/50x50/?portrait',
                          ))))
                ],
              ),
              // Padding(
              //     padding: const EdgeInsets.only(bottom: 200, left: 100),
              //     child: CircleAvatar(
              //       backgroundColor: Colors.black,
              //       child: IconButton(
              //           icon: const Icon(Icons.edit, color: kPrimaryLightColor),
              //           onPressed: () {}),
              //     )),
            ],
          ),
        ));
  }
}

class Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kPrimaryColor;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
