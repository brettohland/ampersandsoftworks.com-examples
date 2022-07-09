import Foundation

// MARK: - URLs (iOS 16/Xcode 14 only)

if #available(iOS 16.0, *) {

    try? URL.FormatStyle()
        .parseStrategy.parse("https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething")

    try? URL(
        "https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething",
        strategy: URL.FormatStyle().parseStrategy
    )
}
