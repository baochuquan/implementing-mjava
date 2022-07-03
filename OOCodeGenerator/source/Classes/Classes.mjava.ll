		; ModuleID = './source/Classes/Classes.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.String = type {  }
%struct.Test = type {  }
@.str1 = internal constant [3 x i8]  c"%d\00"
%struct.Int = type { i32, i32 }
@.str2 = internal constant [23 x i8]  c"2 + factorial(%d)= %d
\00"
@.str0 = internal constant [51 x i8]  c"Enter an integer greater than 0 and less than 17: \00"

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; constructor_declarator
define void @Int(%struct.Int* %this, i32 %i) {
entry:
	%i_addr = alloca i32
	store i32 %i, i32* %i_addr
		; left_hand_side
	%tmp0 = getelementptr %struct.Int* %this, i32 0, i32 0
		; assignment
	%tmp1 = load i32* %i_addr
	store i32 %tmp1, i32* %tmp0
		; left_hand_side
	%tmp2 = getelementptr %struct.Int* %this, i32 0, i32 1
		; assignment
	store i32 2, i32* %tmp2
		; constructor_declaration
	br label %return
return:
	ret void
}

		; method_header
define i32 @Int_f(%struct.Int* %this) {
entry:
	%retval = alloca i32
	%tmp = alloca i32
		; method_invocation
	%tmp3 = getelementptr %struct.Int* %this, i32 0, i32 0
	%tmp4 = load i32* %tmp3
	%tmp5 = call i32 @Int_fact(%struct.Int* %this, i32 %tmp4)
		; additive_PLUS_expression
	%tmp6 = getelementptr %struct.Int* %this, i32 0, i32 1
	%tmp7 = load i32* %tmp6
	%tmp8 = add i32 %tmp7, %tmp5
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
define i32 @Int_fact(%struct.Int* %this, i32 %n) {
entry:
	%n_addr = alloca i32
	store i32 %n, i32* %n_addr
	%retval = alloca i32
	%tmp = alloca i32
		; relational_GT_expression
	%tmp11 = load i32* %n_addr
	%tmp12 = icmp sgt i32 %tmp11, 2
	br i1 %tmp12, label %label_13, label %label_14
		; conditional_expression
	br i1 %tmp12, label %label_13, label %label_14
label_13: 	; l_True
		; additive_MINUS_expression
	%tmp13 = load i32* %n_addr
	%tmp14 = sub i32 %tmp13, 1
		; method_invocation
	%tmp15 = call i32 @Int_fact(%struct.Int* %this, i32 %tmp14)
		; multiplicative_MULT_expression
	%tmp16 = load i32* %n_addr
	%tmp17 = mul i32 %tmp16, %tmp15
	br label %label_15
label_14: 	; l_False
	%tmp18 = load i32* %n_addr
	br label %label_15
label_15: 	; l_Next
	%tmp19 = phi i32 [%tmp17, %label_13] ,[%tmp18, %label_14]
		; return_statement
	store i32 %tmp19, i32* %tmp
	%tmp20 = load i32* %tmp
	store i32 %tmp20, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp21 = load i32* %retval
	ret i32 %tmp21
}

		; method_header
define void @main() {
entry:
		; M3
	%n = alloca i32
	%f = alloca i32
	%t = alloca %struct.Int*
		; assignment
	store i32 0, i32* %n
	br label %label_20
label_20:	; l_Begin
		; relational_LT_expression
	%tmp22 = load i32* %n
	%tmp23 = icmp slt i32 %tmp22, 1
	br i1 %tmp23, label %label_21, label %label_22
		; conditional_or_expression
label_22:	; l_False
		; relational_GT_expression
	%tmp24 = load i32* %n
	%tmp25 = icmp sgt i32 %tmp24, 16
	br i1 %tmp25, label %label_21, label %label_24
label_21:	; l_True
		; method_invocation
	%tmp26 = call i32 (i8*, ...)* @printf(i8* getelementptr ([51 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp27 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
	br label %label_20
label_24:	; l_False
		; class_instance_creation_expression
	%tmp28 = malloc %struct.Int
		; constructor_invocation
	%tmp29 = load i32* %n
	call void @Int(%struct.Int* %tmp28, i32 %tmp29)
		; assignment
	store %struct.Int* %tmp28, %struct.Int** %t
		; name
	%tmp30 = load %struct.Int** %t
		; method_invocation
	%tmp31 = call i32 @Int_f(%struct.Int* %tmp30)
		; assignment
	store i32 %tmp31, i32* %f
		; method_invocation
	%tmp32 = load i32* %n
	%tmp33 = load i32* %f
	%tmp34 = call i32 (i8*, ...)* @printf(i8* getelementptr ([23 x i8]* @.str2, i32 0, i32 0) , i32 %tmp32, i32 %tmp33)
		; method_declaration
	br label %return
return:
	ret void
}


