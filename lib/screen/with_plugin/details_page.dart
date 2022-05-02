import 'package:flutter/material.dart';

import 'modals/user.dart';

class DetailsPage extends StatelessWidget {
 final dynamic jData;
 DetailsPage(this.jData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child:
        Container(
          child: Text(jData.address.street),
        ))
    );
  }
}
