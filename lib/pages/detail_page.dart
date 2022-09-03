import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travell_app/cubit/app_cubit_states.dart';
import 'package:travell_app/misc/colors.dart';
import 'package:travell_app/pages/navpages/home_page.dart';
import 'package:travell_app/widgets/app_large_text.dart';
import 'package:travell_app/widgets/app_text.dart';

import '../cubit/app_cubits.dart';
                  // ignore_for_file: prefer_const_constructors
 

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  double ratingIndex = 3.5;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state){
        DetailState detail = state as DetailState;
        return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                          fit: BoxFit.cover
                          )
                          ),
                )),
            Positioned(
              left: 20,
              top: 70,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                        // Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      )),
                  IconButton(onPressed: () {}, 
                  icon:  Icon(Icons.more_vert, 
                  color: Colors.black,)
                  )
                ],
              ),
            ),

            Positioned(
              top: 320,
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: detail.place.name),
                          AppLargeText(text: "\$"+detail.place.price.toString(), size: 33,
                          color: AppColors.mainColor,)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 30,
                        top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 3,),
                          AppText(
                            text: detail.place.location,
                            size: 20, 
                            color: AppColors.textColor1,)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5,
                      left: 30),
                      child: Row(
                        children: [
                          RatingBar.builder(
                        allowHalfRating: true,
                        initialRating: ratingIndex,
                        itemSize: 20,
                        itemCount: 5,
                        itemBuilder: (_, index){
                          return Icon(Icons.star, color: Colors.amber);
                      }, 
                      onRatingUpdate: (rating){
                        setState(() {
                          ratingIndex = rating;
                        });
                      }
                      ),
                      AppText(text: ratingIndex.toString())
                        ],
                      )),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: AppLargeText(text: "People"),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 30,
                        top: 5
                      ),
                      child: AppText(text: "Number of people in your group"),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (_, index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10, ),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                              color: selectedIndex == index? Colors.black:Colors.grey[300],
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text((index+1).toString(), style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: selectedIndex == index? Colors.white: Colors.black
                              ),)),
                            ),
                          );
                      })
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top:20,
                        left: 30),
                        child: AppLargeText(text: "Description"),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top:10,
                            left: 30),
                            child: AppText(text: detail.place.description, color: AppColors.mainTextColor,),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30,
                      top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              // color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 3,
                                color: AppColors.mainColor
                              )
                            ),
                            child: IconButton(onPressed: (){}, 
                            icon: Icon(Icons.favorite_border_outlined)),
                          ),
                          Container(
                            width: 300,
                            height: 60,
                            margin: EdgeInsets.only(
                            right: 20),
                            padding: EdgeInsets.only(left: 30,
                            right: 10),
                            decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(text: "Book Trip Now", color: Colors.white, size: 17,),
                                Image(image: AssetImage("img/button-one.png"))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ) )
            
          ],
        ),
      ),
    );
      });
  }
}
