import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:nonce/nonce.dart';
import 'package:test_evertec/Controllers/Services/factory.dart';
import 'package:test_evertec/Models/Basics/auth.dart';
import 'package:test_evertec/Models/Services/GenerationOtp/request.dart';
import 'package:test_evertec/Models/Services/GenerationOtp/response.dart';
import 'package:test_evertec/Models/Services/Information/request.dart';
import 'package:test_evertec/Models/Services/Information/response.dart';
import 'package:test_evertec/Models/Services/Interest/request.dart';
import 'package:test_evertec/Models/Services/Interest/response.dart';
import 'package:test_evertec/Models/Services/ProcessTransaction/request.dart';
import 'package:test_evertec/Models/Services/ProcessTransaction/response.dart';
import 'package:test_evertec/Models/Services/QueryTransaction/request.dart';
import 'package:test_evertec/Models/Services/QueryTransaction/response.dart';
import 'package:test_evertec/Models/Services/ReverseTransaction/request.dart';
import 'package:test_evertec/Models/Services/ReverseTransaction/response.dart';
import 'package:test_evertec/Models/Services/SafeProcessTransaction/request.dart';
import 'package:test_evertec/Models/Services/SafeProcessTransaction/response.dart';
import 'package:test_evertec/Models/Services/ValidationOtp/request.dart';
import 'package:test_evertec/Models/Services/ValidationOtp/response.dart';
import 'package:test_evertec/Models/Services/search/request.dart';
import 'package:test_evertec/Models/Services/search/response.dart';
import 'package:test_evertec/Models/Services/tokenize/request.dart';
import 'package:test_evertec/Models/Services/tokenize/response.dart';

class ServiceInteractor extends ServiceFactory {
  final Codec<String, String> stringToBase64 = utf8.fuse(base64);
  Future<Auth> generateAuth() async {
    var seed = DateTime.now().toIso8601String();
    var nonce = Nonce.generate();

    return Auth(
        login: login,
        nonce: stringToBase64.encode(nonce),
        seed: seed,
        tranKey: getTranKey(nonce, seed));
  }

  String getTranKey(nonce, seed) {
    String credentials = nonce + seed + tranKey;
    var newCredentials = utf8.encode(credentials);
    var sha256String = sha256.convert(newCredentials);
    print(sha256String);
    var encoded = base64Encode(sha256String.bytes);
    return encoded;
  }

  /*  Este servicio proporciona información sobre la tarjeta del usuario que se 
  va a procesar, tal como qué servicios son los que se usarán para ella y los tipos
  de crédito, si aplica, que hay para esta, si no hay tipos de crédito se retorna 
  un arreglo vacío y si los hay, se debe iterar cada tipo de crédito con los installments 
  que se encuentran en el arreglo.*/
  Future<InformationResponse> postInformation(InformationRequest send) async {
    String response = await handleMethod(
      "POST",
      routeInformation,
      send: send.toRawJson(),
    );
    var object = InformationResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Este servicio se debe consumir si la tarjeta requiere que se muestren los 
  intereses (displayInterest en true) y como ejemplo de esta manera se muestran
  los valores en el servicio de redirección*/
  Future<InterestResponse> postInterest(InterestRequest send) async {
    String response = await handleMethod(
      "POST",
      routeInterest,
      send: send.toRawJson(),
    );
    var object = InterestResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Este servicio se consume si es necesario el otp para la tarjeta provista por 
  el cliente (requireOtp en true) y debe permitirsele al usuario ingresar el OTP 
  para enviarlo posteriormente en el servicio de procesamiento, a manera de ejemplo
  de esta manera se captura en la interfaz de redirección*/
  Future<GenerationOtpResponse> postGenerationOtp(
      GenerationOtpRequest send) async {
    String response = await handleMethod(
      "POST",
      routeOtp + routeGenerate,
      send: send.toRawJson(),
    );
    var object = GenerationOtpResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Permite validar que el OTP provisto concuerde con el enviado por el proveedor,
  de ser así se retornará un valor “signature” que debe enviarse en la petición
  de procesamiento como “otp” esto con el fin de que se tome en cuenta a la hora
  de analizar la transacción por los filtros de seguridad*/
  Future<ValidationOtpResponse> postValidationOtp(
      ValidationOtpRequest send) async {
    String response = await handleMethod(
      "POST",
      routeOtp + routeValidate,
      send: send.toRawJson(),
    );
    var object = ValidationOtpResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Este servicio permite que se realice el cobro a la tarjeta del usuario, los
  parámetros del instrument son variables, si no se pide tipo de crédito ni otp
  no es necesario enviar esas variables, payer es siempre requerido, buyer es 
  opcional pero recomendado.
  Por cuestiones de certificación, especialmente con Interdin es necesario 
  mostrarle una vez terminado el proceso la respuesta al usuario, este es un ejemplo 
  de como se muestra en redirección, la forma no importa tanto como los datos 
  que deben estar presentes.*/
  Future<ProcessTransactionResponse> postProcessTransaction(
      ProcessTransactionRequest send) async {
    String response = await handleMethod(
      "POST",
      routeProcess,
      send: send.toRawJson(),
    );
    var object = ProcessTransactionResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Método de procesamiento que requiere que se envíe el OTP, se puede enviar 
  como el endpoint anterior (Previamente validado) o se puede enviar el valor 
  que envía el usuario para que se haga la validación interna, solo debe usarse 
  con tarjetas que en el servicio de obtención de información requieran OTP.*/
  Future<SafeProcessTransactionResponse> postSafeProcessTransaction(
      SafeProcessTransactionRequest send) async {
    String response = await handleMethod(
      "POST",
      routeSafeProcess,
      send: send.toRawJson(),
    );
    var object = SafeProcessTransactionResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Consulta el estado de la transaccion*/
  Future<QueryTransactionResponse> postQueryTransaction(
      QueryTransactionRequest send) async {
    String response = await handleMethod(
      "POST",
      routeQuery,
      send: send.toRawJson(),
    );
    var object = QueryTransactionResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Solicita la reversion de una transaccion*/
  Future<ReverseTransactionResponse> postReverseTransaction(
      ReverseTransactionRequest send) async {
    String response = await handleMethod(
      "POST",
      routeReverseTransaction,
      send: send.toRawJson(),
    );
    var object = ReverseTransactionResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Este servicio permite almacenar tarjetas de crédito de manera segura, a 
  través de una petición que contenga la información de la misma, se generará 
  un token que puede ser usado en el servicio de procesamiento y para todos los 
  efectos, en PlacetoPay equivale a una tarjeta de crédito, la diferencia es que 
  se envía la estructura token en vez de card.
  Previamente al consumo de este servicio se debe consultar el de información 
  para saber si es necesario o no generar un OTP al cliente y en caso de ser 
  necesario, solicitar el token a la persona y enviarlo en el consumo.*/
  Future<TokenizeResponse> postTokenize(TokenizeRequest send) async {
    String response = await handleMethod(
      "POST",
      routeTokenize,
      send: send.toRawJson(),
    );
    var object = TokenizeResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }

  /*Este servicio permite la búsqueda de transacciones por referencia y monto, 
  suele utilizarse en caso de pérdida de comunicación al crear una transacción 
  para obtener la referencia interna nuevamente.*/
  Future<SearchResponse> postSearch(SearchRequest send) async {
    String response = await handleMethod(
      "POST",
      routeSearch,
      send: send.toRawJson(),
    );
    var object = SearchResponse.fromJson(json.decode(response));
    print(object);
    return object;
  }
}
