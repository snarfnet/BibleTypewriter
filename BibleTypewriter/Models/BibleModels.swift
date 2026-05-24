import Foundation

enum BibleTranslation: String, CaseIterable, Identifiable {
    case bungo
    case web
    case kjv

    var id: String { rawValue }

    var title: String {
        switch self {
        case .bungo: "文語訳"
        case .web: "WEB"
        case .kjv: "KJV"
        }
    }

    var apiKey: String {
        switch self {
        case .bungo: "japbungo"
        case .web: "web"
        case .kjv: "kjv"
        }
    }
}

struct BibleBook: Identifiable, Hashable {
    let id: String
    let bookNumber: Int
    let name: String
    let japaneseName: String
    let chapters: Int
    let category: BackgroundCategory
}

struct BibleVerse: Identifiable, Hashable {
    let verse: Int
    let text: String

    var id: Int { verse }
}

struct BibleChapter: Hashable {
    let book: BibleBook
    let chapter: Int
    let translation: BibleTranslation
    let verses: [BibleVerse]

    var reference: String {
        "\(book.japaneseName) \(chapter)章 / \(translation.title)"
    }

    var text: String {
        verses
            .map { "[\($0.verse)] \($0.text)" }
            .joined(separator: "\n\n")
    }
}

enum BackgroundCategory: String, CaseIterable {
    case genesis
    case exodus
    case psalms
    case proverbs
    case prophets
    case gospels
    case acts
    case letters
    case revelation

    var count: Int {
        switch self {
        case .genesis: 10
        case .exodus: 9
        case .psalms: 9
        case .proverbs: 9
        case .prophets: 9
        case .gospels: 9
        case .acts: 8
        case .letters: 8
        case .revelation: 9
        }
    }
}

