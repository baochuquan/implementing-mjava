		; ModuleID = './source/Fact/Fact.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.String = type {  }
@.str2 = internal constant [19 x i8]  c"factorial(%d)= %d
\00"
%struct.EntInt = type {  }
@.str1 = internal constant [3 x i8]  c"%d\00"
@.str0 = internal constant [51 x i8]  c"Enter an integer greater than 0 and less than 17: \00"

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; method_header
define i32 @EntInt_fact(%struct.EntInt* %this, i32 %n) {
entry:
	%n_addr = alloca i32
	store i32 %n, i32* %n_addr
	%retval = alloca i32
	%tmp = alloca i32
		; relational_GT_expression
	%tmp0 = load i32* %n_addr
	%tmp1 = icmp sgt i32 %tmp0, 2
	br i1 %tmp1, label %label_1, label %label_2
		; conditional_expression
	br i1 %tmp1, label %label_1, label %label_2
label_1: 	; l_True
		; additive_MINUS_expression
	%tmp2 = load i32* %n_addr
	%tmp3 = sub i32 %tmp2, 1
		; method_invocation
	%tmp4 = call i32 @EntInt_fact(%struct.EntInt* %this, i32 %tmp3)
		; multiplicative_MULT_expression
	%tmp5 = load i32* %n_addr
	%tmp6 = mul i32 %tmp5, %tmp4
	br label %label_3
label_2: 	; l_False
	%tmp7 = load i32* %n_addr
	br label %label_3
label_3: 	; l_Next
	%tmp8 = phi i32 [%tmp6, %label_1] ,[%tmp7, %label_2]
		; return_statement
	store i32 %tmp8, i32* %tmp
	%tmp9 = load i32* %tmp
	store i32 %tmp9, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp10 = load i32* %retval
	ret i32 %tmp10
}

		; method_header
define void @main() {
entry:
		; M3
	%n = alloca i32
	%f = alloca i32
		; assignment
	store i32 0, i32* %n
	br label %label_8
label_8:	; l_Begin
		; relational_LT_expression
	%tmp11 = load i32* %n
	%tmp12 = icmp slt i32 %tmp11, 1
	br i1 %tmp12, label %label_9, label %label_10
		; conditional_or_expression
label_10:	; l_False
		; relational_GT_expression
	%tmp13 = load i32* %n
	%tmp14 = icmp sgt i32 %tmp13, 16
	br i1 %tmp14, label %label_9, label %label_12
label_9:	; l_True
		; method_invocation
	%tmp15 = call i32 (i8*, ...)* @printf(i8* getelementptr ([51 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp16 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
	br label %label_8
label_12:	; l_False
		; method_invocation
	%tmp17 = load i32* %n
	%tmp18 = call i32 @EntInt_fact(%struct.EntInt* null, i32 %tmp17)
		; assignment
	store i32 %tmp18, i32* %f
		; method_invocation
	%tmp19 = load i32* %n
	%tmp20 = load i32* %f
	%tmp21 = call i32 (i8*, ...)* @printf(i8* getelementptr ([19 x i8]* @.str2, i32 0, i32 0) , i32 %tmp19, i32 %tmp20)
		; method_declaration
	br label %return
return:
	ret void
}


