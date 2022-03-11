import 'package:flutter/material.dart';
import 'package:flutter_app_msu2/models/food_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetailUI extends StatefulWidget {
  //สร้างตัวแปรมารับค่าที่จะส่งมาอีกหน้า
  String? name_fs, web_fs, facebook_fs, phone_fs, image_fs, lat_fs, lng_fs;

  ShowDetailUI({
    Key? key,
    this.name_fs,
    this.web_fs,
    this.facebook_fs,
    this.phone_fs,
    this.image_fs,
    this.lat_fs,
    this.lng_fs,
  }) : super(key: key);

  @override
  State<ShowDetailUI> createState() => _ShowDetailUIState();
}

class _ShowDetailUIState extends State<ShowDetailUI> {
  
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดร้าน',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/' + widget.image_fs.toString(),
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Card(
                color: Colors.white54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      // name
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.shoppingBag,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            ': ' + widget.name_fs.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(widget.web_fs.toString());
                      },
                      child: Padding(
                        // website
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.link,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              ': ' + widget.web_fs.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                //color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser('https:..fb.com/'+widget.facebook_fs.toString());
                      },
                      child: Padding(
                        //facebook
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              ': ' + widget.facebook_fs.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                //color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _makePhoneCall(widget.phone_fs.toString()),
                      child: Padding(
                        //phone
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.amberAccent,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              ': ' + widget.phone_fs.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                //color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _launchInBrowser('https://www.google.com/maps/@${widget.lat_fs.toString()},${widget.lng_fs.toString()},16z'),
                      child: Padding(
                        //map
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarked,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              ': ' + 'Go To Shop',
                              style: TextStyle(
                                fontSize: 20.0,
                                // color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //color: Colors.blue[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
