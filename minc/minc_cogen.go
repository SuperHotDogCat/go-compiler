package main
import "fmt"
import "math"

var label int64 = 0
var relative_rsp_address int64 = 0; // To indicate the store address.

var seen_variable_to_offset = map[string]int64{"_": 0}
var argument_indices = []string{"%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9"}

func ast_to_asm_program(program * Program) string {
	asm := ""
	prev_func_name := ""
	for i, def := range program.defs {
		if definition, ok := def.(*DefFun); ok {
			local_label := label
			if (i == 0){
				asm += fmt.Sprintf("	.text\n")
				asm += fmt.Sprintf("	.globl	%s\n", definition.name)
				asm += fmt.Sprintf("	.type	%s, @function\n", definition.name)
			} else {
				asm += fmt.Sprintf(".LFE%d:\n", local_label-1)
				asm += fmt.Sprintf("	.size %s, .-%s\n", prev_func_name, prev_func_name)
				asm += fmt.Sprintf("	.globl	%s\n", definition.name)
				asm += fmt.Sprintf("	.type	%s, @function\n", definition.name)
			}
			definition_to_asm(definition, &asm)
			seen_variable_to_offset = map[string]int64{"_": 0}
			prev_func_name = definition.name
		}
	}
	//"this is an assembly code generated by minc compiler ...\n"
	// panic("YOU MUST IMPLEMENT go/minc/minc_cogen.go:ast_to_asm_program")
    // 再帰で書くのは明らか, ということはasm += ast_to_asm_program(program)のような形が頻発するはず。
    // astの左辺compile, astの右辺コンパイルという順にやって行った方がよさそう。
	// ここの出力がassemblyとして書き込まれる。
	return asm
}

func definition_to_asm(definition *DefFun, asm *string){
	*asm += gen_function_prologue(definition) // grow stack
	asm_body := gen_function_body(definition) // glow body
	asm_epilogue := gen_function_epilogue() // glow epilogue
	// *asm += fmt.Sprintf("	subq $%d, %%rsp\n", 8*(len(seen_variable_to_offset))) // grow stack pointer
	*asm += asm_body
	// *asm += fmt.Sprintf("	addq $%d, %rsp\n", 8*len(seen_variable_to_offset) - 1)
	*asm += asm_epilogue
}

func gen_function_prologue(definition *DefFun) string {
	local_label := label
	asm := ""
	asm += fmt.Sprintf("%s:\n", definition.name)
	asm += fmt.Sprintf(".LFB%d:\n", local_label)
	label += 1
	// asm += "	.cfi_startproc\n"
	asm += "	endbr64\n"
	asm += "	pushq	%rbp\n" // %rbpが関数の開始アドレスを指すようになる
	// asm += "	.cfi_def_cfa_offset 16\n"
	// asm += "	.cfi_offset 6, -16\n"
	asm += "	movq	%rsp, %rbp\n" // %rspがスタックの先頭を指すようになる
	// asm += "	.cfi_def_cfa_register 6\n"
	return asm
}

func gen_function_body(definition *DefFun) string {
	// definition = type_expr identifier "(" parameter_list ")" compound_stmt 
	// 関数の定義はこんな感じの文法です
	asm := ""
	params := definition.params
	// paramsに関する処理を行う -> 全てstackに退避
	for i, param := range params {
		max_offset := get_max_offset(seen_variable_to_offset)
		offset := max_offset + 8
		seen_variable_to_offset[param.name] = offset
		if (i < len(argument_indices)){
			asm += fmt.Sprintf("	subq $8, %%rsp\n")
			asm += fmt.Sprintf("	movq %s, -%d(%%rbp)\n", argument_indices[i], offset)
		} else {
			asm += fmt.Sprintf("	subq $8, %%rsp\n")
			asm += fmt.Sprintf("	movq %d(%%rbp), %%rax\n", 8*(i-5+1))
			asm += fmt.Sprintf("	movq %%rax, -%d(%%rbp)\n",offset)
		}
	}
	// return_type := definition.return_type
	stmt := definition.body
	asm += gen_stmt(stmt, relative_rsp_address)
	// fmt.Println(params)
	// fmt.Println(return_type)
	return asm
}

func gen_function_epilogue() string {
	asm := "	movq %rbp, %rsp\n" // ここ要らない説がある
	asm += "	popq	%rbp\n" // %rbpは関数の開始アドレスなので元に戻る
	// asm += "	.cfi_def_cfa 7, 8\n"
	asm += "	ret\n"
	// asm += "	.cfi_endproc\n"
	return asm
}

