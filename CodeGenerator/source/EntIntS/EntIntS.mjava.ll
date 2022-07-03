		; ModuleID = './source/EntIntS/EntIntS.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
@.str2 = internal constant [17 x i8]  c"You entered: %d
\00"
@.str1 = internal constant [3 x i8]  c"%d\00"
@.str0 = internal constant [19 x i8]  c"Enter an integer: \00"

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; method_header
define void @main() {
entry:
		; M3
	%n = alloca i32
	%s = alloca i8*
		; assignment
	store i8* getelementptr ([19 x i8]* @.str0, i32 0, i32 0) , i8** %s
		; method_invocation
	%tmp0 = load i8** %s
	%tmp1 = call i32 (i8*, ...)* @printf(i8* %tmp0)
		; assignment
	store i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i8** %s
		; method_invocation
	%tmp2 = load i8** %s
	%tmp3 = call i32 (i8*, ...)* @scanf(i8* %tmp2, i32* %n)
		; assignment
	store i8* getelementptr ([17 x i8]* @.str2, i32 0, i32 0) , i8** %s
		; method_invocation
	%tmp4 = load i8** %s
	%tmp5 = load i32* %n
	%tmp6 = call i32 (i8*, ...)* @printf(i8* %tmp4, i32 %tmp5)
		; method_declaration_end
	br label %return
return:
	ret void
}


