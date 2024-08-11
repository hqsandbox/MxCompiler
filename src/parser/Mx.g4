grammar Mx;

program
    : definition* EOF?
    ;

definition
    : classTypeDef
    | functionDef
    | variableDef ';'
    ;

classTypeDef
    : Class Identifier '{' ( variableDef ';' | functionDef )* constructor?
      ( variableDef ';' | functionDef )* '}' ';'
    ;

functionDef
    : typeName Identifier '(' ( typeName Identifier ( ',' typeName Identifier )* )? ')' suite
    ;

variableDef
    : typeName initVariable ( ',' initVariable )*
    ;

constructor
    : Identifier '(' ( typeName Identifier ( ',' typeName Identifier )* )? ')' suite
    ;

typeAtom
    : Void
    | Bool
    | Int
    | String
    | Identifier
    ;

typeName
    : typeAtom (dim)+
    | Void
    | Bool
    | Int
    | String
    | Identifier
    ;

initVariable
    : Identifier ( '=' expr )?
    ;

//函数体
suite
    : '{' ( statement )* '}'
    ;

//函数体里面每行的语句（含有分号）
statement
    : suite                                                   #suiteStmt
    | variableDef ';'                                         #variableDefStmt
    | expr ';'                                                #exprStmt
    | If '(' expr ')' statement ( Else statement )?           #ifStmt
    | For '(' (parallelExp | variableDef)? ';'
      condition=expr? ';' step=expr? ')' statement            #forStmt
    | While '(' expr ')' statement                            #whileStmt
    | Break ';'                                               #breakStmt
    | Continue ';'                                            #continueStmt
    | Return expr? ';'                                        #returnStmt
    | ';'                                                     #emptyStmt
    ;

//表达式，不含有分号
expr
    : New typeAtom (count+= '[' expr? ']')+ arrayConst?              #newArrayExpr
    | New typeAtom ('(' ')')?                                #newVarExpr
    |'(' expr ')'                                            #parenExpr
    | expr '.' Identifier                                    #memberExpr
    | expr '.' Identifier '(' parallelExp? ')'               #methodCallExpr
    | expr '[' expr ']'                                      #arrayExpr
    | Identifier '(' parallelExp? ')'                        #funcCallExpr
    | expr op=('++'|'--')                                    #postfixExpr
    | <assoc=right> op=('++'|'--') expr                      #prefixExpr
    | <assoc=right> op=('+'|'-'|'!'|'~') expr                #unaryExpr
    | expr op=('*'|'/'|'%') expr                             #binaryExpr
    | expr op=('+'|'-') expr                                 #binaryExpr
    | expr op=('<<'|'>>') expr                               #binaryExpr
    | expr op=('<='|'>='|'<'|'>') expr                       #binaryExpr
    | expr op=('=='|'!=') expr                               #binaryExpr
    | expr op='&' expr                                       #binaryExpr
    | expr op='^' expr                                       #binaryExpr
    | expr op='|' expr                                       #binaryExpr
    | expr op='&&' expr                                      #binaryExpr
    | expr op='||' expr                                      #binaryExpr
    | <assoc=right> expr '?' expr ':' expr                   #conditionalExpr
    | <assoc=right> expr '=' expr                            #assignExpr
    | primary                                                #primaryExpr
    ;

primary
    : Identifier
    | This
    | Null
    | True
    | False
    | IntLiteral
    | StringLiteral
    | fmtString
    ;

literal
    : IntLiteral
    | StringLiteral
    | True
    | False
    | arrayConst
    ;

parallelExp
    : expr ( ',' expr )*
    ;

arrayConst
    : '{' (literal ( ',' literal )*)? '}'
    ;

IntLiteral : [1-9][0-9]* | '0' ;

StringLiteral
    : '"' StringCharacter* '"'
    ;

fragment StringCharacter
    : '\\n'
    | '\\\\'
    | '\\"'
    | ~[\u0000-\u001F\u007F"\\]
    ;

//fragment FmtStringChar : '$$'| ~[$\n\\\r"] | '\\"' | '\\n'|'\\r' | '\\\\';
fragment FmtStringChar :  '\\"' | '\\n' | '\\\\' | '$$'| ~[$\\"];
FmtStringS: 'f"' (FmtStringChar)* '"';
FmtStringL: 'f"' (FmtStringChar)* '$';
FmtStringM: '$' (FmtStringChar)* '$';
FmtStringR: '$' (FmtStringChar)* '"';
fmtString
    : FmtStringS
//    | FmtStringL (expr)? (FmtStringM (expr)?)* FmtStringR
    | FmtStringL (expr) (FmtStringM (expr))* FmtStringR
    ;

dim : '[' ']';

Void : 'void';
Bool : 'bool';
Int : 'int';
String : 'string';
New : 'new';
Class : 'class';
Null : 'null';
True : 'true';
False : 'false';
This : 'this';
If : 'if';
Else : 'else';
For : 'for';
While : 'while';
Break : 'break';
Continue : 'continue';
Return : 'return';

Identifier : [a-zA-Z] [a-zA-Z0-9]* ;

WhiteSpace: [\t\r\n ]+ -> skip;
LineComment: '//' ~[\r\n]* -> skip;
BlockComment: '/*' .*? '*/' -> skip;