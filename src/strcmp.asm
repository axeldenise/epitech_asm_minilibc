section .text
global strcmp

strcmp:
	push rbp
	mov	rbp, rsp

	mov rcx,0

	loop:
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
		cmp r8b,0
		je ende
		cmp r8b,0
		jg endg
		cmp r8b,0
		jl endl

	ende:
		mov rax,0
		leave
		ret

	endg:
		mov rax,1
		leave
		ret

	endl:
		mov rax,-1
		leave
		ret