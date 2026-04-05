Pod::Spec.new do |s|
  s.name             = 'YandexPaySDK'
  s.version          = '0.0.1'
  s.summary          = 'Yandex Pay SDK for iOS'
  s.homepage         = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license          = { :type => 'Proprietary' }
  s.author           = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source           = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'

  s.vendored_frameworks = [
    'XCFrameworks/YandexPaySDK.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKMerchantRedirect.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayBoxEntity.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayBoxResources.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayOrderData.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayMerchantData.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKRedirectScenario.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayFormFeatures.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayButton.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayBadge.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayWidget.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKUltimateWidget.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKBDUICore.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKBDUIFeatures.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNetworkImplementation.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreAnalytics.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework',
    'XCFrameworks/FintechSDK/FintechPlusSDKInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechYBSDKInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework',
    'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework',
    'XCFrameworks/FintechSDKFontsAdapter.xcframework',
    'XCFrameworks/ExternalBduiAdapter.xcframework',
    'XCFrameworks/FintechBDUIWrapper.xcframework',
    'XCFrameworks/FintechSDKRealTimeAnalyticsAdapter.xcframework',
    'XCFrameworks/FintechSDKRealUserMonitoringAdapter.xcframework',
    'XCFrameworks/FintechSDKLoginAdapter.xcframework',
    'XCFrameworks/YandexPayConfiguration.xcframework'
  ]
end
