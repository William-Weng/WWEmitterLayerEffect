# WWEmitterLayerEffect
[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWEmitterLayerEffect) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [CAEmitterLayer Effect Maker (SnowFlake / Firework)](https://medium.com/@satindersingh71/smooth-core-animation-snow-effect-3d93417b96b3)
- [CAEmitterLayer效果產生器 (下雪 / 煙火)](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-caemitterlayer-製作-xmas-的下雪動畫-ee5f7cae621e)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWEmitterLayerEffect.git", .upToNextMajor(from: "1.0.1"))
]
```

https://github.com/user-attachments/assets/717a734c-1cda-42c7-8f07-26e6bd8d6a4f

https://github.com/user-attachments/assets/64534bb9-afc0-4b99-998e-7e1a89b29a95

### 可用函式 (Function)
|函式|功能|
|-|-|
|maker(with:on:image:birthRate:lifetime:color:colorRange:renderMode:)|產生Emitter效果|

### Example
```swift
import UIKit
import WWEmitterLayerEffect

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo()
    }
    
    func demo() {
        let layer = WWEmitterLayerEffect.shared.maker(with: .snowFlake, on: view, image: .firework, birthRate: 10, lifetime: 10, color: .white)
        // let layer = WWEmitterLayerEffect.shared.maker(with: .firework(2000), on: view, image: .firework, birthRate: 1, lifetime: 10, color: .systemRed)
        view.layer.addSublayer(layer)
    }
}
```
