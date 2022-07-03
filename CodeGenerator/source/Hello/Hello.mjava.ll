		; ModuleID = './source/Hello/Hello.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
@.str0 = internal constant [13 x i8]  c"Hello world
\00"

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; method_header
define void @main() {
entry:
		; method_invocation
	%tmp0 = call i32 (i8*, ...)* @printf(i8* getelementptr ([13 x i8]* @.str0, i32 0, i32 0) )
		; method_declaration_end
	br label %return
return:
	ret void
}


