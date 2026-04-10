Pod::Spec.new do |s|
  s.name             = 'YandexQuickPay'
  s.version          = '0.0.5'
  s.summary          = 'YandexQuickPay — Yandex Pay SDK for iOS'
  s.homepage         = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license          = { :type => 'Proprietary' }
  s.author           = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source           = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'

  s.vendored_frameworks = [
    'XCFrameworks/YandexQuickPay.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKQuickPayment.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKBDUIFeatures.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKBDUICore.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreAnalytics.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechPlusSDKInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechYBSDKInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNetworkImplementation.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNavigationInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNavigationImplementation.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework',
    'XCFrameworks/ExternalBduiAdapter.xcframework',
    'XCFrameworks/FintechBDUIWrapper.xcframework',
    'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework',
    'XCFrameworks/FintechSDKFontsAdapter.xcframework',
    'XCFrameworks/FintechSDKLoginAdapter.xcframework',
    'XCFrameworks/FintechSDKRealTimeAnalyticsAdapter.xcframework',
    'XCFrameworks/FintechSDKRealUserMonitoringAdapter.xcframework',
    'XCFrameworks/YandexPayConfiguration.xcframework'
  ]
end
