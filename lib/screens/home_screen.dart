import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //widget oluşturulmadan önce fonk buraya yazarız.(FONK-DEĞİŞKENLER)
  //DART kodları yazılır

  //! Sayaç yerini görecek DEĞİŞKEN
  int _counter = 0;

  //! ARTTIRMA FONK
  void incrementCounter() {
    _counter++;
    setState(() {});
  }

  //! RESET FONK
  void _resetCounter() {
    _counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              //tüm kısmı ortala // .center
              alignment: Alignment.center,
              children: [
                //üst üste sıralamalar için stack yapısı kullanılır
                //listedeki ilk eleman ana eleman oluyor
                Image.asset(
                  'assets/images/zikirmatik.png',
                  width: 300,
                ),
                Positioned(
                  //! pozisyonunu elle belirtmek için
                  top: 47,
                  right: 80,
                  child: _counterText(),
                ),
                //! Container ile kendi butonumuzu oluşturma
                //hazır butonların kendine ait görünümleri olduğu için
                //burada dairesel ve tıklama özelliği olan bir butona ihtiyacımız var
                Positioned(
                  top: 170,
                  //right: 95, //stack içinde aligment.center verdiğimiz için bu kısıma gerek kalmadı
                  child: _incrementButton(), //! arttırma buton
                ),
                Positioned(
                  //! pozisyon belirleme
                  top: 153,
                  //left: 192, //buda sağdan hizalama için
                  right: 73,
                  child: _resetButton(), //! reset button
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _resetButton() {
    return GestureDetector(
      //! CLİCK ÖZELLİĞİ
      onTap: () {
        //* İstersek bu alana da setState kısmı ekleyip durum güncellemesi yapabiliriz.
        _resetCounter();
      },
      child: Container(
        //!   RESET BUTONU   //
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            //todo color: Colors.blue,
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  //!  ARTTIRMA BUTONU   //
  GestureDetector _incrementButton() {
    return GestureDetector(
      //! tıklama özelliği verecek --> GestureDetector
      onTap: () {
        //* İstersek bu alana da setState kısmı ekleyip durum güncellemesi yapabiliriz.
        incrementCounter();
      },
      // onTapDown: ,  //elini dokunduğu anda çalışır
      // onTapUp: ,  //elini kaldırdığı anda
      child: Container(
        width: 110,
        height: 110,
        //yuvarlak oluşturma
        decoration: BoxDecoration(
          //todo: color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  //!   DİJİTAL SAYAÇ   //
  Text _counterText() {
    return Text(
      "$_counter",
      style: const TextStyle(
        fontFamily: "Digital7",
        fontSize: 50,
        color: Colors.white,
      ),
    );
  }
}
