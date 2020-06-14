section .text
global strpbrk

strpbrk:
	push rbp
	mov rbp, rsp

	mov r11,-1

	loop:
		inc r11
		cmp byte [rdi+r11],0
		je not_found
		mov rcx,0
		jmp check_byte

	check_byte:
		cmp byte [rsi+rcx],0
		je loop
		mov dl,byte [rdi+r11]
		cmp byte [rsi+rcx],dl
		je prepare_inc
		inc rcx
		jmp check_byte

	prepare_inc:
		mov rcx,0
		jmp inc_rdi

	inc_rdi:
		cmp rcx,r11
		je end
		inc rcx
		inc rdi
		jmp inc_rdi

	not_found:
		mov rax,0
		leave
		ret

	end:
		mov rax,rdi
		leave
		ret