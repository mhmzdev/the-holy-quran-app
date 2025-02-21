part of '../app.dart';

extension SuperDouble on double {
  // double un() => AppUnit.un(this);
  // double sp() => AppUnit.sp(this);
  // double font() => AppUnit.font(this);

  BorderRadius radius() => BorderRadius.circular(this);

  /// totalFee includes payment tax and platform fee as well
  double get totalFee => this + paymentTax + platformFee;

  /// Stripe charges: (2.9% of base fee) + .30 cents
  double get paymentTax => (this * 0.029) + 0.3;

  /// 2.1% of base fee
  double get platformFee => this * 0.021;
}
