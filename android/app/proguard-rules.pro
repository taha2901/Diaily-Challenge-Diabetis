# Stripe SDK - Prevent R8 from removing required classes
-keep class com.stripe.android.** { *; }
-dontwarn com.stripe.android.**

-keep class com.reactnativestripesdk.** { *; }
-dontwarn com.reactnativestripesdk.**

# PushProvisioning specific classes
-keep class com.stripe.android.pushProvisioning.** { *; }
-dontwarn com.stripe.android.pushProvisioning.**
