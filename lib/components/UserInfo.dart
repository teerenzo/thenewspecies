import 'package:flutter/material.dart';
import 'package:newspecies/components/paymentOption.dart';
import 'package:newspecies/components/shippingOption.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newspecies/components/checkOutProduct.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late String names, neighborhood, neighborhoodDetails, phone, email;

  getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getString("names").toString();
      neighborhood = prefs.getString("neighborhood").toString();
      neighborhoodDetails = prefs.getString("neighborhoodDetails").toString();
      email = prefs.getString("email").toString();
      phone = prefs.getString("phone").toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    names = "";
    neighborhood = "";
    neighborhoodDetails = "";
    phone = "";
    email = "";
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      padding: EdgeInsets.only(top: 12),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.account_box)),
            title: Text(
              names,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Phone: $phone"), Text("email: $email")]),
            trailing: Icon(Icons.edit),
          ),
          Divider(
            thickness: 1,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * .020),
                Text("Location:"),
                SizedBox(height: screenHeight * .010),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text("$neighborhood"),
                  subtitle: Text("$neighborhoodDetails"),
                  trailing: Icon(Icons.edit),
                ),
                Divider(
                  thickness: 1,
                ),
                // ListTile(
                //   leading: Icon(Icons.logout),
                //   title: Text("LogOut"),
                // )
              ]),
          Divider(
            thickness: 2,
            color: HexColor("#F2E5E5"),
          ),
          CheckOutProduct(),
          Divider(
            thickness: 2,
            color: HexColor("#F2E5E5"),
          ),
          ShippingInfo(),
          Divider(
            thickness: 2,
            color: HexColor("#F2E5E5"),
          ),
          paymentOption(),
        ],
      ),
    );
  }
}
