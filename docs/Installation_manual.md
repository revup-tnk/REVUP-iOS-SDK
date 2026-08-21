# REVUP for iOS Integration

## SDK Download
- [최신 SDK 다운로드](https://github.com/revup-tnk/REVUP-iOS-SDK/releases/download/1.1.8/REVUPIosSdk-1.1.8.zip)
  - Releases에 이전 버전 다운로드 가능 ([이동](../../releases))

## Requirements
iOS 13.0 + / iPadOS 13.0 + / Xcode 26.2 +

## Installation
### Manual
Framework를 Project내에 옮깁니다. REVUP.xcframework는 필수이며, 반드시 하단에서 설명할 Xcode Project에 추가할 파일은 옮긴 프로젝트 내에있는 Framework파일들을 선택합니다.

**REVUP SDK for iOS Structure**
- REVUP Framework와 Third-party Frameworks를 쌍으로 설치

| REVUP Framework               | Essential | Third-party Frameworks                                       |
| ------------------------------------------- | --------- | ------------------------------------------------------------ |
| REVUP.xcframework                           | NO        |                                                              |
| REVUPLuckyEvent.xcframework                 | NO        |                                                              |
| REVUPMediaAdMob.xcframework                 | NO        | GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework  |
| REVUPMediaAdManager.xcframework             | NO        | GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework  |
| REVUPMediaChartBoost.xcframework            | NO        | ChartboostSDK.xcframework  |
| REVUPMediaPangle.xcframework                | NO        | PAGAdSDK.xcframework, PAGAdSDK.bundle  |
| REVUPMediaTnkPub.xcframework                | NO        | TnkPubSdk.xcframework  |
| REVUPMediaVungle.xcframework                | NO        | VungleAdsSDK.xcframework  |
| REVUPMediaMax.xcframework                   | NO        | AppLovinSDK.xcframework  |
| REVUPMediaMaxAdapterAdManager.xcframework   | NO        | GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework<br/>AppLovinMediationGoogleAdManagerAdapter.xcframework  |
| REVUPMediaMaxAdapterAdMob.xcframework       | NO        | GoogleMobileAds.xcframework, UserMessagingPlatform.xcframework<br/>AppLovinMediationGoogleAdapter.xcframework  |
| REVUPMediaMaxAdapterBidMachine.xcframework  | NO        | BidMachine.xcframework, OMSDK_Appodeal.xcframework<br/>AppLovinMediationBidMachineAdapter.xcframework  |
| REVUPMediaMaxAdapterBigo.xcframework        | NO        | BigoADS.xcframework, AppLovinMediationBigoAdsAdapter.xcframework  |
| REVUPMediaMaxAdapterChartBoost.xcframework  | NO        | ChartboostSDK.xcframework, AppLovinMediationChartboostAdapter.xcframework  |
| REVUPMediaMaxAdapterDTExchange.xcframework  | NO        | IASDKCore.xcframework, AppLovinMediationFyberAdapter.xcframework  |
| REVUPMediaMaxAdapterFan.xcframework         | NO        | FBAudienceNetwork.xcframework, AppLovinMediationFacebookAdapter.xcframework  |
| REVUPMediaMaxAdapterInMobi.xcframework      | NO        | InMobiSDK.xcframework, AppLovinMediationInMobiAdapter.xcframework  |
| REVUPMediaMaxAdapterIronSource.xcframework  | NO        | IronSource.xcframework, AppLovinMediationIronSourceAdapter.xcframework  |
| REVUPMediaMaxAdapterLine.xcframework        | NO        | FiveAd.xcframework, AppLovinMediationLineAdapter.xcframework  |
| REVUPMediaMaxAdapterMobVista.xcframework    | NO        | MTGSDK.xcframework, MTGSDKBanner.xcframework<br/>MTGSDKBidding.xcframework,MTGSDKInterstitialVideo.xcframework<br/>MTGSDKNewInterstitial.xcframework, MTGSDKReward.xcframework<br/>MTGSDKSplash.xcframework, AppLovinMediationMintegralAdapter.xcframework  |
| REVUPMediaMaxAdapterMoloco.xcframework      | NO        | MolocoSDK.xcframework, AppLovinMediationMolocoAdapter.xcframework  |
| REVUPMediaMaxAdapterOgury.xcframework       | NO        | OguryAds.xcframework, OguryCore.xcframework<br/>OgurySdk.xcframework, OMSDK_Ogury.xcframework<br/>AppLovinMediationOguryPresageAdapter.xcframework  |
| REVUPMediaMaxAdapterPangle.xcframework      | NO        | PAGAdSDK.xcframework, PAGAdSDK.bundle<br/>AppLovinMediationByteDanceAdapter.xcframework  |
| REVUPMediaMaxAdapterPubMatic.xcframework    | NO        | OpenWrapSDK.xcframework, OMSDK_Pubmatic.xcframework<br/>AppLovinMediationPubMaticAdapter.xcframework  |
| REVUPMediaMaxAdapterUnityAds.xcframework    | NO        | UnityAds.xcframework, AppLovinMediationUnityAdsAdapter.xcframework  |
| REVUPMediaMaxAdapterVungle.xcframework      | NO        | VungleAdsSDK.xcframework, AppLovinMediationVungleAdapter.xcframework  |



1. (**Swift**) Bridge 추가
   - 새로운 헤더 파일 생성 (ProjectName-Bridging-Header.h)
   - Xcode Project / Build Settings Tab 접근
   - Objective-C Bridging Header에 생성한 헤더를 입력
   - Header에 다음을 추가
```object-c
#import <REVUP/REVUP.h>
```
2. Build Settings 수정<br/>
![image](https://github.com/user-attachments/assets/78c0472d-e384-406a-b038-a177c4ab3458)
   - TARGETS > Build Settings > Other Linker Flags 에 `-ObjC` 추가
3. (**Optional**) RewardedVideo, Interstitial을 사용하기 위한 Framework들을 추가
   - Xcode Project / Build Phase Tab 접근
   - Link Binary With Libraries에 사용할 Framework들을 추가 
     - *Vungle을 사용한다고 가정시에 이하 Framework를 Link Binary With Libraries에 추가한다.*
       - *REVUPMediaVungle.xcframework*
       - *VungleSDK.xcframework*
4. (**Optional**) Max 사용시 Embed & Sign 설정
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 AppLovinSDK.xcframework, InMobiSDK.xcframework, MolocoSDK.xcframework, OguryAds.xcframework, OguryCore.xcframework, OgurySdk.xcframework, OMSDK_Appodeal.xcframework, OMSDK_Ogury.xcframework, OMSDK_Pubmatic.xcframework, OpenWrapSDK.xcframework, TnkPubSdk.xcframework 를 추가 후 Embed & Sign 으로 변경
   - Xcode Project > General Tab 접근 > Frameworks, Libraries, and Embedded Content 에 libbz2.tbd, libc++.tbd, libc++abi.tbd, libiconv.tbd, libresolv.9.tbd, libsqlite3.tbd, libxml2.tbd, libz.tbd 추가
