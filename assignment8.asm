TITLE  Assignment 8
; Works with Fibonacci Numbers
; Name:  Yunlin Xie
; Date: 06/18/2019


INCLUDE Irvine32.inc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;macro to print input character
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printChar MACRO char
	push eax
	mov al, char
	call writeChar
	pop eax
ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;macro to print input string
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printString MACRO strAddr
	push edx
	mov edx, strAddr
	call writeString
	pop edx
ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;macro to print space
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
space MACRO
	push eax
	mov eax, ' '
	call writeChar
	pop eax
ENDM


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NUMROW = 5
NUMCOL = 5

.data
array WORD (NUMROW*NUMCOL) DUP (?)
errorMsg BYTE "Must be between 1 and ", 0
amountOfNum BYTE "How many numbers? ", 0
searchNum BYTE "Target number? (-1 to end search): ", 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.code
main PROC

LforAskingNum:
mov edx, OFFSET amountOfNum
call getCount    ;eax=entered number, ecx=boolean(0 or 1)
cmp ecx, 0
je ERROR

push eax
push OFFSET array
call fillArray

LforSearch:
push OFFSET searchNum
push OFFSET array
call search

jmp LforAskingNum

ERROR:
printString OFFSET errorMsg
mov eax, (NUMROW*NUMCOL)
call writeDec
call crlf
	
jmp LforAskingNum


	exit	
main ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; getCount returns an input count and a boolean
; input: edx = address of a string prompt
; output: eax=entered number, ecx=boolean(0 or 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getCount PROC

printString edx
call readDec
cmp eax, 1
jb ERRORofGetCount
cmp eax, (NUMROW*NUMCOL)
ja ERRORofGetCount
mov ecx, 1
jmp EndofGetCount

ERRORofGetCount:
mov ecx, 0

EndofGetCount:

ret
getCount ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fillArray fill the 2D array up to the count from the user
; input: max count, OFFSET of array on stack
;;; stack frame:
; max count        ebp+12
; addr of array    ebp+8
; ret addr         ebp+4
; ebp  
; saved regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fillArray  PROC
	
ret
fillArray  ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; printArray prints an array
; input: max count, addr of array on stack
;;; stack frame:
; max count        ebp+12
; addr of array    ebp+8
; ret addr         ebp+4
; ebp  
; saved regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printArray  PROC
	
ret
printArray  ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; search search the location of a given number
; input: addr of string, addr of array on stack
;;; stack frame:
; addr of string     ebp+12
; addr of array      ebp+8
; ret addr           ebp+4
; ebp
; saved regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
search  PROC

ret
search  ENDP




END main
