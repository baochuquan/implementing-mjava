		; ModuleID = './source/Geom/Geom.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
@.str2 = internal constant [34 x i8]  c"circumference of radius(%d) = %f
\00"
@.str0 = internal constant [27 x i8]  c"Enter a positive integer: \00"
@.str1 = internal constant [3 x i8]  c"%d\00"

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; method_header
define void @main() {
entry:
		; M3
	%n = alloca i32
	%f = alloca i32
	%circ = alloca double
		; unary_minus_expression
	%tmp0 = sub i32 0, 1
		; assignment
	store i32 %tmp0, i32* %n
	br label %label_4
label_4:	; l_Begin
		; relational_LT_expression
	%tmp1 = load i32* %n
	%tmp2 = icmp slt i32 %tmp1, 0
	br i1 %tmp2, label %label_5, label %label_6
label_5:	; l_True
		; method_invocation
	%tmp3 = call i32 (i8*, ...)* @printf(i8* getelementptr ([27 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp4 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
	br label %label_4
label_6:	; l_False
		; multiplicative_MULT_expression
	%tmp5 = load i32* %n
	%tmp7 = sitofp i32 %tmp5 to double
	%tmp6 = mul double 3.1415925, %tmp7
		; multiplicative_MULT_expression
	%tmp9 = sitofp i32 2 to double
	%tmp8 = mul double %tmp6, %tmp9
		; assignment
	store double %tmp8, double* %circ
		; method_invocation
	%tmp10 = load i32* %n
	%tmp11 = load double* %circ
	%tmp12 = call i32 (i8*, ...)* @printf(i8* getelementptr ([34 x i8]* @.str2, i32 0, i32 0) , i32 %tmp10, double %tmp11)
		; method_declaration_end
	br label %return
return:
	ret void
}


