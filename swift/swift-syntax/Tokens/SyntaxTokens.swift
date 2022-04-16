import Foundation

func lowercase_first_word(_ name: String) -> String {
    var word_index = 0
    let threshold_index = 1
    for c in name {
        if c.isLowercase {
            if word_index > threshold_index {
                word_index -= 1
            }
            break
        }
        word_index += 1
    }
    if word_index == 0 {
        return name
    }
    let idx = name.index(name.startIndex, offsetBy: word_index)
    return name[..<idx].lowercased() + name[idx...]
}

class Token {
    public var name: String
    public var kind: String
    public var unprefixedKind: String
    public var serializationCode: Int
    public var text: String?
    public var isKeyword: Bool
    public var requiresLeadingSpace: Bool
    public var requiresTrailingSpace: Bool

    init(name: String, kind: String, text: String?=nil,
        serializationCode: Int, unprefixedKind: String? = nil, isKeyword: Bool = false,
        requiresLeadingSpace: Bool = false, requiresTrailingSpace: Bool = false){
        self.name = name
        self.kind = kind
        if unprefixedKind != nil {
            self.unprefixedKind = unprefixedKind!
        } else {
            self.unprefixedKind = kind
        }

        self.serializationCode = serializationCode
        self.text = text
        self.isKeyword = isKeyword
        self.requiresLeadingSpace = requiresLeadingSpace
        self.requiresTrailingSpace = requiresTrailingSpace
    }

    public func swift_kind() -> String {
        let name = lowercase_first_word(self.name)
        if self.isKeyword {
            return name + "Keyword"
        }
        return name
    }
}

class Keyword : Token {
    init(name: String, text: String, serializationCode: Int) {
            super.init(name: name, kind: "kw_" + text, text: text,
                        serializationCode: serializationCode,
                        unprefixedKind: text,
                        isKeyword: true, requiresTrailingSpace: true)
        }

    public func macro_name() -> String {
        return "KEYWORD"
    }
}

class SwiftKeyword: Keyword {
    public override func macro_name() -> String {
        return "SWIFT_KEYWORD"
    }
}


class DeclKeyword: SwiftKeyword {
    public override func macro_name() -> String {
        return "DECL_KEYWORD"
    }
}

class StmtKeyword: SwiftKeyword {
    public override func macro_name() -> String {
        return "STMT_KEYWORD"
    }
}

class ExprKeyword: SwiftKeyword {
    public override func macro_name() -> String {
        return "EXPR_KEYWORD"
    }
}

class PatternKeyword: SwiftKeyword {
    public override func macro_name() -> String {
        return "PAT_KEYWORD"
    }
}

class SilKeyword: Keyword {
    public override func macro_name() -> String {
        return "SIL_KEYWORD"
    }
}

class PoundKeyword: Token {
    init (name: String, kind: String, text: String, serializationCode: Int){
        super.init(name: name, kind: "pound_" + kind, text: text,
                   serializationCode: serializationCode,
                   unprefixedKind: kind,
                   isKeyword: true, requiresTrailingSpace: true)
    }

    public func macro_name() -> String {
        return "POUND_KEYWORD"
    }
}

class PoundObjectLiteral: PoundKeyword {
    private var description: String
    private var kwProtocol: String

    init(name: String, kind: String, text: String, serializationCode: Int,
         description: String, kwProtocol: String) {
        self.description = description
        self.kwProtocol = kwProtocol
        
        super.init(name: name, kind: kind, text: text,
                    serializationCode: serializationCode)
    }

    public override func macro_name() -> String {
        return "POUND_OBJECT_LITERAL"
    }
}

class PoundConfig: PoundKeyword {
    public override func macro_name() -> String {
        return "POUND_CONFIG"
    }

}

class PoundDirectiveKeyword: PoundKeyword {
    override init(name: String, kind: String, text: String, serializationCode: Int) {
        super.init(name: name, kind: kind, text: text, serializationCode: serializationCode)
    }

    public override func  macro_name() -> String{
        return "POUND_DIRECTIVE_KEYWORD"
    }

}

class PoundConditionalDirectiveKeyword: PoundDirectiveKeyword {
    override init(name: String, kind: String, text: String, serializationCode: Int) {
        super.init(name: name, kind: kind, text: text, serializationCode: serializationCode)

    }

    public override func macro_name() -> String{
        return "POUND_COND_DIRECTIVE_KEYWORD"
    }

}

