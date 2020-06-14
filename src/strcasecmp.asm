section .text
global strcasecmp

strcasecmp:
	push rbp
	mov	rbp, rsp

	mov rcx,0
	mov r11,0

	loop:
		mov r8b,byte [rdi+rcx]
		mov r10b,byte [rsi+rcx]

		cmp r8b,0
		je end

		cmp r10b,0
		je end
		
		cmp r8b,r10b
		je same

		cmp r11,0
		je try_lower

		cmp r11,1
		je try_upper

		mov r11,-1
		jmp manage_end

	try_lower:
		cmp r8b,0x41
		jl not_same
		cmp r8b,0x5A
		jg not_same
		add r8b,0x20
		cmp r8b, r10b
		jne not_same

		jmp same

	try_upper:
		cmp r8b,0x61
		jl not_same
		cmp r8b,0x7A
		jg not_same
		sub r8b,0x20
		cmp r8b,r10b
		jne not_same
				
		jmp same

	not_same:
		inc r11
		jmp loop

	same:
		inc rcx
		mov r11,0
		jmp loop

	manage_end:
		inc r11
		cmp r11,0
		je c1_lower
		cmp r11,1
		je c2_lower
		jmp end

	c1_lower:
		cmp r8b,0x41
		jl manage_end
		cmp r8b,0x5A
		jg manage_end
		add r8b,0x20
		jmp manage_end		

	c2_lower:
		cmp r10b,0x41
		jl manage_end
		cmp r10b,0x5A
		jg manage_end
		add r10b,0x20
		jmp manage_end

	end:
		sub r8b,r10b
		movsx rax,r8b
		leave
		ret