import 'package:flutter/material.dart';
import 'package:petcareapp/main_layout/presentaion/widgets/custome_search_container.dart';

class CustomeSearchList{
  String image;
  String title;

  CustomeSearchList({required this.image, required this.title});

  static List<CustomeSearchList> SearchScreenContent=[
    CustomeSearchList(image: "assets/images/vet.png", title: "Veterinary"),
    CustomeSearchList(image: "assets/images/grooming.png", title: "Grooming"),
    CustomeSearchList(image: "assets/images/boarding.png", title: "Pet boarding"),
    CustomeSearchList(image: "assets/images/adoption.png", title: "Adoption"),
    CustomeSearchList(image: "assets/images/dog walking.png", title: "Dog walking"),
    CustomeSearchList(image: "assets/images/training.png", title: "Training"),
    CustomeSearchList(image: "assets/images/taxi.png", title: "Pet taxi"),
    CustomeSearchList(image: "assets/images/date.png", title: "Pet Date"),
    CustomeSearchList(image: "assets/images/other.png", title: "Other"),
  ];
}