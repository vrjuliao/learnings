// main.swift
import SwiftSyntaxBuilder
import SwiftSyntax

extension VariableDecl {
  public init(_ letOrVarKeyword: TokenSyntax,
              name: ExpressibleAsIdentifierPattern,
              type: ExpressibleAsTypeAnnotation,
              @ModifierListBuilder modifiersBuilder: () -> ExpressibleAsModifierList? = { nil },
              accessor: ExpressibleAsSyntaxBuildable? = nil,
              initializer: ExpressibleAsInitializerClause? = nil
              ) {
    self.init(letOrVarKeyword: letOrVarKeyword,
              modifiersBuilder: modifiersBuilder,
              bindingsBuilder: {
                PatternBinding(pattern: name.createIdentifierPattern(),
                               typeAnnotation: type.createTypeAnnotation(),
                               initializer: initializer,
                               accessor: accessor)
              })
  }
}
public extension MemberAccessExpr {
  let argumentList: TupleExprElementList

  /// Creates a `MemberAccessExpr` using the provided parameters.
  /// - Parameters:
  ///   - base: 
  ///   - dot: 
  ///   - name: 
  ///   - declNameArguments: 
  public init(
    base: ExpressibleAsExprBuildable? = nil,
    dot: TokenSyntax,
    name: TokenSyntax,
    @TupleExprElementListBuilder argumentListBuilder: () -> ExpressibleAsTupleExprElementList = { TupleExprElementList([]) },
  ) {
    self.base = base?.createExprBuildable()
    self.dot = dot
    assert(dot.text == "." || dot.text == ".")
    self.name = name
    self.argumentList = argumentListBuilder()
  }


  override func buildMemberAccessExpr(format: Format, leadingTrivia: Trivia? = nil) -> MemberAccessExprSyntax {
    let result = SyntaxFactory.makeMemberAccessExpr(
      base: base?.buildExpr(format: format, leadingTrivia: nil),
      dot: dot,
      name: name,
      declNameArguments: argumentList.buildTupleExprElementList(format: format, leadingTrivia: nil),
    )
    if let leadingTrivia = leadingTrivia {
      return result.withLeadingTrivia(leadingTrivia + (result.leadingTrivia ?? []))
    } else {
      return result
    }
  }
}

public extension TokenSyntax {
  static var `ppublic`: TokenSyntax = SyntaxFactory.makePublicKeyword().withTrailingTrivia(.spaces(1))
}


func addTrailingAndLeadingSpaces(_ tk: Token, _ memberAccess: FunctionCallExpr) -> FunctionCallExpr {
  var resultantMemberAccess: MemberAccessExpr = memberAccess
  let addOneSpace = DeclNameArguments(argumentsBuilder: {
    DeclNameArgument(name: SyntaxFactory.makeIdentifier(".space(1)"))
  })
  if tk.requiresLeadingSpace {
    resultantMemberAccess = MemberAccessExpr(
      base: resultantMemberAccess,
      dot: .period,
      name: SyntaxFactory.makeIdentifier("withLeadingTrivia"),
      declNameArguments: addOneSpace
    )
  } else if tk.requiresTrailingSpace {
    resultantMemberAccess = MemberAccessExpr(
      base: resultantMemberAccess,
      dot: .period,
      name: SyntaxFactory.makeIdentifier("withTrailingTrivia"),
      declNameArguments: addOneSpace
      
    )
  }
  return resultantMemberAccess
}


@main
struct Main {
static func main() {
  let source = SourceFile {
    ImportDecl(path: "SwiftSyntax")
    ExtensionDecl(extendedType: "TokenSyntax", modifiersBuilder: {
        DeclModifier(name: .ppublic)
      },
      membersBuilder: {
        VariableDecl(
          .var,
          name: "`associatedType`",
          type: "TokenSyntax",
          modifiersBuilder: {
            DeclModifier(name: .static)
          },
          accessor: CodeBlock(statementsBuilder: {
            CodeBlockItem(
              item: MemberAccessExpr(
                base: FunctionCallExpr(
                  calledExpression: "SyntaxFactory.make"+token.name+"Keyword",
                ),
                dot: .period,
                name: SyntaxFactory.makeIdentifier("BlaBla")
              )
            )
          })
          /* initializer: InitializerClause(value:
            FunctionCallExpr(calledExpression:
              MemberAccessExpr(
                base: "SyntaxFactory",
                dot: .period,
                name: SyntaxFactory.makeIdentifier("BlaBla"),

              ) 
            )
          ) */
        )
      }
    )
  }

  print(SYNTAX_TOKENS.count)
  for item in SYNTAX_TOKENS {

    print(item.name)
  }


  let syntax = source.buildSyntax(format: Format())

  var text = ""
  syntax.write(to: &text)

  print(text)
}
}