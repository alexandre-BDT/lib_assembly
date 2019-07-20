BITS 64
SECTION .text
GLOBAL strstr

strstr:
	push rbp
	mov rbp, rsp
	cmp rdi, 0
	je null
	cmp rsi, 0
	je null
	jmp look

resetCounter:
	mov rcx, 0

look:
	cmp byte [rdi], 0
	je done
	mov r8b, byte [rdi]
	cmp byte [rsi], r8b
	je loop
	inc rdi
	jmp look

loop:
	cmp byte [rsi + rcx], 0
	je resetCounter
	mov r9b, byte [rdi]
	cmp r9b, byte [rsi]
	je done
	inc rcx
	inc rsi
	jmp loop

done:
	mov rax, rdi
	jmp end

null:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp
	ret