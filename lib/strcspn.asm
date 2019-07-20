BITS 64
SECTION .text
GLOBAL strcspn

strcspn:
	push rbp
	mov rbp, rsp
	mov rax, 0
	cmp rdi, 0
	je null
	cmp rsi, 0
	je null
	jmp pbrbk

increase:
	inc rax
	mov rcx, 0
	inc rdi

pbrbk:
	cmp byte [rdi], 0
	je end
	jmp check

check:
	mov r8b, byte [rdi]
	cmp byte [rsi + rcx], 0
	je increase
	cmp byte [rsi + rcx], r8b
	je done
	inc rcx
	jmp check

done:
	mov rax, rax
	jmp end

null:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp
	ret