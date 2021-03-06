import 'package:flutter/material.dart';
import 'package:mvp_all/styles/Colors/ColorsView.dart';
import '../widgets/container_boarding.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  int _currentPageValue = 0;

  final PageController _pageController = PageController();

  List<Map<String,String>> boardingData = [
    {
      "image": "assets/onBoarding/B1.png",
      "title": "ESPARCIMIENTO",
      "description":  'Consequat amet officia in elit anim sit. Occaecat consequat excepteur fugiat anim quis duis ullamco. Sunt ea consequat dolor ea anim consequat exercitation nisi magna.'
    },
    {
      "image": "assets/onBoarding/B2.png",
      "title": "ESPARCIMIENTO",
      "description":  'Consequat amet officia in elit anim sit. Occaecat consequat excepteur fugiat anim quis duis ullamco. Sunt ea consequat dolor ea anim consequat exercitation nisi magna.'
    },
    {
      "image": "assets/onBoarding/B3.png",
      "title": "ESPARCIMIENTO",
      "description":  'Consequat amet officia in elit anim sit. Occaecat consequat excepteur fugiat anim quis duis ullamco. Sunt ea consequat dolor ea anim consequat exercitation nisi magna.'
    },
    {
      "image": "assets/onBoarding/B4.png",
      "title": "ESPARCIMIENTO",
      "description":  'Consequat amet officia in elit anim sit. Occaecat consequat excepteur fugiat anim quis duis ullamco. Sunt ea consequat dolor ea anim consequat exercitation nisi magna.'
    },
    {
      "image": "assets/onBoarding/B5.png",
      "title": "ESPARCIMIENTO",
      "description":  'Consequat amet officia in elit anim sit. Occaecat consequat excepteur fugiat anim quis duis ullamco. Sunt ea consequat dolor ea anim consequat exercitation nisi magna.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: 
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (page){
                    getChangePage(page);
                  },
                  itemBuilder: (context, index) {
                    return ContainerBoarding(
                      image: boardingData[index]["image"]!, 
                      title: boardingData[index]["title"]!,
                      description: boardingData[index]["description"]!,
                    );
                  },
                  itemCount: boardingData.length,
                )
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                        List.generate(boardingData.length, (index) {
                          if(index == _currentPageValue) {
                            return createBarProgression(showIndicator: true);                             
                          } else {
                            return createBarProgression(showIndicator: false);
                          }
                        } 
                        )
                       
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          _currentPageValue == 4 ? 'Continuar' : 'Siguiente',
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: _currentPageValue == 4 ? Colors.transparent : ColorsViews.textCenterColor,
                            )
                          ),
                          elevation: 1,
                          primary:  _currentPageValue == 4 ? ColorsViews.buttonMainColor: ColorsViews.colorWhiteGeneral,
                          onPrimary: _currentPageValue == 4 ? ColorsViews.colorWhiteGeneral : ColorsViews.textCenterColor,
                        ),
                        onPressed: () {             
                          setState(() {
                            
                          });

                          if(_currentPageValue == 4){
                            Navigator.pushNamed(context, 'homeview');
                          }

                          if(_currentPageValue < boardingData.length-1){
                            _currentPageValue += 1;
                            _pageController.animateToPage(
                               _currentPageValue, 
                               duration: const Duration(milliseconds: 400), 
                               curve: Curves.easeInSine
                            );
                          }
                        
                        }
                      ), 
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )) 
    );
  }

  void getChangePage(int page) {
    _currentPageValue = page;
    setState(() {});
  }

  createBarProgression({required bool showIndicator}){
    return AnimatedContainer(

      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 9),
      height:5,
      width: showIndicator ? 24 : 14,
      decoration: BoxDecoration(
        color: showIndicator ? ColorsViews.textPink : ColorsViews.colorGray,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }

}
