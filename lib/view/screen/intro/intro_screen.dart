import 'package:flutter/material.dart';
import '../../../model/onboarding_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../welcome/welcome_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();
  int selectedIndex=0;
  List<OnBoardingModel> onBoardingList=List.empty(growable: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData(){
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        onBoardingList.add(OnBoardingModel(Images.onBoard_1,"Parking With Easy Way","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text "));
        onBoardingList.add(OnBoardingModel(Images.onBoard_2,"Safe and secure Parking","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text "));
        onBoardingList.add(OnBoardingModel(Images.onBoard_3,"Let’s Go Parking","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text "));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffD9F3F9),
          body: Column(children: [
            Expanded(child: PageView.builder(
              itemCount: onBoardingList.length,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      selectedIndex != 2?Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                              child: Text("Skip",
                                style: montserratLight.copyWith(fontSize: AppConstants.itemWidth*0.04, color: ColorResources.BLACK.withOpacity(0.8)),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ):SizedBox(),
                      Image.asset(onBoardingList[index].imageUrl, width: AppConstants.itemWidth),
                      SizedBox(height: AppConstants.itemHeight*0.03,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                        child: Text(onBoardingList[index].title,
                          style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.055,color: ColorResources.BLACK),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: AppConstants.itemHeight*0.03,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                        child: Text(onBoardingList[index].description,
                          style: montserratLight.copyWith(fontSize: AppConstants.itemWidth*0.04, color: ColorResources.BLACK.withOpacity(0.8)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]);
              },
              onPageChanged: (index) {
                setState(() {
                  selectedIndex=index;
                });
              },
            ),),
            GestureDetector(
              onTap: () {
                if(selectedIndex != 2) {
                  _pageController.animateToPage(selectedIndex+1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                }else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(),));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMERY,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.05),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:AppConstants.itemWidth*0.04),
                margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.12),
                child: Text(selectedIndex != 2?"Next":"Let’s Go",
                    textAlign: TextAlign.center,
                    style: montserratRegular.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
              ),
            ),
            SizedBox(height: AppConstants.itemHeight*0.1,),
          ]),
        ),
      ),
    );
  }
}