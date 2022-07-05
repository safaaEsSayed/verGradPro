
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'description1.dart';
import 'description2.dart';

class ddata {
  String images;
  String text;
  dynamic x;

  ddata(
      this.images,
      this.text,
      this.x,
      );
}

class FoodPage extends StatelessWidget {
  List<ddata> items = [
    ddata(
        'https://images.emedicinehealth.com/images/article/main_image/bacterial-pneumonia-1.jpg',
        'pneumonia',
        description()),
    ddata(
        'https://www.albayan.ae/polopoly_fs/1.4370357.1644923248!/image/image.jpg',
        'diabetes',
        description2()),
    ddata(
        'https://www.ctnaturalhealth.com/wp-content/uploads/2017/09/thyroid.jpg',
        'hypothyroidism',
        description()),
    ddata(
        'https://lebatlerenalcare.co.za/wp-content/uploads/2021/09/Preferred-Vascular-Group_Kidney-Failure-1024x536-1.jpeg',
        'kidney failure',
        description()),
    ddata(
        'https://www.cdc.gov/arthritis/communications/features/images/pain-in-all-joints_1200x600.jpg?_=05334',
        'arthritis',
        description()),
    ddata(
        'https://img.youm7.com/large/201905220450435043.jpg'  ,
        'colon',
        description()),
    ddata(
        'https://static.webteb.net/images/content/tbl_diseases_disease_106_45e7ce95fc-09a1-4115-b709-f204c6b291e2.jpg',
        'Tuberculosis',
        description()),
    ddata(
        'https://lebatlerenalcare.co.za/wp-content/uploads/2021/09/Preferred-Vascular-Group_Kidney-Failure-1024x536-1.jpeg',
        'kidney failure',
        description()),
    ddata(
        'https://www.cdc.gov/arthritis/communications/features/images/pain-in-all-joints_1200x600.jpg?_=05334',
        'arthritis',
        description()),
    ddata(
        'https://images.emedicinehealth.com/images/article/main_image/bacterial-pneumonia-1.jpg',
        'pneumonia',
        description()),
    ddata(
        'https://keyfpro.com/wp-content/uploads/2021/04/%D8%A3%D8%B9%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D8%B3%D9%83%D8%B1%D9%8A-%D9%81%D9%8A-%D8%A8%D8%AF%D8%A7%D9%8A%D8%AA%D9%87-%D9%88%D8%B7%D8%B1%D9%82-%D8%A7%D9%84%D9%88%D9%82%D8%A7%D9%8A%D8%A9-%D9%85%D9%86%D9%87.jpeg',
        'diabetes',
        description()),
    ddata(
        'https://www.ctnaturalhealth.com/wp-content/uploads/2017/09/thyroid.jpg',
        'hypothyroidism',
        description()),
    ddata(
        'https://lebatlerenalcare.co.za/wp-content/uploads/2021/09/Preferred-Vascular-Group_Kidney-Failure-1024x536-1.jpeg',
        'kidney failure',
        description()),
    ddata(
        'https://www.cdc.gov/arthritis/communications/features/images/pain-in-all-joints_1200x600.jpg?_=05334',
        'arthritis',
        description()),
    ddata(
        'https://keyfpro.com/wp-content/uploads/2021/04/%D8%A3%D8%B9%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D8%B3%D9%83%D8%B1%D9%8A-%D9%81%D9%8A-%D8%A8%D8%AF%D8%A7%D9%8A%D8%AA%D9%87-%D9%88%D8%B7%D8%B1%D9%82-%D8%A7%D9%84%D9%88%D9%82%D8%A7%D9%8A%D8%A9-%D9%85%D9%86%D9%87.jpeg',
        'diabetes',
        description()),
    ddata(
        'https://www.ctnaturalhealth.com/wp-content/uploads/2017/09/thyroid.jpg',
        'hypothyroidism',
        description()),
    ddata(
        'https://lebatlerenalcare.co.za/wp-content/uploads/2021/09/Preferred-Vascular-Group_Kidney-Failure-1024x536-1.jpeg',
        'kidney failure',
        description()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrouColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(6),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Disease Name"),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, int i) => buildStack(context, items[i]),
                separatorBuilder: (context, int i) => Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: const Divider(
                    // color: backgrouColor,
                    color: Colors.white,
                    height: 2,
                    thickness: 1,
                  ),
                ),
                itemCount: items.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildStack(context, ddata data1) => GestureDetector(
  onTap: () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => data1.x));
  },
  child: Stack(
    children: [
      Container(
        margin: EdgeInsets.only(right: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
          color: KMainColor,
          border:
          Border(left: BorderSide(color: KMainColor, width: 15)),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 90,
              child: Image.network(
                data1.images,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '${data1.text}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      Positioned(
        top: 28.5,
        right: 10,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF1c2939),
          ),
        ),
      ),
      Positioned(
        top: 33,
        right: 15,
        child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Icon(
                Icons.double_arrow_sharp,
                color: Color(0xFF1c2939),
              ),
            )),
      ),
    ],
  ),
);

