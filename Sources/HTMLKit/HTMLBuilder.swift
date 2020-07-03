@_functionBuilder
public struct HTMLBuilder {
    public static func buildExpression(_ expression: HTML) -> [HTML] {
        [expression]
    }

    public static func buildBlock(_ children: [HTML]...) -> [HTML] {
        children.flatMap { $0 }
    }

    public static func buildBlock(_ component: [HTML]) -> [HTML] {
        component
    }

    public static func buildOptional(_ children: [HTML]?) -> [HTML] {
        children ?? []
    }
}
