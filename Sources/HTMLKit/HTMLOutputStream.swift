public protocol HTMLOutputStream {
    func write(_ string: String)
}

extension HTMLOutputStream {
    public func write(doubleQuoted string: String) {
        self.write("\"\(string)\"")
    }
    public func write(escaped string: String) {
        let escaped = string
            .split(separator: "<").joined(separator: "&lt;")
            .split(separator: "<").joined(separator: "&gt;")
        self.write(escaped)
    }
}
