# SearchHub
Swift + SwiftUI + Combine Github repository search example

## About

This app is a showcase of iOS app executing Gihub repositories search. It was built basing on MVVM + Coordinator pattern. Technologies used are Swift, SwiftUI and Combine, to avoid external dependencies. Because of the state of the technologies today, I decided to use hybrid screens construction - well-known `AppDelegate` and `UIViewController` for the views lifecycle and navigation, filled with SwiftUI views. Main motivation was still fresh state of SwiftUI, not covering all features of UIKit yet. 

## Features

- Small SwiftUI components library, created with atomic design approach, including search bar 
- Single-responsibility coordinator and facade, creating clean navigation flow
- MVVM view structure with dependencies split as follows: 
  - Model for the business logic and internat state important for the view, but not being displayed
  - View Model being the bridge between View and Model, "translating" business state to display-friendly form
  - View Controller - UIKIt entity handling screen lifecycle 
  - Content View being the root view of View Controller, managed by View Model
- Easily scalable Endpoint definition using EndpointProtocol defining `associatedtype RequestError` and `associatedtype Response`
- Simple search service
- Service for fetching images from URLs, used to display users' avatars
- Caching repository for fetched images
- Shared theme for all components

## To Do

Since the app was just a showcase, it includes many areas for improvements. Few ideas are:
- Add accessibility labels and IDs
- Move all strings to the dictionary 
- Unit tests for caching repository and the endpoint 
- Define fonts and spacings in the shared theme 
- Add a toggle to switch between light and dark theme
- Introduce Swift Lint and Swift Format 
- Improve memory usage (maybe `downloadTask` would be a better option in this case)
