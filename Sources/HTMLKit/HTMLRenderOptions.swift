public struct HTMLRenderOptions: OptionSet {
    public static let prettyPrint = Self(rawValue: 1 << 0)
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
