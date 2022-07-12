### 🌎 GeoPoster

Just a simple iOS SDK Example/Template for iOS 13.0+



### Quickstart

Initialize `GeoPosterService` with an API key:

```swift
import GeoPoster

let service = GeoPosterService("123")
```

And post a location from a [CoreLocation manager](https://developer.apple.com/documentation/corelocation/getting_the_user_s_location) to the server with the `log` method:

```swift
import CoreLocation

do { 
    let location = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    let response = try await service.log(location, time: .now, extra: "A note")
    print(response)
} catch { 
    print(error)
}
```

If successful, `service.log` will return a `GeoPosterResponse` object.



### Tests

To execute package tests use: `⌘ + U`.



### Swift Package Manager

Add GeoPoster to your project with:

```swift
dependencies: [
    .package(url: "https://github.com/maxhumber/GeoPoster.git", .upToNextMajor(from: "1.0"))
]
```
