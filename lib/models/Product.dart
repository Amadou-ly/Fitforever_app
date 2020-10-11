import 'package:flutter/material.dart';

class Product {
  final String image, title, size, description;
  final int price, id;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
  });

}

List<Product> products = [
  Product(
    id: 1,
    title: "Men Jacket Bomber Very",
    price: 1199,
    description: "Best Fitting Jacket in the Market. 10% Cotton 90% Polyester.Big And Tall NASA Front And Sleeve Print Hoodie. Model is 6'1 and Wears Size XXL.",
    size: "M",
    image: "assets/images/Jacket.jpeg"),

  Product(
    id: 2,
    title: "Baseball Top",
    price: 999,
    description: "High Quality Women Top",
    size: "S",
    image: "assets/images/Top.jpg"),

  Product(
      id: 3,
      title: "Baseball Top",
      price: 999,
      description: "High Quality Women Top",
      size: "S",
      image: "assets/images/Top.jpg"),

  Product(
      id: 4,
      title: "Rain Jacket",
      price: 999,
      description: "High Quality Women Top",
      size: "S",
      image: "assets/images/Top.jpg"),

  Product(
      id: 5,
      title: "Rain Jacket",
      price: 999,
      description: "High Quality Women Top",
      size: "S",
      image: "assets/images/Top.jpg"),

  Product(
      id: 6,
      title: "Rain Jacket",
      price: 999,
      description: "High Quality Women Top",
      size: "S",
      image: "assets/images/Top.jpg"),
];