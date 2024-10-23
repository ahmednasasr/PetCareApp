import 'package:flutter/material.dart';
import 'package:petcareapp/main_layout/presentaion/widgets/custome_search_container.dart';
import 'package:petcareapp/main_layout/presentaion/widgets/custome_search_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Text("What Are You",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
         Row(
           children: [
             Text("Looking For",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
             Text(",Ahmed?",style: TextStyle(color: Color(0xffFFCF6F),fontSize: 30,fontWeight: FontWeight.bold),),
           ],
         ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: CustomeSearchList.SearchScreenContent.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10, 
                ),
                itemBuilder: (context, index) {
                  return CustomeSearchContainer(customeSearchList: CustomeSearchList.SearchScreenContent[index]);
                },),
          )
        ],
      ),
    );
  }
}
