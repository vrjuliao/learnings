import SwiftSyntaxBuilder
import SwiftSyntax

/// This example will print the following example:
/// 
///```
/// import Foundation
/// import UIKit
/// class SomeViewController{
///    let tableView: UITableView
/// }
///```

extension ExpressibleAsTypeBuildable {
  func createTypeBuildable() -> TypeBuildable {
    return self
  }
}

// let source = SwiftSyntaxBuilder.SourceFile {
let source = SourceFile {
  ImportDecl(path: "SwiftSyntax")
  ExtensionDecl(extendedType: .start())
}

let syntax = source.buildSyntax(format: Format())

var text = ""
syntax.write(to: &text)

print(text)
