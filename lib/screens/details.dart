import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/productdetails_bloc.dart';

class DetailsWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Text(""),
        child: BlocBuilder<ProductdetailsBloc, ProductdetailsState>(
            builder: (context, state) {
          print(state.props);
          return Center(child: Text("$state"));
        }),
      ),
    );
  }
}
