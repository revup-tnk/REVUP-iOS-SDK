# REVUP for iOS Integration
[![GitHub package.json version](https://img.shields.io/badge/iOS-1.1.2-blue)](../../releases)

- 지원 환경 : **iOS 13.0 + / iPadOS 13.0 + / Xcode 26.2 +**
<details>
<summary>Networks Version</summary>
<div markdown="1">  

| Ad Network          | iOS Version |
|---------------------|-------------|
| AdMob               | 13.6.0      |
| AppLovin            | 13.6.3      |
| BidMachine          | 3.7.1       |
| Bigo                | 5.3.0       |
| Chartboost          | 9.12.0      |
| DT Exchange         | 8.4.7       |
| InMobi              | 11.3.0      |
| ironSource	      | 9.4.0.0     |
| Liftoff(Vungle)     | 7.7.2       |
| Line                | 3.0.1       |
| Meta(Fan)           | 6.21.1      |
| Mintegral(Mobvista) | 8.1.5       |
| Moloco              | 4.8.1       |
| Ogury               | 5.2.3       |
| Pangle              | 8.1.1.1     |
| PubMatic            | 5.1.1       |
| TnkPub              | 1.24        |
| Unity Ads           | 4.19.0      |

</div>
</details>
<br/>

## Contents
#### [Installation](#installation-1)
- [1. CocoaPods](#1-cocoapods)
- [2. SPM(Swift Package Manager)](./docs/swift_package_manager.md)
- [3. Manual Installation](./docs/Installation_manual.md)
#### [Setup Xcode](#setup-xcode-1)
- [1. info.plist 수정](#1-infoplist-수정)
- [2. AppDelegate 추가](#2-appdelegate-추가)
- [3. Privacy Manifest 정책 적용](#3-privacy-manifest-정책-적용)
#### [REVUP Overview](#revup-overview-1)
- [1. Import](#1-import-필수)
- [2. Initialize](#2-initialize-필수)
- [3. 사용자 정보 설정](#3-사용자-정보-설정-필수)
- [4. Lucky Event](#4-lucky-event)
- [5. RewardedVideo](#5-rewardedvideo)
- [6. Interstitial](#6-interstitial)
- [7. RewardedInterstitial](#7-rewardedinterstitial)
#### [REVUP Error Information](./docs/api_documentation.md#model)
#### [REVUP Server 연동하기](./docs/reward_callback_info.md)
<br/>


## Installation
### 1. CocoaPods
- CocoaPods는 Cocoa Projects의 Dependency를 관리할 수 있음

#### A. CocoaPods Install
```ruby
gem install cocoapods
```
- 명령어를 사용하여 설치 진행
<br/>

#### B. Podfile
- CocoaPods의 Xcode Project내에 Podfile에서 기술
```ruby
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '13.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'REVUP', '1.1.2'
end
```
<details>
<summary>네트워크 개별 선택 추가 방법</summary>
<div markdown="1">  

```ruby
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '15.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'REVUP/LuckyEvent', '1.1.2'
    pod 'REVUP/AdManager', '1.1.2'
    pod 'REVUP/AdMob', '1.1.2'
    pod 'REVUP/ChartBoost', '1.1.2'
    pod 'REVUP/Pangle', '1.1.2'
    pod 'REVUP/TnkPub', '1.1.2'
    pod 'REVUP/Vungle', '1.1.2'
    pod 'REVUP/MaxMediaAdManager', '1.1.2'
    pod 'REVUP/MaxMediaAdMob', '1.1.2'
    pod 'REVUP/MaxMediaBidMachine', '1.1.2'
    pod 'REVUP/MaxMediaBigo', '1.1.2'
    pod 'REVUP/MaxMediaChartBoost', '1.1.2'
    pod 'REVUP/MaxMediaDTExchange', '1.1.2'
    pod 'REVUP/MaxMediaFan', '1.1.2'
    pod 'REVUP/MaxMediaInMobi', '1.1.2'
    pod 'REVUP/MaxMediaIronSource', '1.1.2'
    pod 'REVUP/MaxMediaLine', '1.1.2'
    pod 'REVUP/MaxMediaMobVista', '1.1.2'
    pod 'REVUP/MaxMediaMoloco', '1.1.2'
    pod 'REVUP/MaxMediaOgury', '1.1.2'
    pod 'REVUP/MaxMediaPangle', '1.1.2'
    pod 'REVUP/MaxMediaPubMatic', '1.1.2'
    pod 'REVUP/MaxMediaUnityAds', '1.1.2'
    pod 'REVUP/MaxMediaVungle', '1.1.2'
end
```

</div>
</details>

- Version이 상이할 경우 Initialize시 Log를 통해 확인 가능<br/>
![AdapterChecked](https://github.com/user-attachments/assets/a9530953-9cca-4eed-9ff9-efc12eacaec9)<br/>
<br/>

#### C. Pod Install
```ruby
pod install --repo-update
```
- 다음의 명령어를 실행해서 Library를 Xcode Project로 추가    
- Xcode Project에 포함시키기 위해서 Xcode 재실행
<br/><br/><br/>

### 2. SPM(Swift Package Manager)
- [SPM 가이드](./docs/swift_package_manager.md) 참고
<br/><br/><br/>

### 3. Manual Installation
- [xcframework 직접 추가 가이드](./docs/Installation_manual.md) 참고
<br/><br/><br/><br/>

## Setup Xcode
### 1. info.plist 수정
#### A. [필수] REVUPMediaId, REVUPMediaSecret 추가
```xml
<key>REVUPMediaId</key>
<string></string>
<key>REVUPMediaSecret</key>
<string></string>
```
<br/>

#### B. [필수] App Tracking Permission 추가
```xml
<key>NSUserTrackingUsageDescription</key>
<string></string>
```
- ex : Some ad content may require access to the user tracking.
<br/>

#### C. [필수] SKAdNetwork 추가
- SKAdNetwork Download File 내용 추가 ([Download](https://github.com/revup-tnk/REVUP-iOS-SDK/releases/download/1.0.0/REVUPSkAdNetworks.plist))
- 2026년 3월 9일에 마지막으로 파일 내용 추가
```xml
<dict>
    <key>SKAdNetworkItems</key>
    <array>
	<dict>
	    <key>SKAdNetworkIdentifier</key>
	    <string></string>
	</dict>
    </array>
</dict>
```
<br/>

#### D. (선택) liftoff 사용 시 AdNetworkIdentifiers 추가
- liftoff 사용하면서 AdAttributionKit 17.4+ 이면 AdNetwork Download File 내용 추가 ([Download](https://github.com/revup-tnk/REVUP-iOS-SDK/releases/download/1.0.0/REVUPAdNetworks.plist))
- 2026년 3월 9일에 마지막으로 파일 내용 추가
```xml
<dict>
    <key>AdNetworkIdentifiers</key>
    <array>
	    <string></string>
    </array>
</dict>
```
<br/>

#### E. (선택) Admob 또는 Max의 Admob 사용 시 추가
- "GADIsAdManagerApp" 설정 및 GADApplicationIdentifier의 Key 설정
```xml
<key>GADIsAdManagerApp</key>
<true/>
<key>GADApplicationIdentifier</key>
<string></string>
```
<br/><br/><br/>

### 2. AppDelegate 추가
#### A. Max의 InMobi 사용 시 추가
- window 추가
```swift
var window: UIWindow?
```    
<br/><br/><br/>

### 3. Privacy Manifest 정책 적용
- 2024년 5월 1일부터 출시/업데이트 되는 앱에 대해 3rd Party Framework의 개인정보 추가
- [참고](https://developer.apple.com/videos/play/wwdc2023/10060)    
<br/><br/><br/><br/>

# REVUP Overview
## 1. Import (필수)
```swift
import REVUP
```    
<br/><br/><br/>

## 2. Initialize (필수)
### A. Code에서 Media 없이 Initialize 방법
```swift
let CALLBACK_TAG = ""    // 관리자를 통해 발급, 기본 ""
if let revupSDK = REVUPInterface.sharedInstance() {
    revupSDK.setMainDelegate(self)
    revupSDK.initialize(CALLBACK_TAG)
}
```
- Build된 Project에서 `Info.plist` 파일에서 `REVUPMediaId`가 있어야 함
- CALLBACK_TAG이 없을 시, `revupSDK.initialize()`로 가능
- App 실행 시 1회 설정 권장
<br/>

### B. Code에서 직접 Media 넣어서 Initialize 방법
```swift
let MEDIA_ID = ""        // 관리자를 통해 발급
let MEDIA_SECRET = ""    // 관리자를 통해 발급
let CALLBACK_TAG = ""    // 관리자를 통해 발급, 기본 ""
if let revupSDK = REVUPInterface.sharedInstance() {
    revupSDK.setMainDelegate(self)
    revupSDK.initialize(MEDIA_ID, mediaSecret: MEDIA_SECRET, callBackTag: CALLBACK_TAG)
}
```
- CALLBACK_TAG이 없을 시, `revupSDK.initialize(MEDIA_ID, mediaSecret: MEDIA_SECRET)`로 가능
- App 실행 시 1회 설정 권장
<br/>

### C. Callbacks
```swift
func onInitialized(_ isSuccess: Bool) {
    if (isSuccess) {
        // Initialize Call Back
    } else {
        // Initialize Fail
    }
}
```    
<br/><br/><br/>

## 3. 사용자 정보 설정 (필수)
- `RewardedVideo`, `RewardedInterstitial`를 사용하기 위해 ${\color{red}필수}$ 설정
<details>
<summary>Max의 `RewardedVideo`, `Interstitial`를 사용 하면서 앱이 4+, 9+ 일 경우 설정 방법</summary>
<div markdown="1">  

```swift
let USER_ID = ""		// set unique user id to identify the user in reward information
let CHILD = .none		// .none(미설정), .child(어린이), .adult(성인)
REVUPInterface.sharedInstance().setUserId(USER_ID, child: .child)
```

</div>
</details>
<br/>

- Max를 미사용 하거나 앱이 13+ 이상으로 설정 되어 있으면 하단만 사용 가능
```swift
let USER_ID = ""		// set unique user id to identify the user in reward information
REVUPInterface.sharedInstance().setUserId(USER_ID)
```
- 64자까지 설정 가능    
<br/><br/><br/>

## 4. Lucky Event
### A. Settings
```swift
let EVENT_APP_ID = ""		// 관리자를 통해 발급
let EVENT_PUB_ID = ""		// 관리자를 통해 발급
REVUPInterface.sharedInstance().setLuckyEventAppId(EVENT_APP_ID, pubId: EVENT_PUB_ID)
```
<br/>

### B. Show
```swift
REVUPInterface.sharedInstance().showLuckyEvent()
```
- **사용자 정보 설정(setUserId)** 의 진행 완료 후 Show 호출
<br/>

### C. Show With URL
```swift
let EVENT_URL = ""		// 관리자를 통해 발급
REVUPInterface.sharedInstance().showLuckyEventUrl()
```
- **사용자 정보 설정(setUserId)** 의 진행 완료 후 Show 호출
<br/><br/><br/>

### C. WebView interceptor callback
```swift
func luckyEventWebViewNavigated(_ url:NSURL!) {
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Lucky Event WebView에서 발생하는 Scheme URL 정보를 수신, 전달된 URL에 대해 이벤트 처리 용도로 사용 권장
<br/><br/><br/>

## 5. RewardedVideo
### A. Show With Load
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = ""		// 관리자를 통해 발급
	REVUPInterface.sharedInstance().show(withLoad: UNIT_ID, delegate: self)
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 호출
- `onRewardedVideoAdFailedToLoad` 대신 `onRewardedVideoAdFailedToShow`로 호출됨
- 기본적으로 Load동안 기본 Indicator가 동작, 오류시 기본 알림 팝업 발생
<details>
<summary>Indicator & Error Alert 설정 변경</summary>
<div markdown="1">  

<br/>
※ Interstitial과 같이 동작됨
<br/><br/>

**가. Indicator가 동작되는 Background Color 설정**
```swift
let red = "0"		// 0 ~255 String 값
let green = "0"		// 0 ~255 String 값
let blue = "0"		// 0 ~255 String 값
let alpha = "0.3"	// 0 ~ 1 String 값
REVUPInterface.sharedInstance().setShowWithLoad2BackgroundColor(red, green: green, blue: blue, alpha: alpha)
```
<br/>

**나. Indicator의 크기 변경 및 Hidden 설정**
```swift
let isStyleMedium = false	// true : StyleMedium, false : StyleLarge
let isHidden = false		// true : 미노출, false : 노출
REVUPInterface.sharedInstance().setShowWithLoad2IndicatorStyleMedium(isStyleMedium, isHidden: isHidden)
```
- Load의 시간이 필요해
- 미노출 처리했다면 ShowWithLoad 시점에 Indicator 실행 후, 'onRewardedVideoAdLoaded', 'onRewardedVideoAdFailedToShow' 호출 시 Indicator 제거 추천
<br/>

**다. Error Alert 메시지 설정 및 Hidden 설정**
```swift
let msg = "현재 시청 가능한 광고가 없습니다.\n잠시 후 다시 시도해 주세요."
let isHidden = false		// true : 미노출, false : 노출
REVUPInterface.sharedInstance().setShowWithLoad2ErrorAlertMsg(msg, isHidden: isHidden)
```
- 미노출 처리했다면 'onRewardedVideoAdFailedToShow' 호출 시 오류를 안내 추천

</div>
</details>
<br/>

### B. 직접 Load, Show 설정
<details>
<summary>직접 Load, Show 설정</summary>
<div markdown="1">  

<br/>

**가. Load**
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = ""		// 관리자를 통해 발급
    REVUPInterface.sharedInstance().load(UNIT_ID)
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 Load 호출
- Load 후 사용자 정보 설정을 호출할 경우 isLoaded Flag가 False로 반환(Load 취소)
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onRewardedVideoAdLoaded` callback이 호출되면 Load가 완료
- Load가 실행되면 `onRewardedVideoAdLoaded` 와 `onRewardedVideoAdFailedToLoad` 중 하나의 callback은 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- Load & Show 후 다시 Load를 하려 할 때 Load 는 Show 이후 언제든 호출가능
  - 광고가 Show되는 동안 다음 광고를 Load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
- (**Optional**) Load의 시간이 필요해 ProgressBar 노출 추천
<br/>

**나. IsLoaded**
```swift
let UNIT_ID = ""		// Load한 값(관리자를 통해 발급)
if (REVUPInterface.sharedInstance().isLoaded(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

**다. Show**
```swift
let UNIT_ID = ""		// Load한 값(관리자를 통해 발급)
if (REVUPInterface.sharedInstance().isLoaded(UNIT_ID)) {
    REVUPInterface.sharedInstance().show()
} else {
    // do something else
}
```
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onRewardedVideoAdOpened`와 `onRewardedVideoAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedVideoAdOpened`가 호출되었다면 이후 `onRewardedVideoAdClosed`가 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출

</div>
</details>
<br/>

### C. Callback Reward
```swift
func onRewarded(_ unitID: String!, item: REVUPRewardItem!) {
    // unitID - 해당 rewardedvideo의 UNIT_ID (Show 시 입력한 값)
    // item.amount - 보상의 양
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- 이 보상 정보를 바탕으로 게임 내에서 보상을 지급
- `onRewarded`는 보통 `onRewardedVideoAdOpened` 와 `onRewardedVideoAdClosed` 사이에 호출되는 경우가 많으나 광고 System의 상황에 따라 달라 질 수 있음
- `onRewarded`가 호출되지 않는 경우도 존재할 수 있음(Reward 설정을 Server-to-server로 하였다면, Video 시청 후에는 `onRewarded`가 호출되지 않음)
- Reward 정보는 abusing 방지를 위해서 Server-to-server 방식으로 전달 받는 것을 권장
- Server-to-server 방식을 선택하더라도 보상이 전달 될 시에는 `onRewarded`가 호출
  - 이때는 Server를 통해 전달받은 정보를 기준으로 처리하고, `onRewarded`를 통해 전달받은 정보는 검증용으로 사용하거나 무시하도록 함
<br/>

### D. Callback Others
```swift
func onRewardedVideoAdLoaded(_ unitID: String!) {
    // RewardedVideo Load Success
}
func onRewardedVideoAdFailed(toLoad unitID: String!, error: REVUPError!) {
	// ShowWithLoad 호출 시에는 수신 없음
    // RewardedVideo Load Fail
}
func onRewardedVideoAdOpened(_ unitID: String!) {
    // RewardedVideo 열림
}
func onRewardedVideoAdClosed(_ unitID: String!) {
    // RewardedVideo 닫힘
}
func onRewardedVideoAdFailed(toShow unitID: String!, error: REVUPError!) {
    // RewardedVideo Show Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Load 성공 시 `onRewardedVideoAdLoaded`, 실패 시 `onRewardedVideoAdFailedToLoad`(`onRewardedVideoAdFailedToShow`)가 호출
- Show 성공 시 `onRewardedVideoAdOpened`, `onRewardedVideoAdClosed`가 순차적으로 호출되고, 실패 시 `onRewardedVideoAdFailedToShow`가 호출    
- `onRewardedVideoAdFailedToLoad`, `onRewardedVideoAdFailedToShow`시 [REVUPError 참고](./docs/api_documentation.md#model)
<br/><br/><br/>

## 6. Interstitial
### A. Show With Load
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = ""    // 관리자를 통해 발급
	REVUPInterface.sharedInstance().show(withLoadInterstitial: UNIT_ID, delegate: self)
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 호출
- `onInterstitialAdFailedToLoad` 대신 `onInterstitialAdFailedToShow`로 호출됨
- 기본적으로 Load동안 기본 Indicator가 동작, 오류시 기본 알림 팝업 발생
<details>
<summary>Indicator & Error Alert 설정 변경</summary>
<div markdown="1">  

<br/>
※ RewardedVideo와 같이 동작됨
<br/><br/>

**가. Indicator가 동작되는 Background Color 설정**
```swift
let red = "0"		// 0 ~255 String 값
let green = "0"		// 0 ~255 String 값
let blue = "0"		// 0 ~255 String 값
let alpha = "0.3"	// 0 ~ 1 String 값
REVUPInterface.sharedInstance().setShowWithLoad2BackgroundColor(red, green: green, blue: blue, alpha: alpha)
```
<br/>

**나. Indicator의 크기 변경 및 Hidden 설정**
```swift
let isStyleMedium = false	// true : StyleMedium, false : StyleLarge
let isHidden = false		// true : 미노출, false : 노출
REVUPInterface.sharedInstance().setShowWithLoad2IndicatorStyleMedium(isStyleMedium, isHidden: isHidden)
```
- Load의 시간이 필요해
- 미노출 처리했다면 ShowWithLoad 시점에 Indicator 실행 후, 'onRewardedVideoAdLoaded', 'onRewardedVideoAdFailedToShow' 호출 시 Indicator 제거 추천
<br/>

**다. Error Alert 메시지 설정 및 Hidden 설정**
```swift
let msg = "현재 시청 가능한 광고가 없습니다.\n잠시 후 다시 시도해 주세요."
let isHidden = false		// true : 미노출, false : 노출
REVUPInterface.sharedInstance().setShowWithLoad2ErrorAlertMsg(msg, isHidden: isHidden)
```
- 미노출 처리했다면 'onRewardedVideoAdFailedToShow' 호출 시 오류를 안내 추천

</div>
</details>
<br/>

### B. 직접 Load, Show 설정
<details>
<summary>직접 Load, Show 설정</summary>
<div markdown="1">  

<br/>

**가. Load**
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = ""		// 관리자를 통해 발급
    REVUPInterface.sharedInstance().loadInterstitial(UNIT_ID)
} else {
    // Initialize 재시도
}
```
- Initialize 진행 완료 후 Load 호출
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onInterstitialAdLoaded` callback이 호출되면 Load가 완료
- Interstitial의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- 광고가 Show되는 동안 다음 광고를 Load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
- (**Optional**) Load의 시간이 필요해 ProgressBar 노출 추천
<br/>

**나. IsLoaded**
```swift
let UNIT_ID = ""		// Load한 값(관리자를 통해 발급)
if (REVUPInterface.sharedInstance().isLoadedInterstitialUnitID(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

**다. Show**
```swift
let UNIT_ID = ""		// Load한 값(관리자를 통해 발급)
if (REVUPInterface.sharedInstance().isLoadedInterstitialUnitID(UNIT_ID)) {
    REVUPInterface.sharedInstance().showInterstitial()
} else {
    // do something else
}
```
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onInterstitialAdOpened`와 `onInterstitialAdFailedToShow` 중 하나가 항상 호출되고, `onInterstitialAdOpened`가 호출되었다면 이후 `onInterstitialAdClosed`가 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
    - Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음번 Show를 준비

</div>
</details>
<br/>

### C. Callback
```swift
func onInterstitialAdLoaded(_ unitID: String!) {
    // Interstitial Load Success
}
func onInterstitialAdFailed(toLoad unitID: String!, error: REVUPError!) {
 	// ShowWithLoadInterstitial 호출 시에는 수신 없음
    // Interstitial Load Fail
}
func onInterstitialAdOpened(_ unitID: String!) {
    // Interstitial 열림
}
func onInterstitialAdClosed(_ unitID: String!) {
    // Interstitial 닫힘
}
func onInterstitialAdFailed(toShow unitID: String!, error: REVUPError!) {
    // Interstitial Show Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Load 성공 시 `onInterstitialAdLoaded`, 실패 시 `onInterstitialAdFailedToLoad`(`onInterstitialAdFailedToShow`)가 호출
- Show 성공 시 `onInterstitialAdOpened`, `onInterstitialAdClosed`가 순차적으로 호출되고, 실패 시 `onInterstitialAdFailedToShow`가 호출    
- `onInterstitialAdFailedToLoad`, `onInterstitialAdFailedToShow`시 [REVUPError 참고](./docs/api_documentation.md#model)
<br/><br/><br/>

## 7. RewardedInterstitial
### A. PreLoadAll
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    REVUPInterface.sharedInstance().preLoadAllRewardedInterstitial()
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 관리자가 설정된 활성화된 모든 유닛들을 Load 진행
<br/>

### B. Unit 지정 PreLoad
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    let UNIT_ID1 = ""		// 관리자를 통해 발급
    let UNIT_ID2 = ""		// 관리자를 통해 발급
    REVUPInterface.sharedInstance().preLoadRewardedInterstitial([UNIT_ID1, UNIT_ID2, ... ])
} else {
    // Initialize 재시도
}
```
- Initialize와 사용자 정보 설정의 진행 완료 후 1회 설정 권장
- 입력된 유닛들을 Load 진행
<br/>

### C. Load
```swift
if (REVUPInterface.sharedInstance().isInitialized()) {
    let UNIT_ID = ""		// 관리자를 통해 발급
    REVUPInterface.sharedInstance().loadRewardedInterstitial(UNIT_ID)
} else {
    // Initialize 재시도
}
```
- Initialize 진행 완료 후 Load 호출
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onRewardedInterstitialAdLoaded` callback이 호출되면 Load가 완료
- RewardedInterstitial `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
<br/>

### D. IsLoad
```swift
let UNIT_ID = ""		// 관리자를 통해 발급
if (REVUPInterface.sharedInstance().isLoadedRewardedInterstitial(UNIT_ID)) {
    // show ad here
} else {
    // do something else
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

### E. Show
```swift
let UNIT_ID = ""		// 관리자를 통해 발급
if (REVUPInterface.sharedInstance().isLoadedRewardedInterstitial(UNIT_ID)) {
    REVUPInterface.sharedInstance().showRewardedInterstitial(UNIT_ID)
} else {
    // do something else
}
```
- Show 하기 전에 사용자가 취소를 할 수 있는 선택을 노출해야 함
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onRewardedInterstitialAdOpened`와 `onRewardedInterstitialAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedInterstitialAdOpened`가 호출되었다면 이후 `onRewardedInterstitialAdClosed`가 항상 호출
- RewardedInterstitial Video Ad의 `Load`와 `Show`는 pair로 호출
    - Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음번 Show를 준비
<br/>

### F. Show With Popup
```swift
let UNIT_ID = ""		// 관리자를 통해 발급
REVUPInterface.sharedInstance().showRewardedInterstitialWithPop(UNIT_ID)
```
- 해당 유닛이 Load되어 있으면 안내 팝업을 보여 준 뒤 해당 광고를 사용자에게 보여줌
- ShowRewardedInterstitial method는 중복하여 호출 할 수 없음
- Show가 실행되면 (return값이 True일 경우) `onRewardedInterstitialAdSkip`와 `onRewardedInterstitialAdOpened`와 `onRewardedInterstitialAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedInterstitialAdOpened`가 호출되었다면 이후 `onRewardedInterstitialAdClosed`가 항상 호출
- `onRewardedInterstitialAdClosed`와 `onRewardedInterstitialAdFailedToShow`가 호출 되면 내부에서 해당 유닛을 자동 Load 시킴
<br/>

### G. Unit Status Info
```swift
let UNIT_ID = ""		// 관리자를 통해 발급
REVUPInterface.sharedInstance().getRewardedInterstitialUnitStatus(UNIT_ID)
```
- `onRewardedInterstitialResponsedUnitStatus`에서 해당 유닛의 수익화 여부, 활성화 여부를 알 수 있음
<br/>

### H. Callback Reward
```swift
func onRewardedInterstitialRewarded(_ unitID: String!, item: REVUPRewardItem!) {
    // unitID - 해당 RewardedInterstitial의 UNIT_ID (Show 시 입력한 값)
    // item.amount - 보상의 양
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- 보상이 주어져야 할 경우 `OnRewarded`가 호출되며 그 parameter로 관련 정보가 전달
- 이 보상 정보를 바탕으로 게임 내에서 보상을 지급
- `OnRewarded`는 보통 `OnOpened` 와 `OnClosed` 사이에 호출되는 경우가 많으나 광고 System의 상황에 따라 달라 질 수 있음
- `OnRewarded`가 호출되지 않는 경우도 존재할 수 있음(Reward 설정을 Server-to-server로 하였다면, Video 시청 후에는 `OnRewarded`가 호출되지 않음)
- Reward 정보는 abusing 방지를 위해서 Server-to-server 방식으로 전달 받는 것을 권장
- Server-to-server 방식을 선택하더라도 보상이 전달 될 시에는 `OnRewarded`가 호출
  - 이때는 Server를 통해 전달받은 정보를 기준으로 처리하고, `OnRewarded`를 통해 전달받은 정보는 검증용으로 사용하거나 무시하도록 함
<br/>

### I. Callback Others
```swift
func onRewardedInterstitialResponsedUnitStatus(_ status: REVUPUnitStatus!) {
    // status.active - 활성화 여부
    // status.live - 수익화 여부
}
func onRewardedInterstitialAdLoaded(_ unitID: String!) {
    // RewardedInterstitial Load Success
}
func onRewardedInterstitialAdFailed(toLoad unitID: String!, error: REVUPError!) {
    // RewardedInterstitial Load Fail
}
func onRewardedInterstitialAdSkip(_ unitID: String!) {
    // RewardedInterstitial Skip for 안내 팝업
}
func onRewardedInterstitialAdOpened(_ unitID: String!) {
    // RewardedInterstitial 열림
}
func onRewardedInterstitialAdClosed(_ unitID: String!) {
    // RewardedInterstitial 닫힘
}
func onRewardedInterstitialAdFailed(toShow unitID: String!, error: REVUPError!) {
    // RewardedInterstitial Show Fail
}
```
- `setMainDelegate(_:)`를 진행했다면 다음과 같은 응답을 수신 받을 수 있음
- Show 성공 후 Skip 시 `onRewardedInterstitialAdSkip`가 호출
- Show 성공 후 영상 시청 시 `onRewardedInterstitialAdOpened`, `onRewardedInterstitialAdClosed`가 순차적으로 호출되고, 실패 시 `onRewardedInterstitialAdFailedToShow`가 호출
- `onRewardedInterstitialAdFailedToShow`시 [REVUPError 참고](./docs/api_documentation.md#model)
<br/><br/><br/>

# REVUP Error Information
- [Error 정보](./docs/api_documentation.md#model)
<br/><br/>

# [REVUP Server 연동하기](./docs/reward_callback_info.md)
<br/><br/>
