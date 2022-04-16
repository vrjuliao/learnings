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

func nestTriviaFunction(_ memberAccess: FunctionCallExpr, _ name: String) -> FunctionCallExpr {
  return FunctionCallExpr(
      calledExpression:
        MemberAccessExpr (
          base: memberAccess,
          dot: .period,
          name: SyntaxFactory.makeIdentifier(name)
        ),
      leftParen: .leftParen,
      rightParen: .rightParen,
      argumentListBuilder: {
        TupleExprElement(
          expression: FunctionCallExpr(
            calledExpression: ".spaces",
            leftParen: .leftParen,
            rightParen: .rightParen,
            argumentListBuilder: {
              TupleExprElement(expression: "1")
            }
          )
        )
      }
    )
}

func addTrailingAndLeadingSpaces(_ tk: Token, _ memberAccess: FunctionCallExpr) -> FunctionCallExpr {
  var resultantMemberAccess: FunctionCallExpr = memberAccess
  if tk.requiresLeadingSpace {
    resultantMemberAccess = nestTriviaFunction(resultantMemberAccess, "withLeadingTrivia")
  } 
  if tk.requiresTrailingSpace {
    resultantMemberAccess = nestTriviaFunction(resultantMemberAccess, "withTrailingTrivia")
  }
  return resultantMemberAccess
}

@main
struct Main {
static func main() {
  let source = SourceFile {
    ImportDecl(path: "SwiftSyntax")
    ExtensionDecl(extendedType: "TokenSyntax", modifiersBuilder: {
        DeclModifier(name: .public)
      },
      membersBuilder: {
        for token in SYNTAX_TOKENS {
          if token.isKeyword || token.text != nil {
          /* if false { */
            {
              var suffix: String = ""
              /// print(token.name)
              if token.isKeyword {
                suffix = "Keyword"
              } else if token.text != nil {
                suffix = "Token"
              }

              return VariableDecl(
                .var,
                name: "`"+lowercase_first_word(token.name)+"`",
                type: "TokenSyntax",
                modifiersBuilder: {
                  DeclModifier(name: .static)
                },
                accessor: CodeBlock(statementsBuilder: {
                  CodeBlockItem(
                    item: addTrailingAndLeadingSpaces (token, FunctionCallExpr(
                      calledExpression:
                        MemberAccessExpr (
                          base: "SyntaxFactory",
                          dot: .period,
                          name: SyntaxFactory.makeIdentifier("make"+token.name+suffix)
                        ),
                      leftParen: .leftParen,
                      rightParen: .rightParen
                    ))
                  )
                })
              )
            }()
          } else {
            FunctionDecl(
              identifier: SyntaxFactory.makeIdentifier("`"+lowercase_first_word(token.name)+"`"),
              signature: FunctionSignature(
                input: ParameterClause (
                  parameterListBuilder: {
                    FunctionParameter(
                      firstName: .wildcard,
                      secondName: SyntaxFactory.makeIdentifier("text"),
                      colon: .colon,
                      type: "String",
                      attributesBuilder: {}
                    )
                  }
                ),
                output: ReturnClause(
                  returnType: "TokenSyntax"
                )
              ),
              body: CodeBlock(statementsBuilder: {
                CodeBlockItem(
                  item: addTrailingAndLeadingSpaces (token, FunctionCallExpr (
                    calledExpression:
                      MemberAccessExpr (
                        base: "SyntaxFactory",
                        dot: .period,
                        name: SyntaxFactory.makeIdentifier("make"+token.name)
                      ),
                    leftParen: .leftParen,
                    rightParen: .rightParen,
                    argumentListBuilder: {
                      TupleExprElement(
                        expression: "text"
                      )
                    }
                  ))
                )
              }),
              modifiersBuilder: {
                DeclModifier(name: .static)
              }
            )
          }
        }
        VariableDecl(
          .var,
          name: "`eof`",
          type: "TokenSyntax",
          modifiersBuilder: {
            DeclModifier(name: .static)
          },
          accessor: CodeBlock(statementsBuilder: {
            CodeBlockItem(
              item: FunctionCallExpr(
                calledExpression:
                  MemberAccessExpr (
                    base: "SyntaxFactory",
                    dot: .period,
                    name: SyntaxFactory.makeIdentifier("makeToken")
                  ),
                leftParen: .leftParen,
                rightParen: .rightParen,
                argumentListBuilder: {
                  TupleExprElement(
                    expression: ".eof",
                    trailingComma: .comma
                  )
                  TupleExprElement(
                    label: SyntaxFactory.makeIdentifier("presence"),
                    colon: .colon,
                    expression: ".present"
                  )
                }
              )
            )
          })
        )
      }
    )
  }
  let syntax = source.buildSyntax(format: Format())

  var text = ""
  syntax.write(to: &text)

  print(text)
}
}