class Punctuator: Token {
    public func macro_name() -> String {
        return "PUNCTUATOR"
    }
}

class Literal: Token {
    public func macro_name() -> String {
        return "LITERAL"
    }
}

class Misc: Token {
    public func macro_name() -> String {
        return "MISC"
    }
}


let SYNTAX_TOKENS: [Token] = [
    // Keywords that start decls
    DeclKeyword(name: "Associatedtype", text: "associatedtype", serializationCode: 1),
    DeclKeyword(name: "Class", text: "class", serializationCode: 2),
    DeclKeyword(name: "Deinit", text: "deinit", serializationCode: 3),
    DeclKeyword(name: "Enum", text: "enum", serializationCode: 4),
    DeclKeyword(name: "Extension", text: "extension", serializationCode: 5),
    DeclKeyword(name: "Func", text: "func", serializationCode: 6),
    DeclKeyword(name: "Import", text: "import", serializationCode: 7),
    DeclKeyword(name: "Init", text: "init", serializationCode: 8),
    DeclKeyword(name: "Inout", text: "inout", serializationCode: 9),
    DeclKeyword(name: "Let", text: "let", serializationCode: 10),
    DeclKeyword(name: "Operator", text: "operator", serializationCode: 11),
    DeclKeyword(name: "Precedencegroup", text: "precedencegroup", serializationCode: 12),
    DeclKeyword(name: "Protocol", text: "protocol", serializationCode: 13),
    DeclKeyword(name: "Struct", text: "struct", serializationCode: 14),
    DeclKeyword(name: "Subscript", text: "subscript", serializationCode: 15),
    DeclKeyword(name: "Typealias", text: "typealias", serializationCode: 16),
    DeclKeyword(name: "Var", text: "var", serializationCode: 17),

    DeclKeyword(name: "Fileprivate", text: "fileprivate", serializationCode: 18),
    DeclKeyword(name: "Internal", text: "internal", serializationCode: 19),
    DeclKeyword(name: "Private", text: "private", serializationCode: 20),
    DeclKeyword(name: "Public", text: "public", serializationCode: 21),
    DeclKeyword(name: "Static", text: "static", serializationCode: 22),

    // Statement keywords
    StmtKeyword(name: "Defer", text: "defer", serializationCode: 23),
    StmtKeyword(name: "If", text: "if", serializationCode: 24),
    StmtKeyword(name: "Guard", text: "guard", serializationCode: 25),
    StmtKeyword(name: "Do", text: "do", serializationCode: 26),
    StmtKeyword(name: "Repeat", text: "repeat", serializationCode: 27),
    StmtKeyword(name: "Else", text: "else", serializationCode: 28),
    StmtKeyword(name: "For", text: "for", serializationCode: 29),
    StmtKeyword(name: "In", text: "in", serializationCode: 30),
    StmtKeyword(name: "While", text: "while", serializationCode: 31),
    StmtKeyword(name: "Return", text: "return", serializationCode: 32),
    StmtKeyword(name: "Break", text: "break", serializationCode: 33),
    StmtKeyword(name: "Continue", text: "continue", serializationCode: 34),
    StmtKeyword(name: "Fallthrough", text: "fallthrough", serializationCode: 35),
    StmtKeyword(name: "Switch", text: "switch", serializationCode: 36),
    StmtKeyword(name: "Case", text: "case", serializationCode: 37),
    StmtKeyword(name: "Default", text: "default", serializationCode: 38),
    StmtKeyword(name: "Where", text: "where", serializationCode: 39),
    StmtKeyword(name: "Catch", text: "catch", serializationCode: 40),
    StmtKeyword(name: "Throw", text: "throw", serializationCode: 50),

    // Expression keywords
    ExprKeyword(name: "As", text: "as", serializationCode: 41),
    ExprKeyword(name: "Any", text: "Any", serializationCode: 42),
    ExprKeyword(name: "False", text: "false", serializationCode: 43),
    ExprKeyword(name: "Is", text: "is", serializationCode: 44),
    ExprKeyword(name: "Nil", text: "nil", serializationCode: 45),
    ExprKeyword(name: "Rethrows", text: "rethrows", serializationCode: 46),
    ExprKeyword(name: "Super", text: "super", serializationCode: 47),
    ExprKeyword(name: "Self", text: "self", serializationCode: 48),
    ExprKeyword(name: "CapitalSelf", text: "Self", serializationCode: 49),
    ExprKeyword(name: "True", text: "true", serializationCode: 51),
    ExprKeyword(name: "Try", text: "try", serializationCode: 52),
    ExprKeyword(name: "Throws", text: "throws", serializationCode: 53),

    Keyword(name: "__FILE__", text: "__FILE__", serializationCode: 54),
    Keyword(name: "__LINE__", text: "__LINE__", serializationCode: 55),
    Keyword(name: "__COLUMN__", text: "__COLUMN__", serializationCode: 56),
    Keyword(name: "__FUNCTION__", text: "__FUNCTION__", serializationCode: 57),
    Keyword(name: "__DSO_HANDLE__", text: "__DSO_HANDLE__", serializationCode: 58),

    // Pattern keywords
    PatternKeyword(name: "Wildcard", text: "_", serializationCode: 59),

    // Punctuators
    Punctuator(name: "LeftParen", kind: "l_paren", text: "(", serializationCode: 88),
    Punctuator(name: "RightParen", kind: "r_paren", text: ")", serializationCode: 89),
    Punctuator(name: "LeftBrace", kind: "l_brace", text: "{", serializationCode: 90),
    Punctuator(name: "RightBrace", kind: "r_brace", text: "}", serializationCode: 91),
    Punctuator(name: "LeftSquareBracket", kind: "l_square", text: "[",
               serializationCode: 92),
    Punctuator(name: "RightSquareBracket", kind: "r_square", text: "]",
               serializationCode: 93),
    Punctuator(name: "LeftAngle", kind: "l_angle", text: "<", serializationCode: 94,
               requiresLeadingSpace:  true, requiresTrailingSpace: true),
    Punctuator(name: "RightAngle", kind: "r_angle", text: ">", serializationCode: 95,
                requiresLeadingSpace:  true, requiresTrailingSpace: true),

    Punctuator(name: "Period", kind: "period", text: ".", serializationCode: 85),
    Punctuator(name: "PrefixPeriod", kind: "period_prefix", text: ".",
               serializationCode: 87),
    Punctuator(name: "Comma", kind: "comma", text: ",", serializationCode: 84,
                requiresTrailingSpace:  true),
    Punctuator(name: "Ellipsis", kind: "ellipsis", text: "...", serializationCode: 118),
    Punctuator(name: "Colon", kind: "colon", text: ":", serializationCode: 82,
                requiresTrailingSpace:  true),
    Punctuator(name: "Semicolon", kind: "semi", text: ";", serializationCode: 83),
    Punctuator(name: "Equal", kind: "equal", text: "=", serializationCode: 86,
                requiresLeadingSpace:  true, requiresTrailingSpace:  true),
    Punctuator(name: "AtSign", kind: "at_sign", text: "@", serializationCode: 80),
    Punctuator(name: "Pound", kind: "pound", text: "#", serializationCode: 81),

    Punctuator(name: "PrefixAmpersand", kind: "amp_prefix", text: "&", serializationCode: 96,
               requiresLeadingSpace:  true, requiresTrailingSpace:  true),
    Punctuator(name: "Arrow", kind: "arrow", text: "->", serializationCode: 78,
                requiresTrailingSpace:  true),


    Punctuator(name: "Backtick", kind: "backtick", text: "`", serializationCode: 79),

    Punctuator(name: "Backslash", kind: "backslash", text: "\\\\", serializationCode: 100),

    Punctuator(name: "ExclamationMark", kind: "exclaim_postfix", text: "!",
               serializationCode: 99),

    Punctuator(name: "PostfixQuestionMark", kind: "question_postfix", text: "?",
               serializationCode: 97),
    Punctuator(name: "InfixQuestionMark", kind: "question_infix", text: "?",
               serializationCode: 98),

    Punctuator(name: "StringQuote", kind: "string_quote", text: "\\\"", serializationCode: 102),
    Punctuator(name: "SingleQuote", kind: "single_quote", text: "\\\"", serializationCode: 120),
    Punctuator(name: "MultilineStringQuote", kind: "multiline_string_quote",
               text: "\\\"\\\"\\\"", serializationCode: 103),

    // Keywords prefixed with a "#".

    PoundKeyword(name: "PoundKeyPath", kind: "keyPath", text: "#keyPath",
                 serializationCode: 74),
    PoundKeyword(name: "PoundLine", kind: "line", text: "#line",
                 serializationCode: 69),
    PoundKeyword(name: "PoundSelector", kind: "selector", text: "#selector",
                 serializationCode: 73),
    PoundKeyword(name: "PoundFile", kind: "file", text: "#file",
                 serializationCode: 68),
    PoundKeyword(name: "PoundFileID", kind: "fileID", text: "#fileID",
                 serializationCode: 122),
    PoundKeyword(name: "PoundFilePath", kind: "filePath", text: "#filePath",
                 serializationCode: 121),
    PoundKeyword(name: "PoundColumn", kind: "column", text: "#column",
                 serializationCode: 70),
    PoundKeyword(name: "PoundFunction", kind: "function", text: "#function",
                 serializationCode: 72),
    PoundKeyword(name: "PoundDsohandle", kind: "dsohandle", text: "#dsohandle",
                 serializationCode: 71),
    PoundKeyword(name: "PoundAssert", kind: "assert", text: "#assert",
                 serializationCode: 117),

    PoundDirectiveKeyword(name: "PoundSourceLocation", kind: "sourceLocation",
                          text: "#sourceLocation", serializationCode: 65),
    PoundDirectiveKeyword(name: "PoundWarning", kind: "warning", text: "#warning",
                          serializationCode: 66),
    PoundDirectiveKeyword(name: "PoundError", kind: "error", text: "#error",
                          serializationCode: 67),

    PoundConditionalDirectiveKeyword(name: "PoundIf", kind: "if", text: "#if",
                                     serializationCode: 64),
    PoundConditionalDirectiveKeyword(name: "PoundElse", kind: "else", text: "#else",
                                     serializationCode: 62),
    PoundConditionalDirectiveKeyword(name: "PoundElseif", kind: "elseif",
                                     text: "#elseif", serializationCode: 63),
    PoundConditionalDirectiveKeyword(name: "PoundEndif", kind: "endif",
                                     text: "#endif", serializationCode: 61),

    PoundConfig(name: "PoundAvailable", kind: "available", text: "#available",
                serializationCode: 60),
    PoundConfig(name: "PoundUnavailable", kind: "unavailable", text: "#unavailable",
                serializationCode: 123),

    PoundObjectLiteral(name: "PoundFileLiteral", kind: "fileLiteral",
                       text: "#fileLiteral", serializationCode: 76,
                       description: "file reference",
                       kwProtocol: "ExpressibleByFileReferenceLiteral"),
    PoundObjectLiteral(name: "PoundImageLiteral", kind: "imageLiteral",
                       text: "#imageLiteral", serializationCode: 77,
                       description: "image",
                       kwProtocol: "ExpressibleByImageLiteral"),
    PoundObjectLiteral(name: "PoundColorLiteral", kind: "colorLiteral",
                       text: "#colorLiteral", serializationCode: 75,
                       description: "color",
                       kwProtocol: "ExpressibleByColorLiteral"),

    Literal(name: "IntegerLiteral", kind: "integer_literal",serializationCode: 111),
    Literal(name: "FloatingLiteral", kind: "floating_literal", serializationCode: 112),
    Literal(name: "StringLiteral", kind: "string_literal",serializationCode: 113),
    Literal(name: "RegexLiteral", kind: "regex_literal", serializationCode: 124),

    Misc(name: "Unknown", kind: "unknown", serializationCode: 115),
    Misc(name: "Identifier", kind: "identifier", serializationCode: 105),
    Misc(name: "UnspacedBinaryOperator", kind: "oper_binary_unspaced",
         serializationCode: 107),
    Misc(name: "SpacedBinaryOperator", kind: "oper_binary_spaced", serializationCode: 108,
         requiresLeadingSpace: true, requiresTrailingSpace: true),
    Misc(name: "PostfixOperator", kind: "oper_postfix", serializationCode: 110),
    Misc(name: "PrefixOperator", kind: "oper_prefix", serializationCode: 109),
    Misc(name: "DollarIdentifier", kind: "dollarident", serializationCode: 106),

    Misc(name: "ContextualKeyword", kind: "contextual_keyword", serializationCode: 114),
    Misc(name: "RawStringDelimiter", kind: "raw_string_delimiter", serializationCode: 119),
    Misc(name: "StringSegment", kind: "string_segment", serializationCode: 104),
    Misc(name: "StringInterpolationAnchor", kind: "string_interpolation_anchor", text: ")",
         serializationCode: 101),
    Misc(name: "Yield", kind: "kw_yield", text: "yield",serializationCode: 116), 

]