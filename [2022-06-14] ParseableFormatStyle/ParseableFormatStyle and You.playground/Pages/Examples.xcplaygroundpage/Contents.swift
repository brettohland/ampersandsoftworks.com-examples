import UIKit

// MARK: - Parsing Decimals

try? Decimal.FormatStyle().notation(.scientific).parseStrategy.parse("1E5") // 100000
try? Decimal.FormatStyle().scale(5).notation(.scientific).parseStrategy.parse("1E5") // 20000
try? Decimal.FormatStyle().scale(-5).notation(.scientific).parseStrategy.parse("1E5") // -20000
try? Decimal.FormatStyle.Percent(locale: Locale(identifier: "fr_FR")).parseStrategy.parse("1E5") // 100000
try? Decimal.FormatStyle.Percent(locale: Locale(identifier: "en_CA")).parseStrategy.parse("1E5") // 100000

try? Decimal.FormatStyle.Percent().parseStrategy.parse("15%") // 0.15
try? Decimal.FormatStyle.Percent().scale(2).parseStrategy.parse("100%") // 50
try? Decimal.FormatStyle.Percent(locale: Locale(identifier: "fr_FR")).parseStrategy.parse("15 %") // 0.15
try? Decimal.FormatStyle.Percent(locale: Locale(identifier: "en_CA")).parseStrategy.parse("15 %") // 0.15

try? Decimal.FormatStyle.Currency(code: "GBP")
    .presentation(.fullName)
    .parseStrategy.parse("10.00 British pounds") // 10

try? Decimal.FormatStyle.Currency(code: "GBP", locale: Locale(identifier: "fr_FR"))
    .presentation(.fullName)
    .parseStrategy.parse("10,00 livres sterling") // 10

try? Decimal.FormatStyle.Currency(code: "GBP")
    .presentation(.fullName)
    .locale(Locale(identifier: "fr_FR"))
    .parseStrategy.parse("10,00 livres sterling") // 10

try? Decimal("1E5", strategy: Decimal.FormatStyle().notation(.scientific).parseStrategy) // 100000
try? Decimal("1E5", format: Decimal.FormatStyle().notation(.scientific)) // 100000

try? Decimal("15%", strategy: Decimal.FormatStyle.Percent().parseStrategy)
try? Decimal("15%", format: Decimal.FormatStyle.Percent())

try? Decimal("10.00 British pounds", strategy: Decimal.FormatStyle.Currency(code: "GBP").parseStrategy) // 10
try? Decimal("10.00 British pounds", format: Decimal.FormatStyle.Currency(code: "GBP")) // 10

// MARK: - Parsing Dates

try? Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()
    .parse("Feb 22, 2022, 2:22:22 AM") // Feb 22, 2022, 2:22:22 AM

try? Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()
    .parseStrategy.parse("Feb 22, 2022, 2:22:22 AM") // Feb 22, 2022, 2:22:22 AM

try? Date.ISO8601FormatStyle(timeZone: TimeZone(secondsFromGMT: 0)!)
    .year()
    .day()
    .month()
    .dateSeparator(.dash)
    .dateTimeSeparator(.standard)
    .timeSeparator(.colon)
    .timeZoneSeparator(.colon)
    .time(includingFractionalSeconds: true)
    .parse("2022-02-22T09:22:22.000") // Feb 22, 2022, 2:22:22 AM

try? Date.ISO8601FormatStyle(timeZone: TimeZone(secondsFromGMT: 0)!)
    .year()
    .day()
    .month()
    .dateSeparator(.dash)
    .dateTimeSeparator(.standard)
    .timeSeparator(.colon)
    .timeZoneSeparator(.colon)
    .time(includingFractionalSeconds: true)
    .parseStrategy.parse("2022-02-22T09:22:22.000") // Feb 22, 2022, 2:22:22 AM

try? Date(
    "Feb 22, 2022, 2:22:22 AM",
    strategy: Date.FormatStyle().day().month().year().hour().minute().second().parseStrategy
) // Feb 22, 2022 at 2:22 AM

try? Date(
    "2022-02-22T09:22:22.000",
    strategy: Date.ISO8601FormatStyle(timeZone: TimeZone(secondsFromGMT: 0)!)
        .year()
        .day()
        .month()
        .dateSeparator(.dash)
        .dateTimeSeparator(.standard)
        .timeSeparator(.colon)
        .timeZoneSeparator(.colon)
        .time(includingFractionalSeconds: true)
        .parseStrategy
) // Feb 22, 2022 at 2:22 AM

// MARK: - Parsing Person Names

// namePrefix: Dr givenName: Elizabeth middleName: Jillian familyName: Smith nameSuffix: Esq.
try? PersonNameComponents.FormatStyle()
    .parseStrategy.parse("Dr Elizabeth Jillian Smith Esq.")

// namePrefix: Dr givenName: Elizabeth middleName: Jillian familyName: Smith nameSuffix: Esq.
try? PersonNameComponents.FormatStyle(style: .long)
    .parseStrategy.parse("Dr Elizabeth Jillian Smith Esq.")

// namePrefix: Dr givenName: Elizabeth middleName: Jillian familyName: Smith nameSuffix: Esq.
try? PersonNameComponents.FormatStyle(style: .long, locale: Locale(identifier: "zh_CN"))
    .parseStrategy.parse("Dr Smith Elizabeth Jillian Esq.")

// namePrefix: Dr givenName: Elizabeth middleName: Jillian familyName: Smith nameSuffix: Esq.
try? PersonNameComponents.FormatStyle(style: .long)
    .locale(Locale(identifier: "zh_CN"))
    .parseStrategy.parse("Dr Smith Elizabeth Jillian Esq.")

// namePrefix: Dr givenName: Elizabeth middleName: Jillian familyName: Smith nameSuffix: Esq.
try? PersonNameComponents(
    "Dr Elizabeth Jillian Smith Esq.",
    strategy: PersonNameComponents.FormatStyle(style: .long).parseStrategy
)

rse
