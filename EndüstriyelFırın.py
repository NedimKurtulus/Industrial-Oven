# -*- coding: utf-8 -*-
"""
Created on Mon Jun 16 18:43:47 2025

@author: nedim
"""
import time
import msvcrt  

class FirinKontrol:
    def __init__(self):
        self.sicaklik = 180  
        self.nem = False
        self.dakika = 0
        self.saniye = 0
        self.timer_calisti = False
    
    def ekrani_guncelle(self, secim_prompt=False):
        # Ekranı temizlemek yerine sürekli üstüne yazıyoruz
        print("\n" * 10)  # Eski içeriği aşağı itmek için
        
        # Başlık ve menü
        print("FIRIN KONTROL PANELI")
        print("1- Sicaklik +1C      2- Sicaklik -1C")
        print("3- Sicaklik +10C     4- Sicaklik -10C")
        print("5- Nem Toggle        6- Patates Tarifi")
        print("7- Dakika +1         8- Dakika -1")
        print("9- Timer Baslat      0- Timer Sifirla")
        
        # Değerler
        print(f"\nSICAKLIK: {self.sicaklik}°C")
        print(f"NEM     : {'AÇIK' if self.nem else 'KAPALI'}")
        print(f"TIMER   : {self.dakika:02d}:{self.saniye:02d}")
        
        if secim_prompt:
            print("\nSecim: ", end='', flush=True)
    
    def bekle_bir_saniye(self):
        time.sleep(1)
    
    def geri_sayim(self):
        while (self.dakika > 0 or self.saniye > 0) and self.timer_calisti:
            self.ekrani_guncelle()
            
            # Saniye sayacı
            if self.saniye > 0:
                self.saniye -= 1
            else:
                if self.dakika > 0:
                    self.dakika -= 1
                    self.saniye = 59
            
            # 1 saniye bekle
            for _ in range(4):  # Daha hassas bekleme için
                if msvcrt.kbhit():  # Kullanıcı bir tuşa basarsa
                    if msvcrt.getch().decode('ascii') == '0':  # 0'a basılırsa
                        self.timer_calisti = False
                        return
                time.sleep(0.25)
        
        if self.timer_calisti:  # Timer normal bitirdiyse
            self.timer_calisti = False
            self.ekrani_guncelle()
            print("\n*** ZAMAN DOLDU ***")
            time.sleep(2)
    
    def ana_dongu(self):
        while True:
            self.ekrani_guncelle(secim_prompt=True)
            
            try:
                secim = msvcrt.getch().decode('ascii')
            except:
                continue  # Geçersiz tuş
            
            if secim == '1':
                self.sicaklik += 1
            elif secim == '2':
                self.sicaklik -= 1
            elif secim == '3':
                self.sicaklik += 10
            elif secim == '4':
                self.sicaklik -= 10
            elif secim == '5':
                self.nem = not self.nem
            elif secim == '6':  # Patates tarifi
                self.sicaklik = 200
                self.nem = True
                self.dakika = 15
                self.saniye = 0
            elif secim == '7':  # Dakika artır
                if self.dakika < 60:
                    self.dakika += 1
            elif secim == '8':  # Dakika azalt
                if self.dakika > 0:
                    self.dakika -= 1
            elif secim == '9':  # Timer başlat
                if self.dakika > 0 or self.saniye > 0:
                    self.timer_calisti = True
                    self.geri_sayim()
            elif secim == '0':  # Timer sıfırla
                self.dakika = 0
                self.saniye = 0
                self.timer_calisti = False

# Programı başlat
if __name__ == "__main__":
    firin = FirinKontrol()
    firin.ana_dongu()
