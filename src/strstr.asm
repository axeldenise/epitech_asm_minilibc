section .text
global strstr

strstr:
	push rbp
	mov rbp, rsp

	mov rcx,0

	loop:
		cmp rsi,0
		je not_found
		cmp byte [rdi],0
		je not_found
		mov r8b, byte [rsi]
		cmp byte [rdi],r8b
		je prepare_check
		inc rdi
		jmp loop

	check:
		mov r8b, byte [rsi+rcx]
		cmp r8b,0
		je found
		cmp r8b, byte [rdi]
		jne loop
		inc rdi
		inc rcx
		jmp check

	prepare_check:
		mov rdx,rdi
		mov rcx,0
		jmp check

	not_found:
		mov rax,0
		leave
		ret

	found:
		mov rax,rdx
		leave
		ret