func gen_stmt(stmt Stmt, free_address int64) string {
	// pattern matching
	asm := ""
	switch stmt := stmt.(type){
		case *StmtEmpty:
			return ""
		case *StmtContinue:
			return ""
		case *StmtBreak:
			return ""
		case *StmtReturn:
			asm += gen_expr(stmt.expr, free_address, true)
			asm += "	popq %rax\n" // returnのため...? // 早期returnを含むcompilerならここにretをいれなくてはいけない。
			asm += gen_function_epilogue()
			return asm
		case *StmtExpr:
			asm += gen_expr(stmt.expr, free_address, false)
			return asm
		case *StmtCompound:
			for _, decl := range stmt.decls {
				asm += gen_decls(decl, free_address)
			}
			for _, s := range stmt.stmts {
				asm += gen_stmt(s, free_address)
			}
			// 0個以上のDeclとStmtに関して処理を行う
			return asm
		case *StmtIf:
			local_label := label
			label += 1
			asm += gen_expr(stmt.cond, free_address, false)
			asm += "	popq %rax\n"
			asm += "	cmpq $0, %rax\n"
			asm += fmt.Sprintf("	je  .Lelse%d\n", local_label)
			asm += gen_stmt(stmt.then_stmt, free_address)
			asm += fmt.Sprintf("	jmp  .Lend%d\n", local_label)
			asm += fmt.Sprintf(".Lelse%d:\n", local_label)
			asm += gen_stmt(stmt.else_stmt, free_address)
			asm += fmt.Sprintf(".Lend%d:\n", local_label)
			return asm
		case *StmtWhile:
			local_label := label
			label += 1
			asm += fmt.Sprintf(".Lbegin%d:\n", local_label)
			asm += gen_expr(stmt.cond, free_address, false)
			asm += "	popq %rax\n"
			asm += "	cmpq $0, %rax\n"
			asm += fmt.Sprintf("	je .Lend%d\n", local_label)
			asm += gen_stmt(stmt.body, free_address)
			asm += fmt.Sprintf("	jmp .Lbegin%d\n", local_label)
			asm += fmt.Sprintf(".Lend%d:\n", local_label)
			return asm
		default:
			return ""
	}
}

