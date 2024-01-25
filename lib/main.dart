import 'dart:developer';
import 'package:cryptoproject/Controller/provider/crypto_provider.dart';
import 'package:cryptoproject/Model/crypto_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
          providers: [
            ListenableProvider<CryptoDataProvider>(
                create: (_) => CryptoDataProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: const Cryptogen(),
          ));
    });
  }
}

class Cryptogen extends StatefulWidget {
  const Cryptogen({super.key});

  @override
  State<Cryptogen> createState() => _CryptogenState();
}

class _CryptogenState extends State<Cryptogen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            Consumer<CryptoDataProvider>(builder: (context, cryptoData, child) {
              if (cryptoData.isLoading == true) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                log(cryptoData.cryptoData.length.toString());
                return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cryptoData.cryptoData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          CryptoDataModel currentCryptoData =
                              cryptoData.cryptoData[index];
                          return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 5.w,
                                backgroundColor: Colors.white12,
                                child: Image.network(currentCryptoData.image!),
                              ),
                              title: Text(
                                currentCryptoData.name!,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: Text(
                                currentCryptoData.currentPrice!
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    color: currentCryptoData.priceChange24! > 0
                                        ? Colors.green
                                        : Colors.red),
                              ));
                        }));
              }
            })
          ],
        ),
      )),
    );
  }
}
