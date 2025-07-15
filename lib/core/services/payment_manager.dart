import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_tumour_detector/core/services/stripe_key.dart';

abstract class PaymentManager {
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet(); // Display payment sheet
    } catch (error) {
      throw Exception(error.toString());
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

  // Get client secret from Stripe API
  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents', // Use HTTPS
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeKey.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount, // Amount in cents (e.g., 1000 = $10.00)
          'currency': currency, // Currency code (e.g., 'usd')
        },
      );
      return response.data['client_secret']; // Correct field name
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.data}'); // Log the full error response
      rethrow;
    }
  }
}