func gen_expr(expr Expr, free_address int64, is_return bool) string {
	asm := ""
	switch expr := expr.(type){
		case *ExprIntLiteral:
			asm += fmt.Sprintf("	pushq $%d\n", expr.val) // ここを$マークつけないと不正として判断されます
			return asm
		case *ExprId:
			offset, ok := seen_variable_to_offset[expr.name]
			if !ok {
				max_offset := get_max_offset(seen_variable_to_offset)
				offset = max_offset + 8
				seen_variable_to_offset[expr.name] = offset
			}
			// write a variable address in %rax
			asm += gen_lval(offset)
			// finished to write a variable
			// read from a variable
			asm += gen_read_lval()
			/*asm += fmt.Sprintf("	movq -%d(%%rbp), %%rax\n", offset)
			asm += "	pushq %rax\n"*/
			return asm
		case *ExprOp:
			switch expr.op {
				case "+":
					// expr.argsが1か2で場合わけすれば良い
					if (len(expr.args) == 1){
						// unary op
						asm += "	pushq $0\n"
						asm += gen_expr(expr.args[0], free_address, is_return)
					} else if (len(expr.args) == 2){
						// binary op
						asm += gen_expr(expr.args[0], free_address, is_return)
						asm += gen_expr(expr.args[1], free_address, is_return)
					}
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	addq %rdi, %rax\n"
					asm += "	pushq %rax\n" // 計算結果を格納, adhocに追加したのでもしかしたらダメかな
					return asm
				case "-":
					// expr.argsが1か2で場合わけすれば良い
					if (len(expr.args) == 1){
						// unary op
						asm += "	pushq $0\n"
						asm += gen_expr(expr.args[0], free_address, is_return)
					} else if (len(expr.args) == 2){
						// binary op
						asm += gen_expr(expr.args[0], free_address, is_return)
						asm += gen_expr(expr.args[1], free_address, is_return)
					}
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	subq %rdi, %rax\n"
					asm += "	pushq %rax\n" // 計算結果を格納, adhocに追加したのでもしかしたらダメかな
					return asm
				case "*":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	imulq %rdi, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "/":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cqo\n"
					asm += "	idivq %rdi\n"
					asm += "	pushq %rax\n"
					return asm
				case "%":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cqo\n"
					asm += "	idivq %rdi\n"
					asm += "	movq %rdx, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "!":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += "	popq %rax\n"
					asm += "	testq %rax, %rax\n"
					asm += "	sete	%al\n"
					asm += "	movzx	%al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "==":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cmpq %rdi, %rax\n"
					asm += "	sete %al\n"
					asm += "	movzb %al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "!=":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cmpq %rdi, %rax\n"
					asm += "	setne %al\n"
					asm += "	movzb %al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "<":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cmpq %rdi, %rax\n"
					asm += "	setl %al\n"
					asm += "	movzb %al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "<=":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cmpq %rdi, %rax\n"
					asm += "	setle %al\n"
					asm += "	movzb %al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case ">":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cmpq %rax, %rdi\n" // 上とは逆に
					asm += "	setl %al\n"
					asm += "	movzb %al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case ">=":
					asm += gen_expr(expr.args[0], free_address, is_return)
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	cmpq %rax, %rdi\n" // 上とは逆に
					asm += "	setle %al\n"
					asm += "	movzb %al, %rax\n"
					asm += "	pushq %rax\n"
					return asm
				case "=":
					asm += gen_expr(expr.args[0], free_address, is_return)
					read_string := gen_read_lval()
					asm = asm[:len(asm)-len(read_string)] // assignの場合readはしないのでreadの文字列分削除する
					asm += gen_expr(expr.args[1], free_address, is_return)
					asm += "	popq %rdi\n"
					asm += "	popq %rax\n"
					asm += "	movq %rdi, (%rax)\n"
					if (is_return == true){
						asm += "	pushq %rdi\n" // これを消すとf42.cが通り, これを残すとf42.cが通らなくなるがf38.cが通る
					}
					// asm += "	push %rax\n"
					return asm
				default:
					return ""
			}
		case *ExprCall:
			// 引数を逆順でスタックにプッシュ（レジスタとスタックを分ける必要あり）
			for i := len(expr.args) - 1; i >= 0; i-- {
				arg := expr.args[i]
				asm += gen_expr(arg, free_address, is_return)
				asm += "	popq %rax\n"
				if i >= len(argument_indices) {
					// スタックに引数を保存（7つ目以降）
					asm += "	pushq %rax\n" // 現在のstackより下に貯めておけばアクセス可能になる
				} else {
					// レジスタに引数を保存
					asm += fmt.Sprintf("	movq %%rax, %s\n", argument_indices[i])
				}
			}
			// 関数呼び出し
			asm += fmt.Sprintf("	call %s\n", expr.fun.ast_to_str_expr()) // callを追加すると起こる
			// 返り値をスタックにプッシュ
			if len(expr.args) > len(argument_indices) {
				// argument_indicesを超えている分だけstackに蓄えられているのでここで余分なものは消しておく
				asm += fmt.Sprintf("	addq $%d, %%rsp\n", 8*(len(expr.args) - len(argument_indices)))
			}
			asm += "	pushq %rax\n"

			return asm
		case *ExprParen:
			return ""
		default:
			return ""
	}
}

func gen_decls(decl *Decl, free_address int64) string {
	// 変数定義場所, TypeExprは変更しない
	asm := ""
	offset, ok := seen_variable_to_offset[decl.name]
	if !ok {
		max_offset := get_max_offset(seen_variable_to_offset)
		offset = max_offset + 8
		seen_variable_to_offset[decl.name] = offset
		asm += "	subq $8, %rsp\n" // 変数宣言用の領域確保
		asm += fmt.Sprintf("	movq $0, -%d(%%rbp)\n",offset)
	}
	return asm
}
/*
type Program struct {
	defs []Def
}
*/

// used by case *ExprId:
func get_max_offset(offsets map[string]int64) int64 {
    var max_offset int64 = math.MinInt64 // 最小の64ビット整数で初期化
    for _, offset := range offsets {
        if offset > max_offset {
            max_offset = offset
        }
    }
    return max_offset
}

func gen_lval(offset int64)string{
	asm := ""
	asm += "	movq %rbp, %rax\n"
	asm += fmt.Sprintf("	subq $%d, %%rax\n", offset)
	asm += "	pushq %rax\n"
	return asm
}

func gen_read_lval()string{
	asm := ""
	asm += "	popq %rax\n"
	asm += "	movq (%rax), %rax\n"
	asm += "	pushq %rax\n"
	return asm
}