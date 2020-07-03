public protocol HTMLView: HTML {
    associatedtype BodyType: HTML
    var body: BodyType { get }
}

extension HTMLView {
    public func render(options: HTMLRenderOptions, into stream: HTMLOutputStream) {
        self.body.render(options: options, into: stream)
    }
}
