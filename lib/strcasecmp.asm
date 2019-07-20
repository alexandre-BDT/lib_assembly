BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
	push rbp
	mov rbp, rsp
	push rdi
	xor rcx, rcx

loop:
	mov r8b, byte [rdi + rcx]
	mov r9b, byte [rsi + rcx]
	cmp byte [rdi + rcx], 0
	je end
	cmp byte [rsi + rcx], 0
	je end
	jmp first

first:
	cmp r8b, 0x61 ;hex lower a
	jl second
	cmp r8b, 0x7a ;hex lower z
	jg second
	sub r8b, 0x20
	jmp second

second:
	cmp r9b, 0x61
	jl check
	cmp r9b, 0x7a
	jg check
	sub r9b, 0x20
	jmp check

check:
	cmp r9b, r8b
	jne end
	inc rcx
	jmp loop

end:
	sub r8b, r9b
	movsx rax, r8b
	pop rdi
	mov rsp, rbp
	pop rbp
	ret