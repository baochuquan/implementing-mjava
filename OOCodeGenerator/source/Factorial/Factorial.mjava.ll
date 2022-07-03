		; ModuleID = './source/Factorial/Factorial.mjava.ll'

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-s0:0:64-f80:32:32"
target triple = "i686-pc-linux-gnu"

		; Global values
%struct.Factorial = type {  }
%struct.String = type {  }
@.str2 = internal constant [15 x i8]  c" Fact(%d)= %d
\00"
@.str1 = internal constant [3 x i8]  c"%d\00"
@.str0 = internal constant [25 x i8]  c"Enter an integer value: \00"
%struct.Fac = type {  }

		; External declarations
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)

		; constructor_declarator
define void @Fac(%struct.Fac* %this) {
entry:
		; constructor_declaration
	br label %return
return:
	ret void
}

		; method_header
define i32 @Fac_ComputeFac(%struct.Fac* %this, i32 %num) {
entry:
	%num_addr = alloca i32
	store i32 %num, i32* %num_addr
	%retval = alloca i32
	%tmp = alloca i32
		; M3
	%aux = alloca i32
		; assignment
	store i32 1, i32* %aux
	br label %label_4
label_4:	; l_Begin
		; relational_GT_expression
	%tmp0 = load i32* %num_addr
	%tmp1 = icmp sgt i32 %tmp0, 1
	br i1 %tmp1, label %label_5, label %label_6
label_5:	; l_True
		; multiplicative_MULT_expression
	%tmp2 = load i32* %aux
	%tmp3 = load i32* %num_addr
	%tmp4 = mul i32 %tmp2, %tmp3
		; assignment
	store i32 %tmp4, i32* %aux
		; additive_MINUS_expression
	%tmp5 = load i32* %num_addr
	%tmp6 = sub i32 %tmp5, 1
		; assignment
	store i32 %tmp6, i32* %num_addr
	br label %label_4
label_6:	; l_False
		; return_statement
	%tmp7 = load i32* %aux
	store i32 %tmp7, i32* %tmp
	%tmp8 = load i32* %tmp
	store i32 %tmp8, i32* %retval
	br label %return
		; method_declaration
	br label %return
return:
	%tmp9 = load i32* %retval
	ret i32 %tmp9
}

		; method_header
define void @main() {
entry:
		; M3
	%s1 = alloca i8*
	%s2 = alloca i8*
	%s3 = alloca i8*
	%n = alloca i32
	%r = alloca i32
	%f = alloca %struct.Fac*
		; assignment
	store i8* getelementptr ([25 x i8]* @.str0, i32 0, i32 0) , i8** %s1
		; assignment
	store i8* getelementptr ([3 x i8]* @.str1, i32 0, i32 0) , i8** %s2
		; assignment
	store i8* getelementptr ([15 x i8]* @.str2, i32 0, i32 0) , i8** %s3
		; method_invocation
	%tmp10 = load i8** %s1
	%tmp11 = call i32 (i8*, ...)* @printf(i8* %tmp10)
		; method_invocation
	%tmp12 = load i8** %s2
	%tmp13 = call i32 (i8*, ...)* @scanf(i8* %tmp12, i32* %n)
		; class_instance_creation_expression
	%tmp14 = malloc %struct.Fac
		; constructor_invocation
	call void @Fac(%struct.Fac* %tmp14)
		; assignment
	store %struct.Fac* %tmp14, %struct.Fac** %f
		; name
	%tmp15 = load %struct.Fac** %f
		; method_invocation
	%tmp16 = load i32* %n
	%tmp17 = call i32 @Fac_ComputeFac(%struct.Fac* %tmp15, i32 %tmp16)
		; assignment
	store i32 %tmp17, i32* %r
		; method_invocation
	%tmp18 = load i8** %s3
	%tmp19 = load i32* %n
	%tmp20 = load i32* %r
	%tmp21 = call i32 (i8*, ...)* @printf(i8* %tmp18, i32 %tmp19, i32 %tmp20)
		; method_declaration
	br label %return
return:
	ret void
}


