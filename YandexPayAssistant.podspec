Pod::Spec.new do |s|
  s.name                  = 'YandexPayAssistant'
  s.version               = '0.3.5'
  s.summary               = 'YandexPayAssistant — Yandex Pay Modular SDK for iOS'
  s.homepage              = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license               = { :type => 'Proprietary' }
  s.author                = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source                = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'
  s.pod_target_xcconfig   = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }
  s.user_target_xcconfig  = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }
  s.vendored_frameworks   = [
    'XCFrameworks/YandexPayAssistant.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAssistant.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework',
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
    'XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKPayBoxResources.xcframework',
    'XCFrameworks/ExternalBduiAdapter.xcframework',
    'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework',
    'XCFrameworks/FintechSDKFontsAdapter.xcframework',
    'XCFrameworks/FintechSDKLoginAdapter.xcframework',
    'XCFrameworks/YandexPayConfiguration.xcframework'
  ]
end
