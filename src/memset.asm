section .text
global memset

memset:
	push rbp
	mov	rbp, rsp

	mov rcx,0

	loop:
		cmp rcx,rdx
		je end
		mov byte [rdi+rcx],sil
		inc rcx
		jmp loop

	end:
		mov rax,rdi
		leave
		ret