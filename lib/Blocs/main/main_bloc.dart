import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_evertec/Controllers/Services/interactor.dart';
import 'package:test_evertec/Models/Basics/amount.dart';
import 'package:test_evertec/Models/Basics/card.dart';
import 'package:test_evertec/Models/Basics/instrument.dart';
import 'package:test_evertec/Models/Basics/payment.dart';
import 'package:test_evertec/Models/Services/Information/request.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(UnAuthenticated());
  ServiceInteractor interactor = ServiceInteractor();
  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoginSuccessEvent) {
      yield Authenticated();
    }
    if (event is GenerateNewPay) {
      yield MainGeneratePay();
    }
  }

  Stream<MainState> _mapAppStartedToState() async* {
    InformationRequest send = InformationRequest(
        auth: await interactor.generateAuth(),
        instrument: Instrument(
          card: Card(number: "36545400000008"),
        ),
        payment: Payment(
            reference: "testing_12",
            amount: Amount(total: 12.10, currency: "USD")));
    await interactor.postInformation(send);
  }
}
