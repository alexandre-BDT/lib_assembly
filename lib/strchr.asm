BITS 64
SECTION .text
GLOBAL strchr

strchr:
	push rbp
	mov rbp, rsp
	push rdi
	cmp rdi, 0
	je end

.strchr:
	cmp byte [rdi], sil
	je equal
	cmp byte [rdi], 0
	je not_found
	inc rdi
	jmp .strchr

not_found:
	mov rax, 0
	jmp end

equal:	mov rax, rdi

end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret