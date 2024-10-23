import 'package:flutter/material.dart';
import 'package:petcareapp/main_layout/presentaion/widgets/custome_search_list.dart';

class CustomeSearchContainer extends StatelessWidget {
  CustomeSearchList customeSearchList;
   CustomeSearchContainer({super.key,required this.customeSearchList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(customeSearchList.image)),
            Text(customeSearchList.title)
          ],
        ),
      ),
    );
  }
}
