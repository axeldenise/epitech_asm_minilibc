section .text
global memmove

memmove:
	push rbp
	mov	rbp, rsp

	mov rcx,0

	cmp rdi,rsi
	jl normal
	jmp prepare_reverse

	normal:
		cmp rcx,rdx
		je end
		mov r10b, byte [rsi+rcx]
		mov byte [rdi+rcx],r10b
		cmp r10b,0
		je end
		inc rcx
		jmp normal

	prepare_reverse:
		cmp rcx, rdx
		je reverse
		cmp byte [rsi+rcx], 0
		je reverse
		inc rcx
		jmp prepare_reverse

	reverse:
		dec rcx
		cmp rcx,0
		jl check_rcx
		mov r10b, byte [rsi+rcx]
		mov byte [rdi+rcx],r10b
		cmp rcx,0
		je end
		jmp reverse

	check_rcx:
		inc rcx
		inc rcx
		jmp reverse

	end:
		mov rax,rdi
		leave
		ret