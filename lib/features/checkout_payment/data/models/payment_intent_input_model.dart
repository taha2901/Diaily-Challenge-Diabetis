class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String cusomerId;

  PaymentIntentInputModel({
    required this.cusomerId,
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': '${amount}00', 
      'currency': currency,
      'customer': cusomerId,
    };
  }
}



// class PaymentIntentInputModel {
//   final String amount;
//   final String currency;
//   final String cusomerId;
//   final String? description;
//   final Map<String, String>? metadata;

//   PaymentIntentInputModel({
//     required this.cusomerId,
//     required this.amount,
//     required this.currency,
//     this.description,
//     this.metadata,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {
//       'amount': '${amount}00', // Stripe يتطلب المبلغ بالسنتات
//       'currency': currency.toLowerCase(),
//       'customer': cusomerId,
//     };

//     // إضافة الوصف إذا كان متاحاً
//     if (description != null && description!.isNotEmpty) {
//       data['description'] = description;
//     }

//     // إضافة البيانات الإضافية إذا كانت متاحة
//     if (metadata != null && metadata!.isNotEmpty) {
//       data['metadata'] = metadata;
//     }

//     // إعدادات إضافية للدفع
//     data['automatic_payment_methods'] = {'enabled': true};
//     data['confirmation_method'] = 'automatic';

//     return data;
//   }

//   // دالة مساعدة لإنشاء نموذج خاص بالمواعيد الطبية
//   factory PaymentIntentInputModel.forAppointment({
//     required String customerId,
//     required double appointmentFee,
//     required String doctorName,
//     required String appointmentDate,
//     required int appointmentId,
//     double serviceFee = 10.0,
//     String currency = 'USD',
//   }) {
//     final totalAmount = appointmentFee + serviceFee;
    
//     return PaymentIntentInputModel(
//       cusomerId: customerId,
//       amount: totalAmount.toInt().toString(),
//       currency: currency,
//       description: 'Medical appointment with $doctorName on $appointmentDate',
//       metadata: {
//         'type': 'medical_appointment',
//         'doctor_name': doctorName,
//         'appointment_date': appointmentDate,
//         'appointment_id': appointmentId.toString(),
//         'appointment_fee': appointmentFee.toStringAsFixed(2),
//         'service_fee': serviceFee.toStringAsFixed(2),
//         'total_amount': totalAmount.toStringAsFixed(2),
//       },
//     );
//   }

//   // نسخة من الكلاس للاستخدام في العرض
//   PaymentIntentInputModel copyWith({
//     String? amount,
//     String? currency,
//     String? cusomerId,
//     String? description,
//     Map<String, String>? metadata,
//   }) {
//     return PaymentIntentInputModel(
//       amount: amount ?? this.amount,
//       currency: currency ?? this.currency,
//       cusomerId: cusomerId ?? this.cusomerId,
//       description: description ?? this.description,
//       metadata: metadata ?? this.metadata,
//     );
//   }

//   @override
//   String toString() {
//     return 'PaymentIntentInputModel{amount: $amount, currency: $currency, customerId: $cusomerId, description: $description}';
//   }
// } 