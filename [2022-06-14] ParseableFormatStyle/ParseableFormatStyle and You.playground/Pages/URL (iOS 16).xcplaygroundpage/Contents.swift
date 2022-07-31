import Foundation

// MARK: - URLs (iOS 16/Xcode 14 only)

if #available(iOS 16.0, *) {

    do {
        try URL.FormatStyle.Strategy(port: .defaultValue(80)).parse("http://www.apple.com") // http://www.apple.com:80
        try URL.FormatStyle.Strategy(port: .optional).parse("http://www.apple.com") // http://www.apple.com
        try? URL.FormatStyle.Strategy(port: .required).parse("http://www.apple.com") // nil

        // This returns a valid URL
        try URL.FormatStyle.Strategy()
            .scheme(.required)
            .user(.required)
            .password(.required)
            .host(.required)
            .port(.required)
            .path(.required)
            .query(.required)
            .fragment(.required)
            .parse("https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething")

        // This throws an error
        try URL.FormatStyle.Strategy()
            .scheme(.required)
            .user(.required)
            .password(.required)
            .host(.required)
            .port(.required)
            .path(.required)
            .query(.required)
            .fragment(.required)
            .parse("https://jAppleseed:Test1234@apple.com/macbook-pro?get-free#someFragmentOfSomething")

    } catch {
        print(error)
    }
}
