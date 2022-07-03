		; ModuleID = './source/Sample/SampleProgram.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.String = type {  }
@.str2 = internal constant [19 x i8]  c"factorial(%d)= %d
\00"
@.str0 = internal constant [51 x i8]  c"Enter an integer greater than 0 and less than 17: \00"
%struct.Test = type {  }
%struct.Int = type { i32 }
@.str1 = internal constant [3 x i8]  c"%d\00"

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
	%tmp2 = getelementptr %struct.Int* %this, i32 0, i32 0
	%tmp3 = load i32* %tmp2
	%tmp4 = call i32 @Int_fact(%struct.Int* %this, i32 %tmp3)
		; return_statement
	store i32 %tmp4, i32* %tmp
	%tmp5 = load i32* %tmp
	store i32 %tmp5, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp6 = load i32* %retval
	ret i32 %tmp6
}

		; method_header
define i32 @Int_fact(%struct.Int* %this, i32 %n) {
entry:
	%n_addr = alloca i32
	store i32 %n, i32* %n_addr
	%retval = alloca i32
	%tmp = alloca i32
		; relational_GT_expression
	%tmp7 = load i32* %n_addr
	%tmp8 = icmp sgt i32 %tmp7, 2
	br i1 %tmp8, label %label_9, label %label_10
		; conditional_expression
	br i1 %tmp8, label %label_9, label %label_10
label_9: 	; l_True
		; additive_MINUS_expression
	%tmp9 = load i32* %n_addr
	%tmp10 = sub i32 %tmp9, 1
		; method_invocation
	%tmp11 = call i32 @Int_fact(%struct.Int* %this, i32 %tmp10)
		; multiplicative_MULT_expression
	%tmp12 = load i32* %n_addr
	%tmp13 = mul i32 %tmp12, %tmp11
	br label %label_11
label_10: 	; l_False
	%tmp14 = load i32* %n_addr
	br label %label_11
label_11: 	; l_Next
	%tmp15 = phi i32 [%tmp13, %label_9] ,[%tmp14, %label_10]
		; return_statement
	store i32 %tmp15, i32* %tmp
	%tmp16 = load i32* %tmp
	store i32 %tmp16, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp17 = load i32* %retval
	ret i32 %tmp17
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
	br label %label_16
label_16:	; l_Begin
		; relational_LT_expression
	%tmp18 = load i32* %n
	%tmp19 = icmp slt i32 %tmp18, 1
	br i1 %tmp19, label %label_17, label %label_18
		; conditional_or_expression
label_18:	; l_False
		; relational_GT_expression
	%tmp20 = load i32* %n
	%tmp21 = icmp sgt i32 %tmp20, 16
	br i1 %tmp21, label %label_17, label %label_20
label_17:	; l_True
		; method_invocation
	%tmp22 = call i32 (i8*, ...)* @printf(i8* getelementptr ([51 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp23 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
	br label %label_16
label_20:	; l_False
		; class_instance_creation_expression
	%tmp24 = malloc %struct.Int
		; constructor_invocation
	%tmp25 = load i32* %n
	call void @Int(%struct.Int* %tmp24, i32 %tmp25)
		; assignment
	store %struct.Int* %tmp24, %struct.Int** %t
		; name
	%tmp26 = load %struct.Int** %t
		; method_invocation
	%tmp27 = call i32 @Int_f(%struct.Int* %tmp26)
		; assignment
	store i32 %tmp27, i32* %f
		; method_invocation
	%tmp28 = load i32* %n
	%tmp29 = load i32* %f
	%tmp30 = call i32 (i8*, ...)* @printf(i8* getelementptr ([19 x i8]* @.str2, i32 0, i32 0) , i32 %tmp28, i32 %tmp29)
		; method_declaration
	br label %return
return:
	ret void
}


