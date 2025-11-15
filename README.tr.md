# Termux & Ubuntu & Debian'da Ruby & Rails Hızlı Kurulum Scripti

🇹🇷 Türkçe | [🇬🇧 English](README.md)

Termux/Ubuntu ortamı ve Linux/Debian tabanlı sistemler için APT paket yöneticisi kullanarak Ruby ve Rails'i hızlı ve basit bir şekilde kurun.

## Özellikler

- **Tek komutla kurulum**
- Otomatik sudo algılama ve kurulum
- Sistem paket listelerini otomatik günceller
- Ruby'yi tam geliştirme araçlarıyla birlikte kurar
- Daha hızlı kurulumlar için Gem ayarlarını yapılandırır
- Bundler paket yöneticisini kurar
- İsteğe bağlı Rails kurulumu

## Gereksinimler

- **Linux/Debian tabanlı sistem** (Ubuntu, Debian, Linux Mint, Termux, vb.)
- **İnternet bağlantısı**

**Not:** Script otomatik olarak sudo'yu kontrol eder ve gerekirse kurar!

## Hızlı Kurulum (Tek Komut)

Kurulum scriptini doğrudan indirip çalıştırmak için bu tek komutu çalıştırın:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ozbilgic/install-ruby-rails-on-termux-ubuntu-debian/main/install-ruby-rails.sh)
```

Veya wget ile:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/ozbilgic/install-ruby-rails-on-termux-ubuntu-debian/main/install-ruby-rails.sh)
```

## Manuel Kurulum

1. Bu depoyu klonlayın veya indirin:
```bash
git clone https://github.com/ozbilgic/install-ruby-rails-on-termux-ubuntu-debian.git
cd install-ruby-rails-on-termux-ubuntu-debian
```

2. Script'i çalıştırılabilir yapın:
```bash
chmod +x install-ruby-rails.sh
```

3. Kurulumu başlatın:
```bash
./install-ruby-rails.sh
```

## Kurulan Paketler

Script aşağıdaki paketleri kurar:

- **ruby-full** - Eksiksiz Ruby programlama dili
- **build-essential** - Temel derleme araçları
- **libsqlite3-dev** - SQLite veritabanı geliştirme dosyaları
- **nodejs** - JavaScript çalışma zamanı (Rails asset pipeline için gerekli)
- **git** - Versiyon kontrol sistemi
- **curl** - Veri transfer aracı
- **gnupg** - Şifreleme araçları
- **libssl-dev** - SSL/TLS geliştirme dosyaları
- **zlib1g-dev** - Sıkıştırma kütüphanesi
- **libgmp-dev** - Aritmetik kütüphane
- **tzdata** - Termux için standart yerel saat uygulaması
- **bundler** - Ruby bağımlılık yöneticisi
- **rails** - Web uygulama framework'ü (tek komutla modda otomatik, manuel modda isteğe bağlı)

## Kullanım

### Otomatik Kurulum (Tek Komut)
Tek komutla kurulum yöntemi kullanıldığında, Rails sormadan otomatik olarak kurulur.

### Manuel Kurulum
Manuel kurulum sırasında size şu soru sorulacak:

```
Want to install Rails too? (y/n):
```

- Rails kurmak için `y` veya `Y` yazın (3-5 dakika sürer)
- Rails kurulumunu atlamak için `n` veya başka bir tuş yazın

## Kurulum Sonrası

Başarılı kurulumdan sonra şu komutları kullanabilirsiniz:

```bash
ruby -v              # Ruby versiyonunu kontrol et
gem -v               # Gem versiyonunu kontrol et
bundle -v            # Bundler versiyonunu kontrol et
rails -v             # Rails versiyonunu kontrol et (kuruluysa)

gem install <gem>    # Ruby gem kurulumu
rails new uygulamam  # Yeni Rails uygulaması oluştur
```

## Sorun Giderme

**İzin reddedildi hatası:**
```bash
chmod +x install-ruby-rails.sh
```

**Sudo kurulu değil:**
- Script otomatik olarak sudo'yu algılar ve gerekirse kurar
- Eğer sudo'nuz yoksa ve root değilseniz, şunu çalıştırın: `su -c 'apt update && apt install -y sudo'`

**Sudo şifre istemi:**
- Script, yönetici görevleri için kullanıcı şifrenizi gerektirir
- İstendiğinde şifrenizi girin

**Kurulum başarısız oluyor:**
- Sisteminizin güncel olduğundan emin olun: `sudo apt update && sudo apt upgrade`
- İnternet bağlantınızı kontrol edin
- Sudo yetkiniz olduğunu doğrulayın: `sudo -v`

**Tek komutla kurulum başarısız oluyor:**
- `curl` veya `wget`'in kurulu olduğundan emin olun: `sudo apt install curl` veya `sudo apt install wget`
- İnternet bağlantınızı kontrol edin
- GitHub URL'inin doğru olduğunu kontrol edin

## Lisans

MIT License

## Katkıda Bulunma

Bu kurulum script'ini geliştirmek için issue veya pull request gönderebilirsiniz.

---

İyi kodlamalar! 🚀
