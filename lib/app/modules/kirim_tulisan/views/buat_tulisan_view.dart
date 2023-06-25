import 'dart:io';

import 'package:eduit/app/modules/kirim_tulisan/controllers/kirim_tulisan_controller.dart';
import 'package:eduit/app/modules/navbar_page/views/navbar_page_view.dart';
import 'package:eduit/app/navbottom.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class BuatTulisanView extends GetView<KirimTulisanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(children: [
            Container(
              padding:
                  EdgeInsets.only(top: 85, left: 40, right: 50, bottom: 20),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Kirim Tulisan',
                      style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff034779)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Card(
              color: Color(0xffF5F5F5),
              child: Container(
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Judul',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: TextFormField(
                        controller: controller.cJudul,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Deskripsi',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: TextFormField(
                        minLines: 6,
                        maxLines: 16,
                        controller: controller.cIsi,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff5EE8D1),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                        height: controller.isUploaded.isFalse ? 30 : 1,
                        width: double.infinity,
                        child: Container(
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Colors.black),
                                backgroundColor: Colors.white),
                            child: Text(
                              'Pilih Cover',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              print('${file?.path}');

                              if (file == null) return;

                              String uniqueFileName = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceDirImage =
                                  referenceRoot.child('images');

                              Reference referenceImagetoUpload =
                                  referenceDirImage.child(uniqueFileName);

                              referenceImagetoUpload.putFile(File(file.path));

                              try {
                                await referenceImagetoUpload
                                    .putFile(File(file.path));

                                controller.cImg.text =
                                    await referenceImagetoUpload
                                        .getDownloadURL();
                                controller.isUploaded.value = true;
                                print(controller.cImg.text);
                              } catch (e) {}
                            },
                          ),
                        ),
                      ),
                    ),
                    Obx(() => Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeInOut,
                                height: controller.isUploaded.isTrue ? 30 : 1,
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Upload Cover Berhasil',
                                    style: GoogleFonts.inter(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeInOut,
                                height: controller.isUploaded.isTrue ? 30 : 0,
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(
                                                    'Yakin Mengganti Cover ?'),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        controller.cImg.text =
                                                            '';
                                                        controller.isUploaded
                                                            .value = false;
                                                      },
                                                      child: Text('Ok'))
                                                ],
                                              ));
                                      print(controller.isUploaded.value);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(color: Colors.black),
                                        backgroundColor: Colors.white),
                                    child: Text(
                                      'Ganti Cover',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 160,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xff034779)),
                        shape: StadiumBorder()),
                    child: Text(
                      'Kirim Tulisan',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Color(0xff034779)),
                    ),
                    onPressed: () async {
                      if (controller.cJudul.text.isEmpty ||
                          controller.cIsi.text.isEmpty) {
                        print(controller.name);
                        print(controller.formatDate);

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Gagal !'),
                                  content:
                                      Text('Tolong isi semua fieldnya ya..'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          controller.cImg.text = '';
                                          print(controller.isUploaded.value);
                                        },
                                        child: Text('Ok'))
                                  ],
                                ));
                      } else if (controller.cImg.text == '' ||
                          controller.cImg.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Gagal !'),
                                  content:
                                      Text('Upload Foto / Sedang Upload Foto'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          controller.cImg.text = '';
                                        },
                                        child: Text('Ok'))
                                  ],
                                ));
                      } else {
                        print('=====================${controller.name}');
                        controller.postTulisan();
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Berhasil'),
                                  content: Text(
                                      'Silahkan lihat artikel kamu dihalaman Artikel'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          controller.cIsi.clear();
                                          controller.cJudul.clear();
                                          controller.cImg.text = '';
                                          Get.toNamed('navbar-page');
                                        },
                                        child: Text('Ok'))
                                  ],
                                ));
                      }
                    })),
            SizedBox(
              height: 40,
            ),
          ]),
        ),
      ),
    );
  }
}
