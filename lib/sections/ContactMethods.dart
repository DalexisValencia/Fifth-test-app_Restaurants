// import 'package:fith_app__restaurant/interfaces/ContactInterface.dart';
import 'package:fith_app__restaurant/interfaces/ContactMeans.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';

class ContactMethods extends StatefulWidget {
  final List<ContactMeans> contact;
  ContactMethods({this.contact});
  @override
  ContactMethodsState createState() => ContactMethodsState();
}

class ContactMethodsState extends State<ContactMethods> {
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;

    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
      child: Builder(builder: (BuildContext context) {
        List<Widget> contacts = [];
        widget.contact.map((e) {
          contacts.add(Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.3, color: Theme.of(context).primaryColor))),
            child: SizedBox.expand(
                child: MaterialButton(
              onPressed: () async {
                const String url = 'tel://7153914';
                bool showSnackBar = false;
                String alertSnackBar = '';
                if (e.type == 'call') {
                  if (await canLaunch('tel://' + e.key)) {
                    launch('tel://' + e.key);
                  } else {
                    showSnackBar = true;
                    alertSnackBar = 'Ha ocurrido un error';
                  }
                }
                if (e.type == 'mail') {
                  if (await canLaunch(url)) {
                    final Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: e.value,
                        queryParameters: {'suject': 'Username and lastName'});

                    launch(_emailLaunchUri.toString());
                  } else {
                    showSnackBar = true;
                    alertSnackBar = 'No hemos podido abrir el email ';
                  }
                }
                if (e.type == 'whatsapp') {
                  var whatsappUrl = "whatsapp://send?phone=" + e.key;
                  if (await canLaunch(whatsappUrl)) {
                    launch(whatsappUrl);
                  } else {
                    showSnackBar = true;
                    alertSnackBar = 'please check if whatsapp is installed';
                  }
                }
                if (showSnackBar) {
                  final snackBar = SnackBar(
                    content: Text(
                      alertSnackBar,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(e.value),
                  FittedBox(
                      child: Text(
                    e.key,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
            )),
          ));
        }).toList();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: contacts,
        );
      }),
    );
  }
}
