section .text
global strcspn

strcspn:
	push rbp
	mov rbp, rsp

	mov rcx,-1

	loop:
		inc rcx
		cmp byte [rdi+rcx],0
		je end
		mov r11,0
		jmp check

	check:
		cmp byte [rsi+r11],0
		je loop
		mov dl, byte [rdi+rcx]
		cmp byte [rsi+r11],dl
		je end
		inc r11
		jmp check

	end:
		mov rax,rcx
		leave
		ret