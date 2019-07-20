BITS 64
SECTION .text
GLOBAL memset

memset:
	push rbp
	mov rbp, rsp
	mov rax, 0
	cmp rdi, 0
	je .end

.memset:
	cmp rdx, rax
	je .end
	mov byte [rdi], sil
	inc rax
	inc rdi
	jmp .memset

.end:
	mov rsp, rbp
	pop rbp
	ret
