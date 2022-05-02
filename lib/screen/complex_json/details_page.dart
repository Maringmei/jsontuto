import 'package:flutter/material.dart';

import 'modals/user.dart';

class DetailsPageComplex extends StatelessWidget {
 final dynamic jData;
 DetailsPageComplex(this.jData);

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
