## Problemas relacionados ao uso do SwiftSyntaxBuilder

- A relação: MemberAccessExpr -> DeclNameArguments
  - Nao faz sentido `DeclNameArguments` receber apenas o nome do parametro.
  - Ele deveria ser capaz de receber opcionalmente o nome do parâmetro,
    juntamente com o valor que será aplicado àquele nome.
  - Entretanto o nome pode ser opcional e com isso o caractere ':' também
    o seria.

- Duvida: A maneira correta de gerar a expressão do tipo:
  ```swift
  static var `ppublic`: TokenSyntax { SyntaxFactory.makePublicKeyword().withTrailingTrivia(.spaces(1)) }
  ``` 
  é através do aninhamento: `PatternBinding.accessor: CodeBlock -> CodeBlockItem.item -> MemberAccessExpr`?
  - Se sim, então o problem acima é pertinente.
  - Se não, então qual a maneira correta de gerar o código demostrado? Acredito que não haja outra opção. E de acordo com os nomes dos métodos e structs, um `CodeBlock` não me parece ser a opção correta para criar um `Accessor`.
  - Na realidade, essa expressão é um tipo de inicialização, então há necessidade de readequar os tipos de inicialização, e adicionar esse tipo ao invés apenas da sintaxe que utiliza o simbolo de atribuição `=`.
