		; ModuleID = './source/ObjArray/Max.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.String = type {  }
@.str2 = internal constant [10 x i8]  c"max:  %d
\00"
%struct.Int = type { i32 }
%struct.Array = type {  }
@.str1 = internal constant [3 x i8]  c"%d\00"
@.str0 = internal constant [25 x i8]  c"Enter an integer value: \00"

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
define i32 @Int_getInt(%struct.Int* %this) {
entry:
	%retval = alloca i32
	%tmp = alloca i32
		; return_statement
	%tmp2 = getelementptr %struct.Int* %this, i32 0, i32 0
	%tmp3 = load i32* %tmp2
	store i32 %tmp3, i32* %tmp
	%tmp4 = load i32* %tmp
	store i32 %tmp4, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp5 = load i32* %retval
	ret i32 %tmp5
}

		; method_header
define i32 @Array_max(%struct.Array* %this, %struct.Int** %a, i32 %n) {
entry:
	%a_addr = alloca %struct.Int**
	store %struct.Int** %a, %struct.Int*** %a_addr
	%n_addr = alloca i32
	store i32 %n, i32* %n_addr
	%retval = alloca i32
	%tmp = alloca i32
		; M3
	%i = alloca i32
	%max = alloca i32
	%c = alloca i32
		; assignment
	store i32 0, i32* %i
		; unary_minus_expression
	%tmp6 = sub i32 0, 10000
		; assignment
	store i32 %tmp6, i32* %max
	br label %label_16
label_16:	; l_Begin
		; relational_LT_expression
	%tmp7 = load i32* %i
	%tmp8 = load i32* %n_addr
	%tmp9 = icmp slt i32 %tmp7, %tmp8
	br i1 %tmp9, label %label_17, label %label_18
label_17:	; l_True
		; array_access
	%tmp10 = load %struct.Int*** %a_addr
	%tmp11 = load i32* %i
	%tmp12 = getelementptr %struct.Int** %tmp10, i32 %tmp11
		; method_invocation
	%tmp13 = load %struct.Int** %tmp12
	%tmp14 = call i32 @Int_getInt(%struct.Int* %tmp13)
		; assignment
	store i32 %tmp14, i32* %c
		; relational_GT_expression
	%tmp15 = load i32* %c
	%tmp16 = load i32* %max
	%tmp17 = icmp sgt i32 %tmp15, %tmp16
	br i1 %tmp17, label %label_25, label %label_26
label_25:	; l_True
		; assignment
	%tmp18 = load i32* %c
	store i32 %tmp18, i32* %max
	br label %label_26
label_26:	; l_False
		; additive_PLUS_expression
	%tmp19 = load i32* %i
	%tmp20 = add i32 %tmp19, 1
		; assignment
	store i32 %tmp20, i32* %i
	br label %label_16
label_18:	; l_False
		; return_statement
	%tmp21 = load i32* %max
	store i32 %tmp21, i32* %tmp
	%tmp22 = load i32* %tmp
	store i32 %tmp22, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp23 = load i32* %retval
	ret i32 %tmp23
}

		; method_header
define void @main() {
entry:
		; M3
	%i = alloca i32
	%n = alloca i32
		; array_creation
	%tmp24 = malloc [5 x %struct.Int*]
		; assignment
	store i32 0, i32* %i
	br label %label_48
label_48:	; l_Begin
		; relational_LT_expression
	%tmp25 = load i32* %i
	%tmp26 = icmp slt i32 %tmp25, 5
	br i1 %tmp26, label %label_49, label %label_50
label_49:	; l_True
		; method_invocation
	%tmp27 = call i32 (i8*, ...)* @printf(i8* getelementptr ([25 x i8]* @.str0, i32 0, i32 0) )
		; method_invocation
	%tmp28 = call i32 (i8*, ...)* @scanf(i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i32* %n)
		; array_access
	%tmp29 = load i32* %i
	%tmp30 = getelementptr [5 x %struct.Int*]* %tmp24, i32 0, i32 %tmp29
		; class_instance_creation_expression
	%tmp31 = malloc %struct.Int
		; constructor_invocation
	%tmp32 = load i32* %n
	call void @Int(%struct.Int* %tmp31, i32 %tmp32)
		; assignment
	store %struct.Int* %tmp31, %struct.Int** %tmp30
		; additive_PLUS_expression
	%tmp33 = load i32* %i
	%tmp34 = add i32 %tmp33, 1
		; assignment
	store i32 %tmp34, i32* %i
	br label %label_48
label_50:	; l_False
		; method_invocation
	%tmp35 = bitcast [5 x %struct.Int*]* %tmp24 to %struct.Int**
	%tmp36 = call i32 @Array_max(%struct.Array* null, %struct.Int** %tmp35, i32 5)
		; method_invocation
	%tmp37 = call i32 (i8*, ...)* @printf(i8* getelementptr ([10 x i8]* @.str2, i32 0, i32 0) , i32 %tmp36)
		; method_declaration
	br label %return
return:
	ret void
}


