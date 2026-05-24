import Foundation

enum BibleServiceError: LocalizedError {
    case invalidURL
    case emptyChapter

    var errorDescription: String? {
        switch self {
        case .invalidURL: "読み込み先を作れませんでした。"
        case .emptyChapter: "本文を取得できませんでした。"
        }
    }
}

struct BibleService {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func loadChapter(book: BibleBook, chapter: Int, translation: BibleTranslation) async throws -> BibleChapter {
        let urlString = "https://api.getbible.net/v2/\(translation.apiKey)/\(book.bookNumber)/\(chapter).json"

        guard let url = URL(string: urlString) else {
            throw BibleServiceError.invalidURL
        }

        let (data, _) = try await session.data(from: url)
        let decoded = try JSONDecoder().decode(GetBibleResponse.self, from: data)

        let verses = decoded.verses.map { v in
            BibleVerse(verse: v.verse, text: v.text.trimmingCharacters(in: .whitespacesAndNewlines))
        }

        guard !verses.isEmpty else {
            throw BibleServiceError.emptyChapter
        }

        return BibleChapter(book: book, chapter: chapter, translation: translation, verses: verses)
    }
}

private struct GetBibleResponse: Decodable {
    let verses: [GetBibleVerse]
}

private struct GetBibleVerse: Decodable {
    let verse: Int
    let text: String
}
