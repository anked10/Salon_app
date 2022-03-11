import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_app/src/pages/Aulas/aulas_content.dart';
import 'package:salon_app/src/pages/Incidencias/incidencias_content.dart';
import 'package:salon_app/src/utils/colors.dart';

class InicioTurores extends StatelessWidget {
  static final _controller = Controller();
  const InicioTurores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, t) {
          return Scaffold(
            floatingActionButton: (_controller.valueBoton == 2)
                ? Container( 
                  )
                : Container(),
            //backgroundColor: const Color.fromARGB(255, 245, 246, 248),
            backgroundColor: const Color(0xfff1eff6),
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(8),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                  ),
                  child: Row(children:  [
                    const CircleAvatar(
                      backgroundColor: Colors.teal,
                    ),
                    const Spacer(),
                    const Icon(Fontisto.search),
                    SizedBox(width: ScreenUtil().setWidth(8)),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                  ),
                  child: Text(
                    'Bienvenido, Carlos',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: const Color(0xff323a54),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                tabAnimated(),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: (_controller.valueBoton == 1) ? const AulasTutores(valor:'1') : const IncideciasContent(),
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }

  Container tabAnimated() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(3),
        vertical: ScreenUtil().setWidth(3),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        color: tabUnSelected,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: tabUnSelected),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                _controller.changeValueBoton(1);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(7),
                  horizontal: ScreenUtil().setWidth(2),
                ),
                decoration: BoxDecoration(
                  color: (_controller.valueBoton == 1) ? tabSelected : tabUnSelected,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesome5Brands.servicestack,
                        size: ScreenUtil().setSp(17),
                        color: (_controller.valueBoton == 1) ? Colors.red : Colors.grey,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(5),
                      ),
                      Text(
                        'Aulas',
                        style: GoogleFonts.poppins(
                          color: (_controller.valueBoton == 1) ? colorTextSelect : colorTextUnSelect,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                _controller.changeValueBoton(2);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(7),
                  horizontal: ScreenUtil().setWidth(2),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (_controller.valueBoton == 2) ? tabSelected : tabUnSelected,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        AntDesign.switcher,
                        size: ScreenUtil().setSp(17),
                        color: (_controller.valueBoton == 2) ? Colors.red : Colors.grey,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(5),
                      ),
                      Text(
                        'Incidencias',
                        style: GoogleFonts.poppins(
                          color: (_controller.valueBoton == 2) ? colorTextSelect : colorTextUnSelect,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Controller extends ChangeNotifier {
  int valueBoton = 1;

  void changeValueBoton(int v) {
    valueBoton = v;
    notifyListeners();
  }
}
