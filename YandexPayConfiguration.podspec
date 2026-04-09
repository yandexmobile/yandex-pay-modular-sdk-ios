Pod::Spec.new do |s|
  s.name             = 'YandexPayConfiguration'
  s.version          = '0.0.3'
  s.summary          = 'YandexPayConfiguration — Yandex Pay SDK for iOS'
  s.homepage         = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license          = { :type => 'Proprietary' }
  s.author           = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source           = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'

  s.vendored_frameworks = [
    'XCFrameworks/YandexPayConfiguration.xcframework',
    'XCFrameworks/FintechSDKLoginAdapter.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework',
    'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework',
    'XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework'
  ]
end
