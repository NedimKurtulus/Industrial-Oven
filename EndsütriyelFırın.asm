.model small
.stack 100h
.data
    sicaklik db 0
    nem db 0
    dakika db 0
    saniye db 0
    timer_calisti db 0

    metin_baslik db 'FIRIN KONTROL PANELI', 13, 10, '$'
    metin_menu db '1- Sicaklik +1C      2- Sicaklik -1C', 13, 10, '3- Sicaklik +10C     4- Sicaklik -10C', 13, 10, '5- Nem Toggle        6- Patates Tarifi', 13, 10, '7- Dakika +1         8- Dakika -1', 13, 10, '9- Timer Baslat      0- Timer Sifirla', 13, 10, 13, 10, 'Secim: $'
    metin_sicaklik db 13, 10, 13, 10, 'SICAKLIK: ', '$'
    metin_nem db 13, 10, 'NEM     : ', '$'
    metin_timer db 13, 10, 'TIMER   : ', '$'
    yeni_satir db 13, 10, '$'

.code
mov ax, @data
mov ds, ax

ana_menu:
    call ekran_guncelle

    mov ah, 1
    int 21h

    cmp al, '1'
    je artir1
    cmp al, '2'
    je azalt1
    cmp al, '3'
    je artir10
    cmp al, '4'
    je azalt10
    cmp al, '5'
    je toggle_nem
    cmp al, '6'
    je patates_tarifi
    cmp al, '7'
    je dakika_artir
    cmp al, '8'
    je dakika_azalt
    cmp al, '9'
    je baslat_timer
    cmp al, '0'
    je sifirla_timer
    jmp ana_menu

artir1:
    inc sicaklik
    jmp ana_menu

azalt1:
    dec sicaklik
    jmp ana_menu

artir10:
    add sicaklik, 10
    jmp ana_menu

azalt10:
    sub sicaklik, 10
    jmp ana_menu

toggle_nem:
    cmp nem, 0
    je nem1
    mov nem, 0
    jmp ana_menu
nem1:
    mov nem, 1
    jmp ana_menu

patates_tarifi:
    mov sicaklik, 200
    mov nem, 1
    mov dakika, 15
    mov saniye, 0
    jmp ana_menu

dakika_artir:
    cmp dakika, 60
    jae ana_menu
    inc dakika
    jmp ana_menu

dakika_azalt:
    cmp dakika, 0
    je ana_menu
    dec dakika
    jmp ana_menu

sifirla_timer:
    mov dakika, 0
    mov saniye, 0
    mov timer_calisti, 0
    jmp ana_menu

baslat_timer:
    cmp dakika, 0
    je ana_menu
    mov timer_calisti, 1

geri_sayim:
    call ekran_guncelle
    call bekle_bir_saniye

    cmp saniye, 0
    jne saniye_azalt
    cmp dakika, 0
    je bitir_timer
    dec dakika
    mov saniye, 59
    jmp geri_sayim

saniye_azalt:
    dec saniye
    jmp geri_sayim

bitir_timer:
    mov timer_calisti, 0
    jmp ana_menu

; -------------------------------

ekran_guncelle:
    call temizle

    ; Başlık ve menü
    mov ah, 9
    lea dx, metin_baslik
    int 21h
    lea dx, metin_menu
    int 21h

    ; Değerler
    ; SICAKLIK
    lea dx, metin_sicaklik
    int 21h
    mov al, sicaklik
    call print_decimal
    mov dl, 'C'
    mov ah, 2
    int 21h

    ; NEM
    lea dx, metin_nem
    mov ah, 9
    int 21h
    mov al, nem
    call print_decimal

    ; TIMER
    lea dx, metin_timer
    mov ah, 9
    int 21h
    mov al, dakika
    call print_decimal
    mov dl, ':'
    mov ah, 2
    int 21h
    mov al, saniye
    call print_decimal
    ret

print_decimal:
    xor ah, ah           ; AX = value
    mov cx, 0            ; Counter for digits

    ; Handle hundreds digit
    cmp ax, 100
    jb less_than_100
    mov bl, 100
    div bl               ; AL = hundreds digit, AH = remainder
    mov dl, al
    add dl, '0'
    push ax
    mov ah, 02h
    int 21h              ; Print hundreds digit
    pop ax
    mov al, ah           ; Remainder is in AH
    xor ah, ah
    inc cx               ; Mark that we've printed a digit

less_than_100:
    ; Handle tens digit
    mov bl, 10
    div bl               ; AL = tens digit, AH = units
    mov dl, al
    add dl, '0'
    test cx, cx          ; Check if we've printed a digit already (hundreds)
    jnz print_tens       ; If yes, print tens even if zero
    cmp dl, '0'
    je skip_tens         ; Skip leading zero

print_tens:
    push ax
    mov ah, 02h
    int 21h              ; Print tens digit
    pop ax
    inc cx

skip_tens:
    ; Handle units digit
    mov dl, ah
    add dl, '0'
    mov ah, 02h
    int 21h              ; Print units digit
    ret

bekle_bir_saniye:
    mov cx, 0Fh
    mov dx, 4240h
    mov ah, 86h
    int 15h
    ret

temizle:
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    mov ah, 02h
    mov bh, 00h
    mov dx, 0000h
    int 10h
    ret

end
