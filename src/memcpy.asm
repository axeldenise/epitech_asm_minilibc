section .text
global memcpy

memcpy:
	push rbp
	mov	rbp, rsp

	mov rcx,0

	loop:
		cmp rsi,0
		je before_end
		cmp rcx,rdx
		je before_end
		mov r8b, byte [rsi]
		mov byte [rdi],r8b
		inc rcx
		inc rsi
		inc rdi
		jmp loop

	before_end:
		cmp rcx,0
		je end
		dec rcx
		dec rdi
		jmp before_end

	end:
		mov rax,rdi
		leave
		ret