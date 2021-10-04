import 'package:flutter/material.dart';
import 'package:pdp_ui_3/pages/home_page.dart';
import 'package:pdp_ui_3/utils/strings.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Stack(

        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
                _makePage(
                  img: "assets/images/image_1.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
                ),

              _makePage(
                  img: "assets/images/image_2.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),

              _makePage(
                  img: "assets/images/image_3.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent
              ),


            ],
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),

          currentIndex == 2? Container(
            padding: const EdgeInsets.only(bottom: 30,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: const Text("Skip",style: TextStyle(color: Colors.red,fontSize: 20),),
                ),
              ],
            ),
          ) : Container(),

        ],

      ),


    );
  }

  Widget _makePage({img,title,content}){
    return Container(
      padding: const EdgeInsets.only(left: 50,right: 50,bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: const TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Text(content,style: const TextStyle(color: Colors.grey,fontSize: 18,),textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              Image(image: AssetImage(img)),


            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive? 30 : 6,
      margin: const EdgeInsets.only(right: 5,bottom: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i = 0; i < 3;i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }
      else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}
