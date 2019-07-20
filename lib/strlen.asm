BITS 64
section .text
global strlen

strlen:
	push rbp
	mov rbp, rsp
	mov rax, 0
	cmp rdi, 0
	je .end

.strlen:
	cmp byte [rdi + rax], 0
	je .end
	inc rax
	jmp .strlen

.end:
	mov rsp, rbp
	pop rbp
	ret