import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/Blocs/pay/pay_bloc.dart';

class GeneratePay extends StatelessWidget {
  const GeneratePay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PayBloc(),
      child: GeneratePayScreen(),
    );
  }
}

class GeneratePayScreen extends StatelessWidget {
  const GeneratePayScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayBloc, PayState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container();
      },
    );
  }
}
