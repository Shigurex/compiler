(* File lexer.mll *)
{
 open Parser  
 exception No_such_symbol
}

let digit = ['0'-'9']
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule lexer = parse
| digit+ as num  { NUM (int_of_string num) }
| "if"                    { IF }
| "else"                  { ELSE }
| "while"                 { WHILE }
| "for"                   { FOR }
| ".."                    { TO }
| "do"                    { DO }
| "scan"                  { SCAN }
| "sprint"                { SPRINT }
| "iprint"                { IPRINT }
| "int"                   { INT }
| "return"                { RETURN }
| "type"                  { TYPE }
| "void"                  { VOID }
| id as text              { ID text }
| '\"'[^'\"']*'\"' as str { STR str }
| '='                     { ASSIGN }
| "+="                    { PEQ }
| "-="                    { MEQ }
| "=="                    { EQ }
| "!="                    { NEQ }
| '>'                     { GT }
| '<'                     { LT }
| ">="                    { GE }
| "<="                    { LE }
| '+'                     { PLUS }
| '-'                     { MINUS }
| '*'                     { TIMES }
| '/'                     { DIV }
| '%'                     { MOD }
| '^'                     { POWER }
| "++"                    { INC }
| "--"                    { DEC }
| '{'                     { LB  }
| '}'                     { RB  }
| '['                     { LS }
| ']'                     { RS }
| '('                     { LP  }
| ')'                     { RP  }
| ','                     { COMMA }
| ';'                     { SEMI }
| "//"                    { comment lexbuf }
| [' ' '\t' '\n']         { lexer lexbuf }(* eat up whitespace *) 
| eof                     { raise End_of_file }
| _                       { raise No_such_symbol }
and comment = parse
| '\n'                    { lexer lexbuf }
| eof                     { raise End_of_file }
| _                       { comment lexbuf }