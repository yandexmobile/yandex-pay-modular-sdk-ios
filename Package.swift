// swift-tools-version: 5.9
// Auto-generated

import PackageDescription

let package = Package(
  name: "YandexPayModularSDK",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "YandexPayConfiguration", targets: ["YandexPayConfigurationWrapper"]),
    .library(name: "YandexPayAuth", targets: ["YandexPayAuthWrapper"]),
    .library(name: "YandexPayAssistant", targets: ["YandexPayAssistantWrapper"]),
    .library(name: "YandexQuickPay", targets: ["YandexQuickPayWrapper"]),
  ],
  targets: [
    .target(
      name: "YandexPayConfigurationWrapper",
      dependencies: [
        "YandexPayConfiguration",
        "FintechSDKLoginAdapter",
        "FintechSDKAuthInterfaces",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKCommonEntity",
        "FintechSDKCoreUI",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUtils",
        "FintechSDKNetworkInterfaces",
      ],
      path: "Sources/YandexPayConfigurationWrapper"
    ),
    .target(
      name: "YandexPayAuthWrapper",
      dependencies: [
        "YandexPayAuth",
        "YandexPayConfiguration",
        "FintechSDKLoginAdapter",
        "FintechSDKAuthInterfaces",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKAnalyticsInterfaces",
        "FintechSDKCoreUtils",
        "FintechSDKCommonEntity",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUI",
        "FintechSDKNetworkInterfaces",
      ],
      path: "Sources/YandexPayAuthWrapper"
    ),
    .target(
      name: "YandexPayAssistantWrapper",
      dependencies: [
        "YandexPayAssistant",
        "FintechSDKAssistant",
        "FintechSDKAuthInterfaces",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKLoaderScreen",
        "FintechSDKBDUIFeatures",
        "FintechSDKBDUICore",
        "FintechSDKCommonEntity",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUI",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAnalyticsInterfaces",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKWebViewFeatures",
        "FintechSDKRemoteResourcesData",
        "FintechSDKNativeErrorFeature",
        "FintechSDKPayBoxResources",
        "ExternalBduiAdapter",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "FintechSDKLoginAdapter",
        "YandexPayConfiguration",
      ],
      path: "Sources/YandexPayAssistantWrapper"
    ),
    .target(
      name: "YandexQuickPayWrapper",
      dependencies: [
        "YandexQuickPay",
        "FintechSDKQuickPayment",
        "FintechSDKPollingScenario",
        "FintechSDKAuthInterfaces",
        "FintechSDKBDUIFeatures",
        "FintechSDKBDUICore",
        "FintechSDKCommonEntity",
        "FintechSDKFontsInterfaces",
        "FintechSDKCoreUI",
        "FintechSDKCoreUtils",
        "FintechSDKCoreAnalytics",
        "FintechSDKAnalyticsInterfaces",
        "FintechPlusSDKInterfaces",
        "FintechYBSDKInterfaces",
        "FintechSDKNetworkInterfaces",
        "FintechSDKNetworkImplementation",
        "FintechSDKDivKitWidgetsFeatures",
        "FintechSDKRemoteResourcesData",
        "FintechSDKAuthCoreImplementation",
        "FintechSDKAuthorizationScenario",
        "FintechSDKNativeErrorFeature",
        "FintechSDKLoaderScreen",
        "FintechSDKNavigationInterfaces",
        "FintechSDKNavigationImplementation",
        "FintechSDKWebViewFeatures",
        "ExternalBduiAdapter",
        "FintechBDUIWrapper",
        "FintechSDKAppMetricaAdapter",
        "FintechSDKFontsAdapter",
        "FintechSDKLoginAdapter",
        "FintechSDKRealTimeAnalyticsAdapter",
        "FintechSDKRealUserMonitoringAdapter",
        "YandexPayConfiguration",
      ],
      path: "Sources/YandexQuickPayWrapper"
    ),
    .binaryTarget(
      name: "FintechSDKLoginAdapter",
      path: "XCFrameworks/FintechSDKLoginAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAuthInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAppMetricaAdapter",
      path: "XCFrameworks/FintechSDKAppMetricaAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAnalyticsInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKFontsAdapter",
      path: "XCFrameworks/FintechSDKFontsAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKFontsInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRealTimeAnalyticsAdapter",
      path: "XCFrameworks/FintechSDKRealTimeAnalyticsAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRealUserMonitoringAdapter",
      path: "XCFrameworks/FintechSDKRealUserMonitoringAdapter.xcframework"
    ),
    .binaryTarget(
      name: "ExternalBduiAdapter",
      path: "XCFrameworks/ExternalBduiAdapter.xcframework"
    ),
    .binaryTarget(
      name: "FintechBDUIWrapper",
      path: "XCFrameworks/FintechBDUIWrapper.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKBDUICore",
      path: "XCFrameworks/FintechSDK/FintechSDKBDUICore.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKBDUIFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKBDUIFeatures.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNetworkInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCoreUtils",
      path: "XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework"
    ),
    .binaryTarget(
      name: "FintechPlusSDKInterfaces",
      path: "XCFrameworks/FintechSDK/FintechPlusSDKInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCoreAnalytics",
      path: "XCFrameworks/FintechSDK/FintechSDKCoreAnalytics.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCoreUI",
      path: "XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKCommonEntity",
      path: "XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNetworkImplementation",
      path: "XCFrameworks/FintechSDK/FintechSDKNetworkImplementation.xcframework"
    ),
    .binaryTarget(
      name: "FintechYBSDKInterfaces",
      path: "XCFrameworks/FintechSDK/FintechYBSDKInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRemoteResourcesData",
      path: "XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayConfiguration",
      path: "XCFrameworks/YandexPayConfiguration.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayAuth",
      path: "XCFrameworks/YandexPayAuth.xcframework"
    ),
    .binaryTarget(
      name: "YandexPaySDK",
      path: "XCFrameworks/YandexPaySDK.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKMerchantRedirect",
      path: "XCFrameworks/FintechSDK/FintechSDKMerchantRedirect.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPollingScenario",
      path: "XCFrameworks/FintechSDK/FintechSDKPollingScenario.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayBoxEntity",
      path: "XCFrameworks/FintechSDK/FintechSDKPayBoxEntity.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayBoxResources",
      path: "XCFrameworks/FintechSDK/FintechSDKPayBoxResources.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayOrderData",
      path: "XCFrameworks/FintechSDK/FintechSDKPayOrderData.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayMerchantData",
      path: "XCFrameworks/FintechSDK/FintechSDKPayMerchantData.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKRedirectScenario",
      path: "XCFrameworks/FintechSDK/FintechSDKRedirectScenario.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayFormFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKPayFormFeatures.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayButton",
      path: "XCFrameworks/FintechSDK/FintechSDKPayButton.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayBadge",
      path: "XCFrameworks/FintechSDK/FintechSDKPayBadge.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKPayWidget",
      path: "XCFrameworks/FintechSDK/FintechSDKPayWidget.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKUltimateWidget",
      path: "XCFrameworks/FintechSDK/FintechSDKUltimateWidget.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAuthCoreImplementation",
      path: "XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAuthorizationScenario",
      path: "XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNativeErrorFeature",
      path: "XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKDivKitWidgetsFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKWebViewFeatures",
      path: "XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKLoaderScreen",
      path: "XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework"
    ),
    .binaryTarget(
      name: "YandexPayAssistant",
      path: "XCFrameworks/YandexPayAssistant.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKAssistant",
      path: "XCFrameworks/FintechSDK/FintechSDKAssistant.xcframework"
    ),
    .binaryTarget(
      name: "YandexQuickPay",
      path: "XCFrameworks/YandexQuickPay.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKQuickPayment",
      path: "XCFrameworks/FintechSDK/FintechSDKQuickPayment.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNavigationInterfaces",
      path: "XCFrameworks/FintechSDK/FintechSDKNavigationInterfaces.xcframework"
    ),
    .binaryTarget(
      name: "FintechSDKNavigationImplementation",
      path: "XCFrameworks/FintechSDK/FintechSDKNavigationImplementation.xcframework"
    ),
  ]
)
