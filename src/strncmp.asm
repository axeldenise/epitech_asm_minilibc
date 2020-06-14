section .text
global strncmp

strncmp:
	push rbp
	mov	rbp, rsp

	mov rcx,0
	mov r8b,0
	mov r10b,0

	loop:
		cmp rcx,rdx
		je end
		mov r8b, [rdi+rcx]
		mov r10b, [rsi+rcx]
		cmp r8b,0
		je end
		cmp r10b,0
		je end
		cmp r8b,r10b
		jne end
		inc rcx
		jmp loop

	end:
		sub r8b,r10b
		movsx rax,r8b
		leave
		ret