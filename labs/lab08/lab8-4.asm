%include 'in_out.asm'
section .data
msg1 db 'Введите a: ', 0h
msg2 db 'Введите x: ', 0h
msg3 db "f(x)= ",0h

section .bss
F resb 10
A resb 10
X resb 10

section .text

global _start
_start:

mov eax, msg1
call sprint

mov ecx, A
mov edx, 10
call sread

mov eax, A
call atoi
mov [A], eax

mov eax, msg2
call sprint

mov ecx, X
mov edx, 10
call sread

mov eax, X
call atoi
mov [X], eax

mov ecx, 7
cmp ecx, [A]
jl fn_1
jmp fn_2

fn_2:
mov eax, [A]
mov ebx, [X]
mul ebx
mov [F],eax
jmp fin

fn_1:
mov ebx, [A]
sub ebx, 7
mov [F], ebx
jmp fin

fin:
mov eax, msg3
call sprint
mov eax, [F]
call iprintLF
call quit
 