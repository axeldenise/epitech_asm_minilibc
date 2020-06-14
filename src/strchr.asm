section .text
global strchr

strchr:
	push rbp
	mov	rbp, rsp

	loop:
		cmp byte [rdi],sil
		je end
		cmp byte [rdi],0
		je error
		inc rdi
		jmp loop

	error:
		mov rax,0
		leave
		ret

	end:
		mov rax,rdi
		leave
		ret