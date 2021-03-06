public struct Element: HTMLElement {
    public let tag: String
    public var attributes: [String: String]
    public var children: [HTML]

    public init(tag: String, @HTMLBuilder makeChildren: () -> [HTML] = { [] }) {
        self.tag = tag
        self.attributes = [:]
        self.children = makeChildren()
    }
}

public struct H1: HTMLElement {
    public var tag: String {
        "h1"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(_ text: String) {
        self.attributes = [:]
        self.children = [text]
    }
}

public struct Img: HTMLElement {
    public var tag: String {
        "img"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(src: String) {
        self.attributes = ["src": src]
        self.children = []
    }

    public func alt(_ value: String) -> Self {
        self.attribute("alt", value)
    }
}

public struct P: HTMLElement {
    public var tag: String {
        "p"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(_ text: String) {
        self.attributes = [:]
        self.children = [text]
    }
}

public struct Div: HTMLElement {
    public var tag: String {
        "div"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(@HTMLBuilder makeChildren: () -> [HTML]) {
        self.attributes = [:]
        self.children = makeChildren()
    }
}

public struct Root: HTMLElement {
    public var tag: String {
        "html"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(@HTMLBuilder makeChildren: () -> [HTML]) {
        self.attributes = [:]
        self.children = makeChildren()
    }
}

public struct Head: HTMLElement {
    public var tag: String {
        "head"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(@HTMLBuilder makeChildren: () -> [HTML]) {
        self.attributes = [:]
        self.children = makeChildren()
    }
}

public struct Body: HTMLElement {
    public var tag: String {
        "body"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(@HTMLBuilder makeChildren: () -> [HTML]) {
        self.attributes = [:]
        self.children = makeChildren()
    }
}

public struct Title: HTMLElement {
    public var tag: String {
        "title"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(_ text: String) {
        self.attributes = [:]
        self.children = [text]
    }
}


public struct UnescapedString: HTML {
    public let string: String
    public init(_ string: String) {
        self.string = string
    }
    public func render(options: HTMLRenderOptions, into stream: HTMLOutputStream) {
        stream.write(self.string)
    }
}

public struct Script: HTMLElement {
    public var tag: String {
        "script"
    }

    public var attributes: [String: String]
    public var children: [HTML]

    public init(_ script: String) {
        self.attributes = [:]
        self.children = [UnescapedString(script)]
    }
}