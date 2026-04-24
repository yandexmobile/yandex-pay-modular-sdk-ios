Pod::Spec.new do |s|
  s.name                  = 'YandexPayModularSDK'
  s.version               = '0.2.2'
  s.summary               = 'Yandex Pay Modular SDK for iOS'
  s.homepage              = 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios'
  s.license               = { :type => 'Proprietary' }
  s.author                = { 'Yandex' => 'mobile@yandex-team.ru' }
  s.source                = { :git => 'https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '15.0'
  s.pod_target_xcconfig   = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }
  s.user_target_xcconfig  = { 'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO' }

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

  s.subspec 'YandexPaySDK' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPaySDK.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKMerchantRedirect'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayBoxEntity'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayBoxResources'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayOrderData'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayMerchantData'
    ss.dependency 'YandexPayModularSDK/FintechSDKRedirectScenario'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayFormFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayButton'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayBadge'
    ss.dependency 'YandexPayModularSDK/FintechSDKPayWidget'
    ss.dependency 'YandexPayModularSDK/FintechSDKUltimateWidget'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUI'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKBDUICore'
    ss.dependency 'YandexPayModularSDK/FintechSDKBDUIFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkImplementation'
    ss.dependency 'YandexPayModularSDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreAnalytics'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPayModularSDK/FintechSDKNativeErrorFeature'
    ss.dependency 'YandexPayModularSDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPayModularSDK/FintechSDKDivKitWidgetsFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPayModularSDK/FintechPlusSDKInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechYBSDKInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoaderScreen'
    ss.dependency 'YandexPayModularSDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPayModularSDK/ExternalBduiAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKRealTimeAnalyticsAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKRealUserMonitoringAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPayModularSDK/YandexPayConfiguration'
  end

  s.subspec 'FintechSDKMerchantRedirect' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKMerchantRedirect.xcframework'
  end

  s.subspec 'FintechSDKPayBoxEntity' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayBoxEntity.xcframework'
  end

  s.subspec 'FintechSDKPayBoxResources' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayBoxResources.xcframework'
  end

  s.subspec 'FintechSDKPayOrderData' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayOrderData.xcframework'
  end

  s.subspec 'FintechSDKPayMerchantData' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayMerchantData.xcframework'
  end

  s.subspec 'FintechSDKRedirectScenario' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKRedirectScenario.xcframework'
  end

  s.subspec 'FintechSDKPayFormFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayFormFeatures.xcframework'
  end

  s.subspec 'FintechSDKPayButton' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayButton.xcframework'
  end

  s.subspec 'FintechSDKPayBadge' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayBadge.xcframework'
  end

  s.subspec 'FintechSDKPayWidget' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKPayWidget.xcframework'
  end

  s.subspec 'FintechSDKUltimateWidget' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKUltimateWidget.xcframework'
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

  s.subspec 'FintechSDKDivKitWidgetsFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKDivKitWidgetsFeatures.xcframework'
  end

  s.subspec 'FintechSDKWebViewFeatures' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKWebViewFeatures.xcframework'
  end

  s.subspec 'FintechSDKLoaderScreen' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKLoaderScreen.xcframework'
  end

  s.subspec 'YandexPayAssistant' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayAssistant.xcframework'
    ss.dependency 'YandexPayModularSDK/FintechSDKAssistant'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthCoreImplementation'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthorizationScenario'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoaderScreen'
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
    ss.dependency 'YandexPayModularSDK/FintechSDKWebViewFeatures'
    ss.dependency 'YandexPayModularSDK/FintechSDKRemoteResourcesData'
    ss.dependency 'YandexPayModularSDK/ExternalBduiAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPayModularSDK/YandexPayConfiguration'
  end

  s.subspec 'FintechSDKAssistant' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKAssistant.xcframework'
  end

  s.subspec 'FintechSDKQuickPayment' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKQuickPayment.xcframework'
  end

  s.subspec 'FintechSDKNavigationInterfaces' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNavigationInterfaces.xcframework'
  end

  s.subspec 'FintechSDKNavigationImplementation' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/FintechSDK/FintechSDKNavigationImplementation.xcframework'
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
    ss.dependency 'YandexPayModularSDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUI'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkInterfaces'
    ss.script_phase = {
      :name => 'Embed YandexPayConfiguration Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPayModularSDK:YandexPayConfiguration" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPayModularSDK:YandexPayConfiguration\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPayModularSDK:YandexPayConfiguration\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

  s.subspec 'YandexPayAuth' do |ss|
    ss.vendored_frameworks = 'XCFrameworks/YandexPayAuth.xcframework'
    ss.dependency 'YandexPayModularSDK/YandexPayConfiguration'
    ss.dependency 'YandexPayModularSDK/FintechSDKLoginAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAuthInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKAppMetricaAdapter'
    ss.dependency 'YandexPayModularSDK/FintechSDKAnalyticsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUtils'
    ss.dependency 'YandexPayModularSDK/FintechSDKCommonEntity'
    ss.dependency 'YandexPayModularSDK/FintechSDKFontsInterfaces'
    ss.dependency 'YandexPayModularSDK/FintechSDKCoreUI'
    ss.dependency 'YandexPayModularSDK/FintechSDKNetworkInterfaces'
    ss.script_phase = {
      :name => 'Embed YandexPayAuth Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPayModularSDK:YandexPayAuth" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPayModularSDK:YandexPayAuth\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayAuth/YandexPayAuth.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayAuth/YandexPayAuth.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPayModularSDK:YandexPayAuth\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
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
    ss.script_phase = {
      :name => 'Embed YandexQuickPay Runtime Frameworks',
      :script => <<-'SCRIPT'
      set -e
      SUPPORT_FILES_DIR="${PODS_ROOT}/Target Support Files"
      for frameworks_script in "${SUPPORT_FILES_DIR}"/Pods-*/*-frameworks.sh; do
        [ -f "${frameworks_script}" ] || continue
        if grep -Fq "# BEGIN YandexPayModularSDK:YandexQuickPay" "${frameworks_script}"; then
          continue
        fi
        printf "\n# BEGIN YandexPayModularSDK:YandexQuickPay\n" >> "${frameworks_script}"
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexQuickPay/YandexQuickPay.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexQuickPay/YandexQuickPay.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKQuickPayment/FintechSDKQuickPayment.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKQuickPayment/FintechSDKQuickPayment.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthInterfaces/FintechSDKAuthInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKBDUIFeatures/FintechSDKBDUIFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKBDUICore/FintechSDKBDUICore.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCommonEntity/FintechSDKCommonEntity.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsInterfaces/FintechSDKFontsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUI/FintechSDKCoreUI.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreUtils/FintechSDKCoreUtils.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKCoreAnalytics/FintechSDKCoreAnalytics.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAnalyticsInterfaces/FintechSDKAnalyticsInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechPlusSDKInterfaces/FintechPlusSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechYBSDKInterfaces/FintechYBSDKInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkInterfaces/FintechSDKNetworkInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNetworkImplementation/FintechSDKNetworkImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKDivKitWidgetsFeatures/FintechSDKDivKitWidgetsFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKRemoteResourcesData/FintechSDKRemoteResourcesData.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthCoreImplementation/FintechSDKAuthCoreImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAuthorizationScenario/FintechSDKAuthorizationScenario.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNativeErrorFeature/FintechSDKNativeErrorFeature.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoaderScreen/FintechSDKLoaderScreen.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNavigationInterfaces/FintechSDKNavigationInterfaces.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNavigationInterfaces/FintechSDKNavigationInterfaces.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNavigationImplementation/FintechSDKNavigationImplementation.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKNavigationImplementation/FintechSDKNavigationImplementation.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKWebViewFeatures/FintechSDKWebViewFeatures.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/ExternalBduiAdapter/ExternalBduiAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechBDUIWrapper/FintechBDUIWrapper.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechBDUIWrapper/FintechBDUIWrapper.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKAppMetricaAdapter/FintechSDKAppMetricaAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKFontsAdapter/FintechSDKFontsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKLoginAdapter/FintechSDKLoginAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKRealTimeAnalyticsAdapter/FintechSDKRealTimeAnalyticsAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/FintechSDKRealUserMonitoringAdapter/FintechSDKRealUserMonitoringAdapter.framework"\n' >> "${frameworks_script}"
        fi
        if ! grep -Fq '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayConfiguration/YandexPayConfiguration.framework"' "${frameworks_script}"; then
          printf '  install_framework "${PODS_XCFRAMEWORKS_BUILD_DIR}/YandexPayModularSDK/YandexPayConfiguration/YandexPayConfiguration.framework"\n' >> "${frameworks_script}"
        fi
        printf 'if [ "${COCOAPODS_PARALLEL_CODE_SIGN}" == "true" ]; then\n  wait\nfi\n' >> "${frameworks_script}"
        printf '# END YandexPayModularSDK:YandexQuickPay\n' >> "${frameworks_script}"
      done
    SCRIPT
    }
  end

end
