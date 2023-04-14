org 0x7c00
start:
	mov ax,cs
	mov ds,ax
	mov ss,ax
	mov es,ax
	mov sp,0x100
	jmp main
main:
	mov ah,0x03
	xor bh,bh
	int 0x10
	mov bp,msg1
	mov cx,msg1_Len
	mov ax,0x1301
	mov bx,0x07
	mov dl,0
	int 0x10

	xor cx,cx
	xor bx,bx

	xor ax,ax
	int 0x16

	xor ax,ax
	mov ax,0x7e00
	mov es,ax
	xor bx,bx
	mov ah,0x2
	mov dl,0x80
	mov al,1
	mov dh,0
	mov ch,0
	mov cl,10
	int 0x13

	xor bx,bx
	mov dl,0x80
	mov ah,0x3
	mov al,1
	mov dh,0
	mov ch,0
	mov cl,1
	int 0x13

	xor ax,ax
	mov ax,0x7e00
	mov es,ax
	xor bx,bx
	mov ah,0x2
	mov dl,0x80
	mov al,1
	mov dh,0
	mov ch,0
	mov cl,11
	int 0x13

	xor bx,bx
	mov dl,0x80
	mov ah,0x3
	mov al,1
	mov dh,0
	mov ch,1
	mov cl,17
	int 0x13

	mov ax,cs
	mov ds,ax
	mov ss,ax
	mov es,ax
	mov ah,0x03
	xor bh,bh
	int 0x10
	mov bp,msg3
	mov cx,msg3_Len
	mov ax,0x1301
	mov bx,0x07
	mov dl,0
	int 0x10

	xor ax,ax
	int 0x16

	jmp reboot

reboot:
	mov ax,0xffff
	push ax
	mov ax,0
	push ax
	retf

data:
	msg1:	db "Disk Logical Lock Unlocker",0AH,0DH
	msg2:	db "Press any key to unlock the disk..."
	msg1_Len equ  $-msg1
	msg3:	db "",0AH,0DH
	msg4:	db "Unlock successfully.",0AH,0DH
	msg5:	db "Press any key to reboot..."
	msg3_Len equ  $-msg3

times 510-($-$$)  db 0xF
dw 0xAA55