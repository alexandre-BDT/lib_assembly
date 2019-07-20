BITS 64
SECTION .text
GLOBAL rindex

rindex:
	push rbp
	mov rbp, rsp
	push rdi
	xor rcx, rcx
	mov rcx, 0

strlen:
	cmp byte [rdi], 0
	je make
	inc rdi
	inc rcx
	jmp strlen

make:
	cmp byte [rdi], sil
	je found
	cmp rcx, 0
	je notFound
	dec rcx
	dec rdi
	jmp make

notFound:
	mov rax, 0
	jmp end

found:
	mov rax, rdi

end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret