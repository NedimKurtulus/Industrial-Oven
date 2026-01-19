# Intel x86 Assembly ile Endüstriyel Fırın Kontrol Sistemi (ISADES 2025)

Bu proje, **ISADES 2025 (International Symposium on AI-Driven Engineering Systems)** kapsamında sunulan ve **DergiPark** bünyesinde hakemli olarak yayımlanan akademik çalışmanın kaynak kodlarını ve uygulama prensiplerini içermektedir.

##  Akademik Yayın Künyesi
* **Makale Adı:** Sanayi Fırınlarının Intel x86 Tabanlı Mikroişlemciler ile Yönetilmesinde Yeni Bir Bakış
* **Yayıncı/Platform:** DergiPark / ISADES 2025
* **Yazarlar:** Nedim Kurtuluş ve ark. (Pamukkale Üniversitesi)
* **Kabul Durumu:** Hakemli Onaylı / Sunuldu ve Yayımlandı

##  Projenin Amacı ve Kapsamı
Bu çalışma, endüstriyel fırınların sıcaklık ve zamanlama döngülerini yönetmek için yüksek seviyeli dillerin (C, Python vb.) getirdiği çalışma zamanı yükünü (overhead) ortadan kaldırmayı amaçlar. Doğrudan Intel x86 mimarisi üzerinde, Assembly dili kullanılarak geliştirilen sistem; kritik sanayi uygulamalarında maksimum işlem hızı, minimum bellek kullanımı ve yüksek kararlılık sunmaktadır.

## Teknik Özellikler ve Mimari
* **Mimari:** Intel x86 (IA-32)
* **Dil:** x86 Assembly (ASM)
* **Düzey:** Donanıma En Yakın (Low-Level Programming)
* **Odak Alanları:** * **Register Seviyesi Optimizasyon:** Veri işleme süreçleri doğrudan CPU yazmaçları üzerinden yönetilmiştir.
    * **Kesme (Interrupt) Yönetimi:** Gerçek zamanlı olaylara (acil durdurma, sıcaklık limitleri) anlık yanıt verilmesi sağlanmıştır.
    * **I/O Port Kontrolü:** Sanayi fırınındaki sensör ve aktüatörlerin doğrudan port yönetimi simüle/gerçekleştirilmiştir.

##  Öne Çıkan Başarılar
* **Yüksek Performans:** Algoritmalar, doğrudan makine koduna yakın seviyede optimize edilerek sistem yanıt süreleri (response time) minimize edilmiştir.
* **Akademik Geçerlilik:** Çalışma, sempozyum hakem heyeti tarafından incelenmiş ve teknik başarısı akademik platformda tescillenmiştir.
* **Hibrit Entegrasyon:** Donanım odaklı sistem tasarımı ile modern yazılım optimizasyon teknikleri birleştirilmiştir.

## Proje İçeriği
* Kodun asıl assmebly versiyonu
* Karşılaştırma yaparken kullanılan python muadilli.

---
**Geliştirici:** Nedim Kurtuluş  
**Kurum:** Pamukkale Üniversitesi - Bilgisayar Mühendisliği  
