
import SwiftSyntax
public extension TokenSyntax{
    static var `associatedtype`: TokenSyntax{
        SyntaxFactory.makeAssociatedtypeKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `class`: TokenSyntax{
        SyntaxFactory.makeClassKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `deinit`: TokenSyntax{
        SyntaxFactory.makeDeinitKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `enum`: TokenSyntax{
        SyntaxFactory.makeEnumKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `extension`: TokenSyntax{
        SyntaxFactory.makeExtensionKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `func`: TokenSyntax{
        SyntaxFactory.makeFuncKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `import`: TokenSyntax{
        SyntaxFactory.makeImportKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `init`: TokenSyntax{
        SyntaxFactory.makeInitKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `inout`: TokenSyntax{
        SyntaxFactory.makeInoutKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `let`: TokenSyntax{
        SyntaxFactory.makeLetKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `operator`: TokenSyntax{
        SyntaxFactory.makeOperatorKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `precedencegroup`: TokenSyntax{
        SyntaxFactory.makePrecedencegroupKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `protocol`: TokenSyntax{
        SyntaxFactory.makeProtocolKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `struct`: TokenSyntax{
        SyntaxFactory.makeStructKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `subscript`: TokenSyntax{
        SyntaxFactory.makeSubscriptKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `typealias`: TokenSyntax{
        SyntaxFactory.makeTypealiasKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `var`: TokenSyntax{
        SyntaxFactory.makeVarKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `fileprivate`: TokenSyntax{
        SyntaxFactory.makeFileprivateKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `internal`: TokenSyntax{
        SyntaxFactory.makeInternalKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `private`: TokenSyntax{
        SyntaxFactory.makePrivateKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `public`: TokenSyntax{
        SyntaxFactory.makePublicKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `static`: TokenSyntax{
        SyntaxFactory.makeStaticKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `defer`: TokenSyntax{
        SyntaxFactory.makeDeferKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `if`: TokenSyntax{
        SyntaxFactory.makeIfKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `guard`: TokenSyntax{
        SyntaxFactory.makeGuardKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `do`: TokenSyntax{
        SyntaxFactory.makeDoKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `repeat`: TokenSyntax{
        SyntaxFactory.makeRepeatKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `else`: TokenSyntax{
        SyntaxFactory.makeElseKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `for`: TokenSyntax{
        SyntaxFactory.makeForKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `in`: TokenSyntax{
        SyntaxFactory.makeInKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `while`: TokenSyntax{
        SyntaxFactory.makeWhileKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `return`: TokenSyntax{
        SyntaxFactory.makeReturnKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `break`: TokenSyntax{
        SyntaxFactory.makeBreakKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `continue`: TokenSyntax{
        SyntaxFactory.makeContinueKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `fallthrough`: TokenSyntax{
        SyntaxFactory.makeFallthroughKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `switch`: TokenSyntax{
        SyntaxFactory.makeSwitchKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `case`: TokenSyntax{
        SyntaxFactory.makeCaseKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `default`: TokenSyntax{
        SyntaxFactory.makeDefaultKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `where`: TokenSyntax{
        SyntaxFactory.makeWhereKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `catch`: TokenSyntax{
        SyntaxFactory.makeCatchKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `throw`: TokenSyntax{
        SyntaxFactory.makeThrowKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `as`: TokenSyntax{
        SyntaxFactory.makeAsKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `any`: TokenSyntax{
        SyntaxFactory.makeAnyKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `false`: TokenSyntax{
        SyntaxFactory.makeFalseKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `is`: TokenSyntax{
        SyntaxFactory.makeIsKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `nil`: TokenSyntax{
        SyntaxFactory.makeNilKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `rethrows`: TokenSyntax{
        SyntaxFactory.makeRethrowsKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `super`: TokenSyntax{
        SyntaxFactory.makeSuperKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `self`: TokenSyntax{
        SyntaxFactory.makeSelfKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `capitalSelf`: TokenSyntax{
        SyntaxFactory.makeCapitalSelfKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `true`: TokenSyntax{
        SyntaxFactory.makeTrueKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `try`: TokenSyntax{
        SyntaxFactory.makeTryKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `throws`: TokenSyntax{
        SyntaxFactory.makeThrowsKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `__file__`: TokenSyntax{
        SyntaxFactory.make__FILE__Keyword().withTrailingTrivia(.spaces(1))
    }
    static var `__line__`: TokenSyntax{
        SyntaxFactory.make__LINE__Keyword().withTrailingTrivia(.spaces(1))
    }
    static var `__column__`: TokenSyntax{
        SyntaxFactory.make__COLUMN__Keyword().withTrailingTrivia(.spaces(1))
    }
    static var `__function__`: TokenSyntax{
        SyntaxFactory.make__FUNCTION__Keyword().withTrailingTrivia(.spaces(1))
    }
    static var `__dso_handle__`: TokenSyntax{
        SyntaxFactory.make__DSO_HANDLE__Keyword().withTrailingTrivia(.spaces(1))
    }
    static var `wildcard`: TokenSyntax{
        SyntaxFactory.makeWildcardKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `leftParen`: TokenSyntax{
        SyntaxFactory.makeLeftParenToken()
    }
    static var `rightParen`: TokenSyntax{
        SyntaxFactory.makeRightParenToken()
    }
    static var `leftBrace`: TokenSyntax{
        SyntaxFactory.makeLeftBraceToken()
    }
    static var `rightBrace`: TokenSyntax{
        SyntaxFactory.makeRightBraceToken()
    }
    static var `leftSquareBracket`: TokenSyntax{
        SyntaxFactory.makeLeftSquareBracketToken()
    }
    static var `rightSquareBracket`: TokenSyntax{
        SyntaxFactory.makeRightSquareBracketToken()
    }
    static var `leftAngle`: TokenSyntax{
        SyntaxFactory.makeLeftAngleToken().withLeadingTrivia(.spaces(1)).withTrailingTrivia(.spaces(1))
    }
    static var `rightAngle`: TokenSyntax{
        SyntaxFactory.makeRightAngleToken().withLeadingTrivia(.spaces(1)).withTrailingTrivia(.spaces(1))
    }
    static var `period`: TokenSyntax{
        SyntaxFactory.makePeriodToken()
    }
    static var `prefixPeriod`: TokenSyntax{
        SyntaxFactory.makePrefixPeriodToken()
    }
    static var `comma`: TokenSyntax{
        SyntaxFactory.makeCommaToken().withTrailingTrivia(.spaces(1))
    }
    static var `ellipsis`: TokenSyntax{
        SyntaxFactory.makeEllipsisToken()
    }
    static var `colon`: TokenSyntax{
        SyntaxFactory.makeColonToken().withTrailingTrivia(.spaces(1))
    }
    static var `semicolon`: TokenSyntax{
        SyntaxFactory.makeSemicolonToken()
    }
    static var `equal`: TokenSyntax{
        SyntaxFactory.makeEqualToken().withLeadingTrivia(.spaces(1)).withTrailingTrivia(.spaces(1))
    }
    static var `atSign`: TokenSyntax{
        SyntaxFactory.makeAtSignToken()
    }
    static var `pound`: TokenSyntax{
        SyntaxFactory.makePoundToken()
    }
    static var `prefixAmpersand`: TokenSyntax{
        SyntaxFactory.makePrefixAmpersandToken().withLeadingTrivia(.spaces(1)).withTrailingTrivia(.spaces(1))
    }
    static var `arrow`: TokenSyntax{
        SyntaxFactory.makeArrowToken().withTrailingTrivia(.spaces(1))
    }
    static var `backtick`: TokenSyntax{
        SyntaxFactory.makeBacktickToken()
    }
    static var `backslash`: TokenSyntax{
        SyntaxFactory.makeBackslashToken()
    }
    static var `exclamationMark`: TokenSyntax{
        SyntaxFactory.makeExclamationMarkToken()
    }
    static var `postfixQuestionMark`: TokenSyntax{
        SyntaxFactory.makePostfixQuestionMarkToken()
    }
    static var `infixQuestionMark`: TokenSyntax{
        SyntaxFactory.makeInfixQuestionMarkToken()
    }
    static var `stringQuote`: TokenSyntax{
        SyntaxFactory.makeStringQuoteToken()
    }
    static var `singleQuote`: TokenSyntax{
        SyntaxFactory.makeSingleQuoteToken()
    }
    static var `multilineStringQuote`: TokenSyntax{
        SyntaxFactory.makeMultilineStringQuoteToken()
    }
    static var `poundKeyPath`: TokenSyntax{
        SyntaxFactory.makePoundKeyPathKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundLine`: TokenSyntax{
        SyntaxFactory.makePoundLineKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundSelector`: TokenSyntax{
        SyntaxFactory.makePoundSelectorKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundFile`: TokenSyntax{
        SyntaxFactory.makePoundFileKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundFileID`: TokenSyntax{
        SyntaxFactory.makePoundFileIDKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundFilePath`: TokenSyntax{
        SyntaxFactory.makePoundFilePathKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundColumn`: TokenSyntax{
        SyntaxFactory.makePoundColumnKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundFunction`: TokenSyntax{
        SyntaxFactory.makePoundFunctionKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundDsohandle`: TokenSyntax{
        SyntaxFactory.makePoundDsohandleKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundAssert`: TokenSyntax{
        SyntaxFactory.makePoundAssertKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundSourceLocation`: TokenSyntax{
        SyntaxFactory.makePoundSourceLocationKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundWarning`: TokenSyntax{
        SyntaxFactory.makePoundWarningKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundError`: TokenSyntax{
        SyntaxFactory.makePoundErrorKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundIf`: TokenSyntax{
        SyntaxFactory.makePoundIfKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundElse`: TokenSyntax{
        SyntaxFactory.makePoundElseKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundElseif`: TokenSyntax{
        SyntaxFactory.makePoundElseifKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundEndif`: TokenSyntax{
        SyntaxFactory.makePoundEndifKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundAvailable`: TokenSyntax{
        SyntaxFactory.makePoundAvailableKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundUnavailable`: TokenSyntax{
        SyntaxFactory.makePoundUnavailableKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundFileLiteral`: TokenSyntax{
        SyntaxFactory.makePoundFileLiteralKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundImageLiteral`: TokenSyntax{
        SyntaxFactory.makePoundImageLiteralKeyword().withTrailingTrivia(.spaces(1))
    }
    static var `poundColorLiteral`: TokenSyntax{
        SyntaxFactory.makePoundColorLiteralKeyword().withTrailingTrivia(.spaces(1))
    }
    static func `integerLiteral`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeIntegerLiteral(text)
    }
    static func `floatingLiteral`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeFloatingLiteral(text)
    }
    static func `stringLiteral`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeStringLiteral(text)
    }
    static func `regexLiteral`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeRegexLiteral(text)
    }
    static func `unknown`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeUnknown(text)
    }
    static func `identifier`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeIdentifier(text)
    }
    static func `unspacedBinaryOperator`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeUnspacedBinaryOperator(text)
    }
    static func `spacedBinaryOperator`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeSpacedBinaryOperator(text).withLeadingTrivia(.spaces(1)).withTrailingTrivia(.spaces(1))
    }
    static func `postfixOperator`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makePostfixOperator(text)
    }
    static func `prefixOperator`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makePrefixOperator(text)
    }
    static func `dollarIdentifier`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeDollarIdentifier(text)
    }
    static func `contextualKeyword`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeContextualKeyword(text)
    }
    static func `rawStringDelimiter`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeRawStringDelimiter(text)
    }
    static func `stringSegment`(_ text: String)-> TokenSyntax{
        SyntaxFactory.makeStringSegment(text)
    }
    static var `stringInterpolationAnchor`: TokenSyntax{
        SyntaxFactory.makeStringInterpolationAnchorToken()
    }
    static var `yield`: TokenSyntax{
        SyntaxFactory.makeYieldToken()
    }
    static var `eof`: TokenSyntax{
        SyntaxFactory.makeToken(.eof, presence: .present)
    }
}
