public protocol HTMLElement: HTML {
    var tag: String { get }
    var attributes: [String: String] { get set }
    var children: [HTML] { get set }
}

extension HTMLElement {
    public func attribute(_ key: String, _ value: String) -> Self {
        var copy = self
        copy.attributes[key] = value
        return copy
    }

    public func `class`(_ value: String) -> Self {
        var copy = self
        if let current = self.attributes["class"] {
            copy.attributes["class"] = "\(current) \(value)"
        } else {
            copy.attributes["class"] = value
        }
        return copy
    }

    public func id(_ value: String) -> Self {
        self.attribute("id", value)
    }
}

extension HTMLElement {
    public func render(options: HTMLRenderOptions, into stream: HTMLOutputStream) {
        stream.write("<")
        stream.write(tag)
        for (key, value) in self.attributes.sorted(by: { $0.0 < $1.0 }) {
            stream.write(" ")
            stream.write(key)
            stream.write("=")
            stream.write(doubleQuoted: value)
        }
        if self.children.isEmpty {
            stream.write("/>")
        } else {
            stream.write(">")
            if options.contains(.prettyPrint) && !self.children.isOneLiner {
                for child in self.children {
                    stream.write("\n    ")
                    child.render(options: options, into: IndentingHTMLOutputStream(base: stream))
                }
                stream.write("\n")
            } else {
                for child in self.children {
                    child.render(options: options, into: stream)
                }
            }
            stream.write("</")
            stream.write(self.tag)
            stream.write(">")
        }
    }
}

private struct IndentingHTMLOutputStream: HTMLOutputStream {
    let base: HTMLOutputStream
    func write(_ string: String) {
        let indented = string.split(
            separator: "\n",
            maxSplits: .max,
            omittingEmptySubsequences: false
        ).joined(separator: "\n    ")
        self.base.write(indented)
    }
}

private extension Array where Element == HTML {
    var isOneLiner: Bool {
        self.count == 1 && self[0] is String
    }
}
