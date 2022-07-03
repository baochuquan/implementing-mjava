		; ModuleID = './source/Inheritance/Inheritance.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.String = type {  }
%struct.Fact = type { double, i1, i32, i32 }
%struct.Test = type {  }
@.str1 = internal constant [3 x i8]  c"%d\00"
%struct.Int = type { double, i1, i32 }
@.str2 = internal constant [23 x i8]  c"2 + factorial(%d)= %d
\00"
%struct.Number = type { double, i1 }
@.str0 = internal constant [51 x i8]  c"Enter an integer greater than 0 and less than 17: \00"

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; constructor_declarator
define void @Number(%struct.Number* %this, double %x) {
entry:
	%x_addr = alloca double
	store double %x, double* %x_addr
		; left_hand_side
	%tmp0 = getelementptr %struct.Number* %this, i32 0, i32 0
		; assignment
	%tmp1 = load double* %x_addr
	store double %tmp1, double* %tmp0
		; constructor_declaration
	br label %return
return:
	ret void
}

		; constructor_declarator
define void @Int(%struct.Int* %this, i32 %i) {
entry:
	%i_addr = alloca i32
	store i32 %i, i32* %i_addr
		; explicit_constructor_invocation_SUPER
	%tmp2 = bitcast %struct.Int* %this to %struct.Number*
	call void @Number(%struct.Number* %tmp2, double 3.5)
		; left_hand_side
	%tmp3 = getelementptr %struct.Int* %this, i32 0, i32 2
		; assignment
	%tmp4 = load i32* %i_addr
	store i32 %tmp4, i32* %tmp3
		; constructor_declaration
	br label %return
return:
	ret void
}

		; constructor_declarator
define void @Fact(%struct.Fact* %this, i32 %i) {
entry:
	%i_addr = alloca i32
	store i32 %i, i32* %i_addr
		; explicit_constructor_invocation_SUPER
	%tmp5 = load i32* %i_addr
	%tmp6 = bitcast %struct.Fact* %this to %struct.Int*
	call void @Int(%struct.Int* %tmp6, i32 %tmp5)
		; left_hand_side
	%tmp7 = getelementptr %struct.Fact* %this, i32 0, i32 3
		; assignment
	store i32 2, i32* %tmp7
		; constructor_declaration
	br label %return
return:
	ret void
}

		; method_header
define i32 @Fact_f(%struct.Fact* %this) {
entry:
	%retval = alloca i32
	%tmp = alloca i32
		; method_invocation
	%tmp8 = getelementptr %struct.Fact* %this, i32 0, i32 2
	%tmp9 = load i32* %tmp8
	%tmp10 = call i32 @Fact_fact(%struct.Fact* %this, i32 %tmp9)
		; additive_PLUS_expression
	%tmp11 = getelementptr %struct.Fact* %this, i32 0, i32 3
	%tmp12 = load i32* %tmp11
	%tmp13 = add i32 %tmp12, %tmp10
		; return_statement
	store i32 %tmp13, i32* %tmp
	%tmp14 = load i32* %tmp
	store i32 %tmp14, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp15 = load i32* %retval
	ret i32 %tmp15
}

		; method_header
define i32 @Fact_fact(%struct.Fact* %this, i32 %n) {
entry:
	%n_addr = alloca i32
	store i32 %n, i32* %n_addr
	%retval = alloca i32
	%tmp = alloca i32
		; relational_GT_expression
	%tmp16 = load i32* %n_addr
	%tmp17 = icmp sgt i32 %tmp16, 2
	br i1 %tmp17, label %label_17, label %label_18
		; conditional_expression
	br i1 %tmp17, label %label_17, label %label_18
label_17: 	; l_True
		; additive_MINUS_expression
	%tmp18 = load i32* %n_addr
	%tmp19 = sub i32 %tmp18, 1
		; method_invocation
	%tmp20 = call i32 @Fact_fact(%struct.Fact* %this, i32 %tmp19)
		; multiplicative_MULT_expression
	%tmp21 = load i32* %n_addr
	%tmp22 = mul i32 %tmp21, %tmp20
	br label %label_19
label_18: 	; l_False
	%tmp23 = load i32* %n_addr
	br label %label_19
label_19: 	; l_Next
	%tmp24 = phi i32 [%tmp22, %label_17] ,[%tmp23, %label_18]
		; return_statement
	store i32 %tmp24, i32* %tmp
	%tmp25 = load i32* %tmp
	store i32 %tmp25, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp26 = load i32* %retval
	ret i32 %tmp26
}

		; method_header
define void @main() {
entry:
		; M3
	%n = alloca i32
	%f = alloca i32
	%t = alloca %struct.Fact*
		; assignment
	store i32 0, i32* %n
	br label %label_24
label_24:	; l_Begin
		; relational_LT_expression
	%tmp27 = load i32* %n
	%tmp28 = icmp slt i32 %tmp27, 1
	br i1 %tmp28, label %label_25, label %label_26
		; conditional_or_expression
label_26:	; l_False
		; relational_GT_expression
	%tmp29 = load i32* %n
	%tmp30 = icmp sgt i32 %tmp29, 16
	br i1 %tmp30, label %label_25, label %label_28
label_25:	; l_True
		; method_invocation
	%tmp31 = call i32 (i8*, ...)* @printf(i8* getelementptr ([51 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp32 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
	br label %label_24
label_28:	; l_False
		; class_instance_creation_expression
	%tmp33 = malloc %struct.Fact
		; constructor_invocation
	%tmp34 = load i32* %n
	call void @Fact(%struct.Fact* %tmp33, i32 %tmp34)
		; assignment
	store %struct.Fact* %tmp33, %struct.Fact** %t
		; name
	%tmp35 = load %struct.Fact** %t
		; method_invocation
	%tmp36 = call i32 @Fact_f(%struct.Fact* %tmp35)
		; assignment
	store i32 %tmp36, i32* %f
		; method_invocation
	%tmp37 = load i32* %n
	%tmp38 = load i32* %f
	%tmp39 = call i32 (i8*, ...)* @printf(i8* getelementptr ([23 x i8]* @.str2, i32 0, i32 0) , i32 %tmp37, i32 %tmp38)
		; method_declaration
	br label %return
return:
	ret void
}


