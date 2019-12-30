INCLUDE Irvine32.inc

.data
;declare variables here

msgRow1 byte "Enter rows for first matrix: ",0
msgCol1 byte "Enter coloumns for first matrix: ",0
msgRow2 byte "Enter rows for second matrix: ",0
msgCol2 byte "Enter coloumns for second matrix: ",0

msgFillArray1 byte "Enter values for first array: ",0ah,0dh,0
msgFillArray2 byte "Enter values for second array: ",0ah,0dh,0

array1Heading byte "__________Array-1__________",0ah,0dh,0
array2Heading byte "__________Array-2__________",0ah,0dh,0
additionArrayHeading byte "__________ Addition Result __________",0ah,0dh,0
subtractionArrayHeading byte "__________ Subtraction Result __________",0ah,0dh,0
resultArrayHeading byte "__________ Multiplication Result __________",0ah,0dh,0

space byte "  ",0

array1TotalValues BYTE 9
array2TotalValues BYTE 9
resultArrayTotalValues dword 36



array1 BYTE 9 dup(?)
array2 BYTE 9 dup(?)
resultArray DWORD 9 dup(?)
additionArray DWORD 9 dup(?)
subtractionArray DWORD 9 dup(?)


row1 dword 3
col1 dword 3
row2 dword 3
col2 dword 3

.code
main PROC


;filling arrays

COMMENT !!

;///////////////Arrray1
mov edx,offset msgFillArray1
call WriteString

mov ecx,0

.while(ecx < 9)

call readInt
mov array1[ecx],al
inc ecx

.endw


;///////////////Arrray2
mov edx,offset msgFillArray2
call WriteString

mov ecx,0

.while(ecx < 9)

call readInt
mov array2[ecx],al
inc ecx

.endw


COMMENT !
mov array1[0],1
mov array1[1],2
mov array1[2],3
mov array1[3],4
mov array1[4],5
mov array1[5],6
mov array1[6],7
mov array1[7],8
mov array1[8],9

mov array2[0],9
mov array2[1],8
mov array2[2],7
mov array2[3],6
mov array2[4],5
mov array2[5],4
mov array2[6],3
mov array2[7],2
mov array2[8],1
!
;Printing arrays

mov edx,offset array1Heading
call WriteString
call crlf

mov ecx,0
mov ebx,row1

.while(ecx < 9)

movzx eax,array1[ecx]
call WriteDec

mov edx,offset space
call WriteString
inc ecx

.if(ecx == ebx)
call crlf
add ebx,row1
.endif

.endw
call crlf
;//////////////////////////////////

mov edx,offset array2Heading
call WriteString
call crlf

mov ecx,0
mov ebx,row2

.while(ecx < 9)

movzx eax,array2[ecx]
call WriteDec

mov edx,offset space
call WriteString
inc ecx

.if(ecx == ebx)
call crlf
add ebx,row2
.endif

.endw
			 		;multiplying matrices
movzx ebx,array1[0]
movzx eax,array2[0]
mul ebx
push eax

movzx ebx,array1[1]
movzx eax,array2[3]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[2]
movzx eax,array2[6]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[0],eax

;/////////////
movzx ebx,array1[0]
movzx eax,array2[1]
mul ebx
push eax

movzx ebx,array1[1]
movzx eax,array2[4]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[2]
movzx eax,array2[7]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[4],eax

;//////////////////////
movzx ebx,array1[0]
movzx eax,array2[2]
mul ebx
push eax

movzx ebx,array1[1]
movzx eax,array2[5]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[2]
movzx eax,array2[8]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[8],eax

;///////////////////
movzx ebx,array1[3]
movzx eax,array2[0]
mul ebx
push eax

movzx ebx,array1[4]
movzx eax,array2[3]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[5]
movzx eax,array2[6]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[12],eax

;////////////////////
movzx ebx,array1[3]
movzx eax,array2[1]
mul ebx
push eax

movzx ebx,array1[4]
movzx eax,array2[4]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[5]
movzx eax,array2[7]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[16],eax

;//////////////////////
movzx ebx,array1[3]
movzx eax,array2[2]
mul ebx
push eax

movzx ebx,array1[4]
movzx eax,array2[5]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[5]
movzx eax,array2[8]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[20],eax

;//////////////////////
movzx ebx,array1[6]
movzx eax,array2[0]
mul ebx
push eax

movzx ebx,array1[7]
movzx eax,array2[3]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[8]
movzx eax,array2[6]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[24],eax

;/////////////
movzx ebx,array1[6]
movzx eax,array2[1]
mul ebx
push eax

movzx ebx,array1[7]
movzx eax,array2[4]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[8]
movzx eax,array2[7]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[28],eax

;//////////////////////
movzx ebx,array1[6]
movzx eax,array2[2]
mul ebx
push eax

movzx ebx,array1[7]
movzx eax,array2[5]
imul ebx,eax

pop eax
add eax,ebx
push eax

movzx ebx,array1[8]
movzx eax,array2[8]
imul ebx,eax

pop eax
add eax,ebx

mov resultArray[32],eax

;/////////////////////Printing Multiplication Array
mov edx,offset resultArrayHeading
call WriteString
call crlf

mov ecx,0
mov ebx,12

.while(ecx < 36)

mov eax,resultArray[ecx]
call WriteDec

mov edx,offset space
call WriteString
add ecx,4

.if(ecx == ebx)
call crlf
add ebx,12
.endif

.endw

call Addition
call Subtraction

;/////////////////////Printing Addition Array
mov edx,offset additionArrayHeading
call WriteString
call crlf

mov ecx,0
mov ebx,12

.while(ecx < 36)

mov eax,additionArray[ecx]
call WriteDec

mov edx,offset space
call WriteString
add ecx,4

.if(ecx == ebx)
call crlf
add ebx,12
.endif

.endw

;/////////////////////Printing Subtraction Array
mov edx,offset subtractionArrayHeading
call WriteString
call crlf

mov ecx,0
mov ebx,12

.while(ecx < 36)

mov eax,subtractionArray[ecx]
call WriteDec

mov edx,offset space
call WriteString
add ecx,4

.if(ecx == ebx)
call crlf
add ebx,12
.endif

.endw


call crlf
main ENDP

;/////////////////////Addtion Procedure
Addition PROC

mov ecx,0
mov edx,0
.while(ecx < 9)

movzx eax,array1[ecx]
movzx ebx,array2[ecx]

add eax,ebx
mov additionArray[edx],eax
inc ecx
add edx,4
.endw

ret
Addition ENDP

;/////////////////////Subtraction Procedure
Subtraction PROC

mov ecx,0
mov edx,0
.while(ecx < 9)

movzx eax,array1[ecx]
movzx ebx,array2[ecx]

sub eax,ebx
mov subtractionArray[edx],eax
inc ecx
add edx,4
.endw

ret
Subtraction ENDP

EXIT
END main
