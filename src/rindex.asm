section .text
global rindex

rindex:
	push rbp
	mov	rbp, rsp

	mov rcx,0

	go_end:
		cmp byte [rdi],0
		je loop
		inc rcx
		inc rdi
		jmp go_end

	loop:
		cmp byte [rdi],sil
		je end
		cmp rcx,0
		je error
		dec rdi
		dec rcx
		jmp loop

	error:
		mov rax,0
		leave
		ret

	end:
		mov rax,rdi
		leave
		ret