enum BibleCatalog {
    static let books: [BibleBook] = [
        BibleBook(id: "genesis", bookNumber: 1, name: "Genesis", japaneseName: "創世記", chapters: 50, category: .genesis),
        BibleBook(id: "exodus", bookNumber: 2, name: "Exodus", japaneseName: "出エジプト記", chapters: 40, category: .exodus),
        BibleBook(id: "leviticus", bookNumber: 3, name: "Leviticus", japaneseName: "レビ記", chapters: 27, category: .genesis),
        BibleBook(id: "numbers", bookNumber: 4, name: "Numbers", japaneseName: "民数記", chapters: 36, category: .genesis),
        BibleBook(id: "deuteronomy", bookNumber: 5, name: "Deuteronomy", japaneseName: "申命記", chapters: 34, category: .genesis),
        BibleBook(id: "joshua", bookNumber: 6, name: "Joshua", japaneseName: "ヨシュア記", chapters: 24, category: .genesis),
        BibleBook(id: "judges", bookNumber: 7, name: "Judges", japaneseName: "士師記", chapters: 21, category: .genesis),
        BibleBook(id: "ruth", bookNumber: 8, name: "Ruth", japaneseName: "ルツ記", chapters: 4, category: .genesis),
        BibleBook(id: "1-samuel", bookNumber: 9, name: "1 Samuel", japaneseName: "サムエル記上", chapters: 31, category: .prophets),
        BibleBook(id: "2-samuel", bookNumber: 10, name: "2 Samuel", japaneseName: "サムエル記下", chapters: 24, category: .prophets),
        BibleBook(id: "1-kings", bookNumber: 11, name: "1 Kings", japaneseName: "列王紀上", chapters: 22, category: .prophets),
        BibleBook(id: "2-kings", bookNumber: 12, name: "2 Kings", japaneseName: "列王紀下", chapters: 25, category: .prophets),
        BibleBook(id: "1-chronicles", bookNumber: 13, name: "1 Chronicles", japaneseName: "歴代志上", chapters: 29, category: .prophets),
        BibleBook(id: "2-chronicles", bookNumber: 14, name: "2 Chronicles", japaneseName: "歴代志下", chapters: 36, category: .prophets),
        BibleBook(id: "ezra", bookNumber: 15, name: "Ezra", japaneseName: "エズラ記", chapters: 10, category: .prophets),
        BibleBook(id: "nehemiah", bookNumber: 16, name: "Nehemiah", japaneseName: "ネヘミヤ記", chapters: 13, category: .prophets),
        BibleBook(id: "esther", bookNumber: 17, name: "Esther", japaneseName: "エステル記", chapters: 10, category: .prophets),
        BibleBook(id: "job", bookNumber: 18, name: "Job", japaneseName: "ヨブ記", chapters: 42, category: .psalms),
        BibleBook(id: "psalms", bookNumber: 19, name: "Psalms", japaneseName: "詩篇", chapters: 150, category: .psalms),
        BibleBook(id: "proverbs", bookNumber: 20, name: "Proverbs", japaneseName: "箴言", chapters: 31, category: .proverbs),
        BibleBook(id: "ecclesiastes", bookNumber: 21, name: "Ecclesiastes", japaneseName: "伝道之書", chapters: 12, category: .proverbs),
        BibleBook(id: "song-of-solomon", bookNumber: 22, name: "Song of Solomon", japaneseName: "雅歌", chapters: 8, category: .proverbs),
        BibleBook(id: "isaiah", bookNumber: 23, name: "Isaiah", japaneseName: "イザヤ書", chapters: 66, category: .prophets),
        BibleBook(id: "jeremiah", bookNumber: 24, name: "Jeremiah", japaneseName: "エレミヤ書", chapters: 52, category: .prophets),
        BibleBook(id: "lamentations", bookNumber: 25, name: "Lamentations", japaneseName: "哀歌", chapters: 5, category: .prophets),
        BibleBook(id: "ezekiel", bookNumber: 26, name: "Ezekiel", japaneseName: "エゼキエル書", chapters: 48, category: .prophets),
        BibleBook(id: "daniel", bookNumber: 27, name: "Daniel", japaneseName: "ダニエル書", chapters: 12, category: .prophets),
        BibleBook(id: "hosea", bookNumber: 28, name: "Hosea", japaneseName: "ホセア書", chapters: 14, category: .prophets),
        BibleBook(id: "joel", bookNumber: 29, name: "Joel", japaneseName: "ヨエル書", chapters: 3, category: .prophets),
        BibleBook(id: "amos", bookNumber: 30, name: "Amos", japaneseName: "アモス書", chapters: 9, category: .prophets),
        BibleBook(id: "obadiah", bookNumber: 31, name: "Obadiah", japaneseName: "オバデヤ書", chapters: 1, category: .prophets),
        BibleBook(id: "jonah", bookNumber: 32, name: "Jonah", japaneseName: "ヨナ書", chapters: 4, category: .prophets),
        BibleBook(id: "micah", bookNumber: 33, name: "Micah", japaneseName: "ミカ書", chapters: 7, category: .prophets),
        BibleBook(id: "nahum", bookNumber: 34, name: "Nahum", japaneseName: "ナホム書", chapters: 3, category: .prophets),
        BibleBook(id: "habakkuk", bookNumber: 35, name: "Habakkuk", japaneseName: "ハバクク書", chapters: 3, category: .prophets),
        BibleBook(id: "zephaniah", bookNumber: 36, name: "Zephaniah", japaneseName: "ゼパニヤ書", chapters: 3, category: .prophets),
        BibleBook(id: "haggai", bookNumber: 37, name: "Haggai", japaneseName: "ハガイ書", chapters: 2, category: .prophets),
        BibleBook(id: "zechariah", bookNumber: 38, name: "Zechariah", japaneseName: "ゼカリヤ書", chapters: 14, category: .prophets),
        BibleBook(id: "malachi", bookNumber: 39, name: "Malachi", japaneseName: "マラキ書", chapters: 4, category: .prophets),
        BibleBook(id: "matthew", bookNumber: 40, name: "Matthew", japaneseName: "マタイ伝", chapters: 28, category: .gospels),
        BibleBook(id: "mark", bookNumber: 41, name: "Mark", japaneseName: "マルコ伝", chapters: 16, category: .gospels),
        BibleBook(id: "luke", bookNumber: 42, name: "Luke", japaneseName: "ルカ伝", chapters: 24, category: .gospels),
        BibleBook(id: "john", bookNumber: 43, name: "John", japaneseName: "ヨハネ伝", chapters: 21, category: .gospels),
        BibleBook(id: "acts", bookNumber: 44, name: "Acts", japaneseName: "使徒行伝", chapters: 28, category: .acts),
        BibleBook(id: "romans", bookNumber: 45, name: "Romans", japaneseName: "ロマ書", chapters: 16, category: .letters),
        BibleBook(id: "1-corinthians", bookNumber: 46, name: "1 Corinthians", japaneseName: "コリント前書", chapters: 16, category: .letters),
        BibleBook(id: "2-corinthians", bookNumber: 47, name: "2 Corinthians", japaneseName: "コリント後書", chapters: 13, category: .letters),
        BibleBook(id: "galatians", bookNumber: 48, name: "Galatians", japaneseName: "ガラテヤ書", chapters: 6, category: .letters),
        BibleBook(id: "ephesians", bookNumber: 49, name: "Ephesians", japaneseName: "エペソ書", chapters: 6, category: .letters),
        BibleBook(id: "philippians", bookNumber: 50, name: "Philippians", japaneseName: "ピリピ書", chapters: 4, category: .letters),
        BibleBook(id: "colossians", bookNumber: 51, name: "Colossians", japaneseName: "コロサイ書", chapters: 4, category: .letters),
        BibleBook(id: "1-thessalonians", bookNumber: 52, name: "1 Thessalonians", japaneseName: "テサロニケ前書", chapters: 5, category: .letters),
        BibleBook(id: "2-thessalonians", bookNumber: 53, name: "2 Thessalonians", japaneseName: "テサロニケ後書", chapters: 3, category: .letters),
        BibleBook(id: "1-timothy", bookNumber: 54, name: "1 Timothy", japaneseName: "テモテ前書", chapters: 6, category: .letters),
        BibleBook(id: "2-timothy", bookNumber: 55, name: "2 Timothy", japaneseName: "テモテ後書", chapters: 4, category: .letters),
        BibleBook(id: "titus", bookNumber: 56, name: "Titus", japaneseName: "テトス書", chapters: 3, category: .letters),
        BibleBook(id: "philemon", bookNumber: 57, name: "Philemon", japaneseName: "ピレモン書", chapters: 1, category: .letters),
        BibleBook(id: "hebrews", bookNumber: 58, name: "Hebrews", japaneseName: "ヘブル書", chapters: 13, category: .letters),
        BibleBook(id: "james", bookNumber: 59, name: "James", japaneseName: "ヤコブ書", chapters: 5, category: .letters),
        BibleBook(id: "1-peter", bookNumber: 60, name: "1 Peter", japaneseName: "ペテロ前書", chapters: 5, category: .letters),
        BibleBook(id: "2-peter", bookNumber: 61, name: "2 Peter", japaneseName: "ペテロ後書", chapters: 3, category: .letters),
        BibleBook(id: "1-john", bookNumber: 62, name: "1 John", japaneseName: "ヨハネ第一書", chapters: 5, category: .letters),
        BibleBook(id: "2-john", bookNumber: 63, name: "2 John", japaneseName: "ヨハネ第二書", chapters: 1, category: .letters),
        BibleBook(id: "3-john", bookNumber: 64, name: "3 John", japaneseName: "ヨハネ第三書", chapters: 1, category: .letters),
        BibleBook(id: "jude", bookNumber: 65, name: "Jude", japaneseName: "ユダ書", chapters: 1, category: .letters),
        BibleBook(id: "revelation", bookNumber: 66, name: "Revelation", japaneseName: "黙示録", chapters: 22, category: .revelation)
    ]
}
