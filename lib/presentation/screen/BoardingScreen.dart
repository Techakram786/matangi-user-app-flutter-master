

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:matangi_user_app/presentation/widget/GlobalWidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../../data/Model/OnBoardingModel.dart';
import '../../logic/cubit/BoardingCubit.dart';
import '../../logic/cubit/state/BoardingState.dart';
import '../routes/PageConstants.dart';

class BoardingScreen extends StatelessWidget {
  BoardingScreen({Key? key}) : super(key: key);
  PageController boardingController = PageController();
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    height= MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<BoardingCubit, BoardingState>(
            builder: (context, state) {
              if (state is BoardingSuccessState) {
                return PageView.builder(
                  itemCount: state.boardingList.length,
                  itemBuilder: (context, index) =>
                      buildOnBoardingItem(context, state.boardingList[index]),
                  controller: boardingController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int page) {
                    context.read<BoardingCubit>().onPageChange(page);
                  },
                );
              }
              return Container();
            },
          ),
          BlocBuilder<BoardingCubit, BoardingState>(
            builder: (context, state) {
              if (state is BoardingSuccessState) {

                return Positioned(
                  left: AllDimension.twentyFive,
                  right: AllDimension.twentyFive,
                  bottom: AllDimension.sixty,
                  // Place the container at the bottom
                  child: Container(
                    height: AllDimension.twoEight,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AllDimension.twenty),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AllDimension.twentyFive,
                          bottom: AllDimension.twentyFive,
                          left: AllDimension.fifteen,
                          right: AllDimension.fifteen),
                      child: Column(
                        children: [
                          Html(
                            data: state.boardingList[state.index].title,
                            style: {
                              "p": Style(
                                  padding: HtmlPaddings.zero,
                                  margin: Margins.zero,
                                  textAlign: TextAlign.center),
                              "body": Style(
                                  padding: HtmlPaddings.zero,
                                  margin: Margins.zero
                              ),
                              "html": Style(
                                color: Colors.black,
                                fontSize: FontSize.xLarge,
                                fontFamily: AllString.fontLato,
                                fontWeight: FontWeight.w700,
                              ),

                            },

                          ),
                          Text(
                            state.boardingList[state.index].des,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: AllDimension.twelve,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: AllDimension.thirteen,
                          ),
                          SmoothPageIndicator(
                            controller: boardingController,
                            count: state.boardingList.length,
                            effect: ExpandingDotsEffect(
                                dotHeight: AllDimension.eight,
                                dotWidth: AllDimension.eight,
                                dotColor: AllColors.dotIndicatorColor,
                                activeDotColor: AllColors.accentColor),
                          ),
                          SizedBox(
                            height: AllDimension.thirteen,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: globalWidth!/2.7,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, PageConstants.signInScreen);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    AllColors.unSelectButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AllDimension.four),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AllDimension.two,
                                        vertical: AllDimension.twelve),
                                  ),
                                  child: Text(
                                    translation(context).signIn,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AllColors.accentColor,
                                      fontSize: AllDimension.fifteen,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              BlocBuilder<BoardingCubit, BoardingState>(
                                builder: (context, state) {
                                  if (state is BoardingSuccessState){
                                    return Container(
                                      width: globalWidth!/2.7,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(state.index==2){
                                            Navigator.pushNamed(
                                                context, PageConstants.signInScreen);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AllColors.accentColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AllDimension.four),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AllDimension.two,
                                              vertical: AllDimension.twelve),
                                        ),
                                        child: Text(
                                          state.index==2?translation(context).getStarted:translation(context).knowMore,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AllDimension.fifteen,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();

                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget buildOnBoardingItem(BuildContext context, OnBoardingModel page) {
    return Container(
      child: Image.asset(
        page.image,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

}
