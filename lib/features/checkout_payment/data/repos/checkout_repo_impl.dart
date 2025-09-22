  import 'package:dartz/dartz.dart';
  import 'package:challenge_diabetes/core/errors/failures.dart';
  import 'package:challenge_diabetes/core/helpers/stripe_service.dart';
  import 'package:challenge_diabetes/features/checkout_payment/data/models/payment_intent_input_model.dart';
  import 'package:challenge_diabetes/features/checkout_payment/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
    final StripeService stripeService = StripeService();
    @override
    Future<Either<Failure, void>> makePayment(
        {required PaymentIntentInputModel paymentIntentInputModel}) async {
      try {
        await stripeService.makePayment(
            paymentIntentInputModel: paymentIntentInputModel);

        return right(null);
      } catch (e) {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }