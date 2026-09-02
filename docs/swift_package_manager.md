# REVUP for [Swift Package Manager(SPM)](https://www.swift.org/documentation/package-manager/) Integration

## Requirements
### Build Settings 수정
- TARGETS > Build Settings > Other Linker Flags 에 `-ObjC` 추가<br/>

![image](https://github.com/user-attachments/assets/78c0472d-e384-406a-b038-a177c4ab3458)
<br/><br/><br/>

## Installation
1. Xcode에서 File > Add Package Dependencies로 이동
2. 아래 REVUP Swift Package Manager GitHub 주소를 입력
3. REVUP 모두 설치
```html
https://github.com/revup-tnk/REVUP-SPM.git
```
<br/>

4. 사용할 패키지 버전 선택 후 설치 (3번 설치 했으면 무시)
<details>
<summary>REVUP 선택적 네트워크 설치</summary>
<div markdown="1">  

#### REVUP Netowrks Versions
| SDK                              | 1.1.10 | 1.1.9 | 1.1.8 | 1.1.7 | 1.1.6 | 1.1.5 | 1.1.3 | 1.1.1 | 1.1.0 | 1.0.0 |
|----------------------------------|--------|-------|-------|-------|-------|-------|-------|-------|-------|-------|
| REVUP                            | 1.1.10 | 1.1.9 | 1.1.8 | 1.1.7 | 1.1.6 | 1.1.5 | 1.1.3 | 1.1.1 | 1.1.0 | 1.0.0 |
| REVUPCore                        | 1.1.10 | 1.1.9 | 1.1.8 | 1.1.7 | 1.1.6 | 1.1.5 | 1.1.3 | 1.1.1 | 1.1.0 | 1.0.0 |
| REVUPLuckyEvent                  | 1.1.10 | 1.1.9 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaAdManager              | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaAdMob                  | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaChartBoost             | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaPangle                 | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaTnkPub                 | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaVungle                 | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMax                    | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterAdManager    | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterAdMob        | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterBidMachine   | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterBigo         | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterChartBoost   | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterDTExchange   | 1.1.1  | 1.1.1 | 1.1.1 | 1.1.1 | 1.1.1 | 1.1.1 | 1.1.1 | 1.1.1 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterFan          | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterInMobi       | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterIronSource   | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterLine         | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterMobVista     | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterMoloco       | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterOgury        | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterPangle       | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterPubMatic     | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterUnityAds     | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |
| REVUPMediaMaxAdapterVungle       | 1.1.0  | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.1.0 | 1.0.0 |

#### 필수
```html
https://github.com/revup-tnk/REVUPCore-SPM.git
```

#### 선택
```html
https://github.com/revup-tnk/REVUPLuckyEvent-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaAdManager-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaAdMob-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaChartBoost-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaPangle-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaTnkPub-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaVungle-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMax-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterAdManager-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterAdMob-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterBidMachine-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterBigo-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterChartBoost-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterDTExchange-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterFan-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterInMobi-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterIronSource-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterLine-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterMobVista-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterMoloco-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterOgury-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterPangle-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterPubMatic-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterUnityAds-SPM.git
```
```html
https://github.com/revup-tnk/REVUPMediaMaxAdapterVungle-SPM.git
```

</div>
</details>
