		; ModuleID = './source/EntInt/EntInt.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.String = type {  }
%struct.EntInt = type {  }
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
		; method_invocation
	%tmp0 = call i32 (i8*, ...)* @printf(i8* getelementptr ([19 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp1 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
		; method_invocation
	%tmp2 = load i32* %n
	%tmp3 = call i32 (i8*, ...)* @printf(i8* getelementptr ([17 x i8]* @.str2, i32 0, i32 0) , i32 %tmp2)
		; method_declaration
	br label %return
return:
	ret void
}


