import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_tumour_detector/core/services/stripe_key.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);

      // Present the payment sheet
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      // Handle Stripe-specific errors (e.g. cancellation)
      if (e.error.code == FailureCode.Canceled) {
        print('Payment cancelled by user');
      } else {
        print('Stripe error: ${e.error.localizedMessage}');
        throw Exception('Payment failed: ${e.error.localizedMessage}');
      }
    } catch (error) {
      print('Unexpected error: $error');
      throw Exception('Something went wrong during the payment process.');
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Ahmed',
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeKey.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
        },
      );
      return response.data['client_secret'];
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.data}');
      rethrow;
    }
  }
}
