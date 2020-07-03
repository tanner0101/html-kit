public protocol HTML {
    func render(options: HTMLRenderOptions, into stream: HTMLOutputStream)
}

extension HTML {
    public func render(options: HTMLRenderOptions = []) -> String {
        let stream = StringHTMLOutputStream()
        self.render(options: options, into: stream)
        return stream.string
    }
}

extension String: HTML {
    public func render(options: HTMLRenderOptions, into stream: HTMLOutputStream) {
        stream.write(escaped: self)
    }
}

private final class StringHTMLOutputStream: HTMLOutputStream {
    var string: String
    init() {
        self.string = ""
    }
    func write(_ string: String) {
        self.string += string
    }
}

