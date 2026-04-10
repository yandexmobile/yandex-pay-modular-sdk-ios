Pod::Spec.new do |s|
  s.name                  = 'YandexPayModularSDK'
  s.version               = '0.0.5'
  s.summary               = 'Yandex Pay Modular SDK for iOS'
  s.homepage              = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license               = { :type => 'Proprietary' }
  s.author                = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source                = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'

  # Internal xcframework subspecs — installed only as transitive deps of product subspecs.
  # Each corresponds to one .binaryTarget in Package.swift.

  s.subspec 'FintechSDKLoginAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKLoginAdapter.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
  end

  s.subspec 'FintechSDKAuthInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAuthInterfaces.xcframework'
  end

  s.subspec 'FintechSDKAppMetricaAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKAppMetricaAdapter.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'FintechSDKAnalyticsInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAnalyticsInterfaces.xcframework'
  end

  s.subspec 'FintechSDKFontsAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKFontsAdapter.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsInterfaces'
  end

  s.subspec 'FintechSDKFontsInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKFontsInterfaces.xcframework'
  end

  s.subspec 'FintechSDKRealTimeAnalyticsAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKRealTimeAnalyticsAdapter.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'FintechSDKRealUserMonitoringAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDKRealUserMonitoringAdapter.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'ExternalBduiAdapter' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/ExternalBduiAdapter.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechBDUIWrapper'
    ss.dependency 'YandexPayModularSDK/FintechSDKBDUICore'
    ss.dependency 'YandexPayModularSDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPayModularSDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUI'
    ss.dependency 'YandexPayModularSDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPayModularSDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKRemoteResourcesData'
  end

  s.subspec 'FintechBDUIWrapper' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechBDUIWrapper.xcframework'
  end

  s.subspec 'FintechSDKBDUICore' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKBDUICore.xcframework'
  end

  s.subspec 'FintechSDKBDUIFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKBDUIFeatures.xcframework'
  end

  s.subspec 'FintechSDKNetworkInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNetworkInterfaces.xcframework'
  end

  s.subspec 'FintechSDKCoreUtils' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCoreUtils.xcframework'
  end

  s.subspec 'FintechPlusSDKInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechPlusSDKInterfaces.xcframework'
  end

  s.subspec 'FintechSDKCoreAnalytics' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCoreAnalytics.xcframework'
  end

  s.subspec 'FintechSDKCoreUI' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCoreUI.xcframework'
  end

  s.subspec 'FintechSDKCommonEntity' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKCommonEntity.xcframework'
  end

  s.subspec 'FintechSDKNetworkImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNetworkImplementation.xcframework'
  end

  s.subspec 'FintechYBSDKInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechYBSDKInterfaces.xcframework'
  end

  s.subspec 'FintechSDKRemoteResourcesData' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKRemoteResourcesData.xcframework'
  end

  s.subspec 'FintechSDKQuickPayment' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKQuickPayment.xcframework'
  end

  s.subspec 'FintechSDKDivKitWidgetsFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework'
  end

  s.subspec 'FintechSDKAuthCoreImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAuthCoreImplementation.xcframework'
  end

  s.subspec 'FintechSDKAuthorizationScenario' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAuthorizationScenario.xcframework'
  end

  s.subspec 'FintechSDKNativeErrorFeature' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNativeErrorFeature.xcframework'
  end

  s.subspec 'FintechSDKLoaderScreen' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework'
  end

  s.subspec 'FintechSDKNavigationInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNavigationInterfaces.xcframework'
  end

  s.subspec 'FintechSDKNavigationImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNavigationImplementation.xcframework'
  end

  s.subspec 'FintechSDKWebViewFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework'
  end

  # Consumer product subspecs — use these in your Podfile.
  # pod 'YandexPayModularSDK/YandexPayAuth'
  # pod 'YandexPayModularSDK/YandexQuickPay'

  s.subspec 'YandexPayConfiguration' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayConfiguration.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'YandexPayAuth' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayAuth.xcframework'
    ss.dependency 'YandexPayModularSDK/YandexPayConfiguration'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
  end

  s.subspec 'YandexQuickPay' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexQuickPay.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKQuickPayment'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKBDUICore'
    ss.dependency 'YandexPayModularSDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUI'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPayModularSDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPayModularSDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPayModularSDK/FintechSDKNavigationInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKNavigationImplementation'
    ss.dependency 'YandexPayModularSDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPayModularSDK/ExternalBduiAdapter'
    ss.dependency 'YandexPayModularSDK/FintechBDUIWrapper'
    ss.dependency 'YandexPayModularSDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPayModularSDK/YandexPayConfiguration'
  end

end
