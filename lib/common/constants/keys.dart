import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppKeys {
  static String get stripePublishableKey => dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  static String get stripeSecretKey => dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  static String get mailBoxLayerKey => dotenv.env['MAIL_BOX_LAYER_KEY'] ?? '';
}
