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
        .product(name: "YandexPayAuth",  package: "yandex-pay-modular-sdk-ios"),
        .product(name: "YandexQuickPay", package: "yandex-pay-modular-sdk-ios"),
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

### CocoaPods

```ruby
pod 'YandexPayModularSDK/YandexPayAuth'    # при необходимости
pod 'YandexPayModularSDK/YandexQuickPay'   # при необходимости
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

YPay.initialize(
    environment: .production,
    merchant: .init(
        id: "ваш-merchant-id",
        name: "Название магазина",
        url: nil
    ),
    locale: .ru,
    presentationContextProvider: self,
    modules: [
        YPayAuth.module(),
        YQuickPay.module(stateListener: yourStateListener)
    ]
)
```

После успешной инициализации доступ к конфигурации и модулям осуществляется через синглтон `YPay.instance`.

**Параметры `YPay.initialize`:**

| Параметр | Тип | Значение по умолчанию | Описание |
|---|---|---|---|
| `environment` | `YPSDKEnvironment` | — | `.production` или `.sandbox` |
| `merchant` | `YPSDKMerchant` | — | Идентификатор, название и URL магазина |
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

### Состояние авторизации виджета быстрой оплаты

Эти методы отражают состояние авторизации именно в контексте виджета быстрой оплаты (не общей авторизации через Яндекс ID).

```swift
// Текущее состояние
let state: YPAuthState = await YPay.instance.auth.getAuthState()

// Нужна ли проверка безопасности перед следующей транзакцией
let required: Bool = try await YPay.instance.auth.isSecurityCheckRequired()
```

**`YPAuthState`:**

| Состояние | Описание |
|---|---|
| `.notAuthorized` | Пользователь не авторизован |
| `.authorizationInProgress` | Идёт процесс авторизации |
| `.accountAuthorized` | Аккаунт привязан, проверка безопасности ещё не пройдена |
| `.securityCheckInProgress` | Идёт биометрическая или PIN-проверка |
| `.securityCheckRequired` | Необходима проверка безопасности |
| `.securityCheckCompleted` | Проверка пройдена, виджет готов к оплате |
| `.securityCheckFailed(reason:)` | Проверка не пройдена |

**`SecurityCheckFailReason`:**

| Причина | Описание |
|---|---|
| `.userCancelled` | Пользователь отменил проверку |
| `.biometryNotAvailable` | Биометрия недоступна на устройстве |
| `.unknownError` | Неизвестная ошибка |

### Наблюдатель изменений состояния авторизации

```swift
class MyController: YPAuthStateObserver {
    func onAuthStateChanged(_ state: YPAuthState) {
        // обновить UI в зависимости от нового состояния
    }
}

let observer = MyController()
YPay.instance.auth.addAuthStateObserver(observer)

// Когда наблюдатель больше не нужен:
YPay.instance.auth.removeAuthStateObserver(observer)
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
        YQuickPay.module(stateListener: myListener)
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

#### Раскрываемый виджет способов оплаты

Полноразмерный виджет с поддержкой свёрнутого и развёрнутого состояний.

```swift
// UIKit
let widget: UIView = YPay.instance.quickPay.createExpandablePaymentMethodsWidget(
    expandState: .collapsed
)

// SwiftUI
let widget: any View = YPay.instance.quickPay.createExpandablePaymentMethodsWidget(
    expandState: .collapsed
)
```

Управление состоянием виджета:

```swift
// Подписаться на изменения состояния
let observerId = await YPay.instance.quickPay.addWidgetExpandChangeObserver { state in
    switch state {
    case .expanded:  // виджет развёрнут
    case .collapsed: // виджет свёрнут
    }
}

// Отписаться
await YPay.instance.quickPay.removeWidgetExpandChangeObserver(forId: observerId)

// Задать состояние программно
YPay.instance.quickPay.setWidgetExpanded(.expanded)
YPay.instance.quickPay.setWidgetExpanded(.collapsed)

// Получить текущее состояние (nil — если виджет ещё не создан)
let state: YQuickPayWidgetExpandState? = YPay.instance.quickPay.isWidgetExpanded()
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
