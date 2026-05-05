# Pre-Stable Yandex Pay Modular SDK — Руководство по интеграции для iOS

## Требования

- iOS 15.0+
- Swift 5.9+
- Xcode 16.4+

## Содержание

1. [Установка](#установка)
2. [Настройка проекта](#настройка-проекта)
   - [Client ID](#1-client-id)
   - [URL-схемы](#2-url-схемы)
   - [Инициализация](#3-инициализация)
   - [Контекст представления](#4-контекст-представления)
   - [Обработка диплинков](#5-обработка-диплинков)
3. [YandexPayAuth — авторизация](#yandexpayauth--авторизация)
4. [YandexQuickPay — быстрая оплата](#yandexquickpay--быстрая-оплата)
5. [YandexPayAssistant — ассистент](#yandexpayassistant--ассистент)

---

## Установка

### Swift Package Manager

В файле `Package.swift` добавьте зависимость от репозитория:

```swift
dependencies: [
    .package(
        url: "https://github.com/yandexmobile/yandex-pay-modular-sdk-ios.git",
        from: "1.0.0"
    )
]
```

Затем добавьте нужные продукты к цели:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "YandexPayAuth",      package: "yandex-pay-modular-sdk-ios"),
        .product(name: "YandexQuickPay",     package: "yandex-pay-modular-sdk-ios"),
        .product(name: "YandexPayAssistant", package: "yandex-pay-modular-sdk-ios"),
    ]
)
```

`YandexPayConfiguration` подключается транзитивно через `YandexPayAuth` и `YandexQuickPay` — добавлять его явно не нужно.

Либо добавьте зависимость через Xcode: **File → Add Package Dependencies…**, вставьте URL репозитория и выберите нужные продукты в диалоге.

Доступные продукты:

| Продукт | Назначение |
|---|---|
| `YandexPayAuth` | Авторизация через Яндекс ID |
| `YandexQuickPay` | Виджеты и API быстрой оплаты |
| `YandexPayAssistant` | Виджеты ассистента Yandex Pay |

### CocoaPods

```ruby
pod 'YandexPayModularSDK/YandexPayAuth'      # при необходимости
pod 'YandexPayModularSDK/YandexQuickPay'     # при необходимости
pod 'YandexPayModularSDK/YandexPayAssistant' # при необходимости
```

SDK использует единый umbrella-подспек `YandexPayModularSDK` с одним сабспеком на каждый xcframework. CocoaPods устанавливает каждый xcframework ровно один раз независимо от того, сколько модулей его используют — точно так же, как SPM деплицирует `.binaryTarget`-ы.

---

## Настройка проекта

### 1. Client ID

SDK использует до двух идентификаторов клиента:

| Ключ | Обязательный | Описание |
|---|---|---|
| `YANDEX_PAY_CLIENT_ID` | Да | Выдаётся командой Yandex Pay |
| `YANDEX_CLIENT_ID` | Нет | Нужен только если вы используете Yandex Login SDK самостоятельно |

**Шаг 1.** Откройте настройки цели в Xcode: вкладка **Build Settings → All → User-Defined**. Добавьте одну или обе переменные:

```
YANDEX_PAY_CLIENT_ID = <ваш идентификатор>
YANDEX_CLIENT_ID     = <ваш идентификатор>   // если нужно
```

**Шаг 2.** Добавьте ссылки на эти переменные в `Info.plist`:

```xml
<key>YANDEX_PAY_CLIENT_ID</key>
<string>$(YANDEX_PAY_CLIENT_ID)</string>

<!-- Только если используется YANDEX_CLIENT_ID -->
<key>YANDEX_CLIENT_ID</key>
<string>$(YANDEX_CLIENT_ID)</string>
```

### 2. URL-схемы

Для каждого используемого client ID необходимо зарегистрировать URL-схему, чтобы SDK мог получать OAuth-колбэки.

Схема формируется по правилу: `yx` + значение client ID.  
Например, для client ID `abcdef1234567890` схема будет `yxabcdef1234567890`.

Добавьте в `Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YandexLoginSDK</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Схема для YANDEX_PAY_CLIENT_ID -->
            <string>yx$(YANDEX_PAY_CLIENT_ID)</string>
            <!-- Схема для YANDEX_CLIENT_ID, если используется -->
            <string>yx$(YANDEX_CLIENT_ID)</string>
        </array>
    </dict>
</array>
```

> Если вы не используете `YANDEX_CLIENT_ID`, удалите соответствующую строку из массива схем.

### 3. Инициализация

Вызовите `YPay.initialize(...)` один раз при старте приложения — в `SceneDelegate` или `AppDelegate`, до первого обращения к любому модулю.

```swift
import YandexPayConfiguration
import YandexPayAuth
import YandexQuickPay
import YandexPayAssistant

let merchant = YPSDKMerchant(
    id: "ваш-merchant-id",
    name: "Название магазина",
    url: nil
)

YPay.initialize(
    environment: .production,
    locale: .ru,
    presentationContextProvider: self,
    modules: [
        YPayAuth.module(),
        YQuickPay.module(stateListener: yourStateListener, merchant: merchant),
        YPAssistantModule.module(merchant: merchant),
    ]
)
```

После успешной инициализации доступ к конфигурации и модулям осуществляется через синглтон `YPay.instance`.

**Параметры `YPay.initialize`:**

| Параметр | Тип | Значение по умолчанию | Описание |
|---|---|---|---|
| `environment` | `YPSDKEnvironment` | — | `.production` или `.sandbox` |
| `locale` | `YPSDKLocale` | — | `.ru`, `.en` или `.system` |
| `theme` | `YPSDKThemeColorScheme` | `.system` | Цветовая схема: `.light`, `.dark`, `.system` |
| `enableLogging` | `Bool` | `false` | Включить отладочные логи |
| `presentationContextProvider` | `YPPresentationContextProviding?` | `nil` | Поставщик `UIViewController` для показа экранов SDK |
| `modules` | `[YandexPaySDKModule]` | — | Список подключаемых модулей |

### 4. Контекст представления

SDK необходимо знать, поверх какого экрана показывать свои UI-потоки. Для этого реализуйте протокол `YPPresentationContextProviding` и передайте его в `presentationContextProvider` при инициализации.

```swift
import YandexPayConfiguration

extension MySceneDelegate: YPPresentationContextProviding {
    func anchorForPresentation() -> YPPresentationContext {
        // Варианты:
        .viewController(rootViewController)   // конкретный UIViewController
        // .window(myWindow)                  // конкретный UIWindow
        // .keyWindow                         // ключевое окно приложения
    }
}
```

### 5. Обработка диплинков

Передавайте входящие URL и user activity в SDK из `SceneDelegate`. Метод `deeplinkHandler` автоматически маршрутизирует их к нужному модулю.

```swift
import YandexPayConfiguration

// Обработка кастомных URL-схем (OAuth-колбэки)
func scene(_ scene: UIScene, openURLContexts contexts: Set<UIOpenURLContext>) {
    guard YPay.isInitialized else { return }
    contexts.map(\.url).forEach { url in
        YPay.instance.deeplinkHandler.handleOpenURL(url)
    }
}

// Обработка Universal Links
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    guard YPay.isInitialized else { return }
    YPay.instance.deeplinkHandler.handleUserActivity(userActivity)
}
```

> Всегда проверяйте `YPay.isInitialized` перед обращением к `YPay.instance`, так как `SceneDelegate` может получить URL до момента инициализации SDK.

---

## YandexPayAuth — авторизация

`import YandexPayAuth`

Доступ: `YPay.instance.auth`

Интерфейс `YPayAuth` намеренно повторяет публичный API `YandexLoginSDK`. Если вы уже работали с Login SDK, методы и паттерн наблюдателей будут вам знакомы.

### Авторизация

```swift
do {
    let model = try await YPay.instance.auth.authorize(
        strategy: .default,       // .default | .webOnly | .primaryOnly
        with: viewController
    )
    print(model.token)  // OAuth-токен
    print(model.uid)    // Yandex ID пользователя
} catch {
    // обработка ошибки
}
```

**`YPAuthorizationStrategy`:**

| Значение | Описание |
|---|---|
| `.default` | Стандартный флоу: сначала нативное приложение Яндекса, затем браузер |
| `.webOnly` | Только через браузер |
| `.primaryOnly` | Только через нативное приложение |

### Выход

```swift
YPay.instance.auth.logout()
```

### Наблюдатель событий авторизации

```swift
class MyObserver: YPLoginObserver {
    func didFinishLogin(with result: Result<YPAuthModel, any Error>) {
        switch result {
        case .success(let model):
            // model.token — токен, model.uid — идентификатор пользователя, model.jwt
        case .failure(let error):
            // обработка ошибки
        }
    }
}

let observer = MyObserver()
YPay.instance.auth.addObserver(observer)

// Когда наблюдатель больше не нужен:
YPay.instance.auth.removeObserver(observer)
```

---

## YandexQuickPay — быстрая оплата

`import YandexQuickPay`

Доступ: `YPay.instance.quickPay`

Модуль необходимо зарегистрировать при инициализации SDK, передав реализацию `YQuickPaymentStateListener`:

```swift
YPay.initialize(
    // ...
    modules: [
        YQuickPay.module(stateListener: myListener, merchant: merchant)
    ]
)
```

### YQuickPaymentStateListener

Реализуйте этот протокол в вашем ViewModel или сервисе для получения событий жизненного цикла платежей:

```swift
class MyPayViewModel: YQuickPaymentStateListener {
    func onPaymentEnabledStateChanged(isEnabled: Bool) {
        // быстрая оплата была включена или выключена пользователем
    }

    func onSessionExpired() {
        // сессия истекла — необходимо получить новый sessionId
    }

    func onPaymentResult(quickpayResult: YQuickPayResult) {
        // платёж завершён
    }
}
```

### Управление быстрой оплатой

```swift
// Проверить, включена ли быстрая оплата для пользователя
let isEnabled = try await YPay.instance.quickPay.isQuickPaymentEnabled()

// Включить — при необходимости покажет биометрический запрос или экран входа
try await YPay.instance.quickPay.enableQuickPayment()

// Выключить
try await YPay.instance.quickPay.disableQuickPayment()
```

### Сессия оплаты

```swift
// Получить BST-токен для передачи на бэкенд
let sessionId = try await YPay.instance.quickPay.getPaymentSessionId()
```

Сессия действует ограниченное время. При получении события `onSessionExpired()` запросите новый `sessionId`.

### Виджеты

Каждый виджет доступен в двух вариантах: UIKit (`-> UIView`) и SwiftUI (`-> any View`).

#### Бейдж активного способа оплаты

Компактный встраиваемый элемент, отображающий текущий способ оплаты пользователя.

```swift
// UIKit
let badge: UIView = YPay.instance.quickPay.createActivePaymentMethodBadge()

// SwiftUI
let badge: any View = YPay.instance.quickPay.createActivePaymentMethodBadge()

// Показать / скрыть бейдж программно
YPay.instance.quickPay.enableActivePaymentMethodBadge()
YPay.instance.quickPay.disableActivePaymentMethodBadge()
```

#### Список способов оплаты

Полный виджет со списком всех доступных способов оплаты.

```swift
// UIKit
let widget: UIView = YPay.instance.quickPay.createPaymentMethodsWidget()

// SwiftUI
let widget: any View = YPay.instance.quickPay.createPaymentMethodsWidget()
```

### Информационные экраны

```swift
// Экран часто задаваемых вопросов
await YPay.instance.quickPay.showFaqScreen()

// Экран онбординг-историй
await YPay.instance.quickPay.showOnboardingStoriesScreen()
```

### Остановка поллинга

```swift
await YPay.instance.quickPay.stopPaymentPolling()
```

---

## YandexPayAssistant — ассистент

### Интеграция виджета выгод

Виджет доступен через `YPay.instance.assistant` после передачи `YPAssistantModule.module(merchant:)` в вызов инициализации SDK.

#### SwiftUI

```swift
let widget: any View = YPay.instance.assistant.createBenefitsWidget(
    screen: .product,
    metaInfo: [
        "amount": "100.0",
        "currency": "RUB",
        "product_id": "<product_id>",
    ]
)
```

#### UIKit

```swift
let widget: UIView = YPay.instance.assistant.createBenefitsWidget(
    screen: .product,
    metaInfo: [
        "amount": "100.0",
        "currency": "RUB",
        "product_id": "<product_id>",
    ]
)
```

#### Экраны виджета

Параметр `screen` указывает, на каком экране приложения размещён виджет, используется для аналитики:

| Значение | Экран |
|---|---|
| `.main` | Главный экран |
| `.catalog` | Каталог |
| `.search` | Поиск |
| `.product` | Карточка товара |
| `.cart` | Корзина |
| `.checkout` | Оформление заказа |

Передайте `nil`, если нет подходящего кейса.

Параметр `metaInfo` — дополнительные данные контекста для виджета:

- `amount`: _String_ — сумма заказа.
- `currency`: _String_ — валюта заказа.
- `product_id`: _String_ — [идентификатор товара в системе продавца](https://pay.yandex.ru/docs/ru/custom/backend/yandex-pay-api/order/merchant_v1_orders-post#entity-RenderedCartItem). Следует передавать на экране товара.

#### Авторизация на стороне партнера

Состояние виджета зависит от того, авторизован ли пользователь в приложении партнера. Необходимо сообщать SDK об изменении этого состояния через метод `setPartnerAuthState` в модуле авторизации.

При логине пользователя:

```swift
YPay.instance.auth.setPartnerAuthState(isUserAuthorized: true)
```

При логауте:

```swift
YPay.instance.auth.setPartnerAuthState(isUserAuthorized: false)
```

Перед отрисовкой виджета нужно также передать актуальный стейт:

```swift
YPay.instance.auth.setPartnerAuthState(isUserAuthorized: isUserAuthorized)
YPay.instance.assistant.createBenefitsWidget(...)
```
