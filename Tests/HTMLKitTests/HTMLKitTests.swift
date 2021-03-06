import XCTest
@testable import HTMLKit

final class HTMLKitTests: XCTestCase {
    func testExample() {
        let html = Website(
            title: "Welcome!",
            page: HomePage(name: "Vapor")
        )
        XCTAssertEqual(html.render(options: .prettyPrint), """
        <html>
            <head>
                <title>Welcome!</title>
            </head>
            <body>
                <img alt="Our logo" src="logo.png"/>
                <div>
                    <h1 class="large red" id="header">Hello, world!</h1>
                    <p>Welcome to my website</p>
                    <p>You are currently logged in as: Vapor</p>
                    <form>
                        <input name="email" required/>
                    </form>
                </div>
                <script>
                    func add(x, y) {
                        return x + x
                    }
                    var x = add(1, 1)
                    console.log("hello")
                </script>
            </body>
        </html>
        """)
    }
}

struct Website: HTMLView {
    let title: String
    let page: HTML

    var body: some HTML {
        Root {
            Head {
                Title(self.title)
            }
            Body {
                Img(src: "logo.png").alt("Our logo")
                self.page
                Script("""
                func add(x, y) {
                    return x + x
                }
                var x = add(1, 1)
                console.log("hello")
                """)
            }
        }
    }
}

struct HomePage: HTMLView {
    let name: String

    var body: some HTML {
        Div {
            H1("Hello, world!")
                .id("header")
                .class("large").class("red")
            P("Welcome to my website")
            P("You are currently logged in as: \(self.name)")
            // Example of arbitrary HTML creation
            Element(tag: "form") {
                Element(tag: "input")
                    .attribute("required")
                    .attribute("name", "email")
            }
        }
    }
}
