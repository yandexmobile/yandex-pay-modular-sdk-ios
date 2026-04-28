Pod::Spec.new do |s|
  s.name                  = 'YandexPayConfiguration'
  s.version               = '0.3.4'
  s.summary               = 'YandexPayConfiguration — Yandex Pay Modular SDK for iOS'
  s.homepage              = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license               = { :type => 'Proprietary' }
  s.author                = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source                = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'
  s.pod_target_xcconfig   = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }
  s.user_target_xcconfig  = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }
  s.vendored_frameworks   = [
    'XCFrameworks/YandexPayConfiguration.xcframework',
    'XCFrameworks/FintechSDKLoginAdapter.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework',
    'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework'
  ]
end
