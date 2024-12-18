#!/bin/bash

# Banner
echo "

                                                  
                  :=-     :=-                     
                 .@@@@#*#@@@@=                    
                 *@@@@@@@@@@@@                    
                .@@@@@@@@@@@@@=                   
                +@@@@@@@@@@@@@@                   
                @@@@@@@@@@@@@@@=                  
                -=+**#####**++=:                  
                                                  
        .:-=+*%#*+=--:::::---=+*%#*+=-:.          
    :+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+.      
    :*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+.      
        :-=++*##%%%@@@@@@@@@@%%%##**+=-.          
         -+#@# .%+===------====%- *@@%*=:         
      =#@@@@@@#::@@@@@+  +@@@@@=.#@@@@@@@@*-      
    =%@@@@@@@@@# .::.      .::. +@@@@@@@@@@%*:    
        .:=+*%@@#.     ..     .*@@@@#+=-.         
            .+@@@@*.  .--:   +@@@@@#:             
           -%@@@@@@@*.     +@@@@@@@%*-            
              :+#@@@@@%::#@@@@@*=:                
                  =#@@@==@@@*:                    
                    :#@**@*.                      
                      =##-                        
                       :.                     
                                                                      

      [Golge Linux Gizlilik Araç Kutusu]      
"

# Dağıtımı tespit et
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME=$NAME
    OS_VERSION=$VERSION
else
    echo "Dağıtım tespiti yapılamadı. Bu betik yalnızca Ubuntu ve Arch Linux için geçerlidir."
    exit 1
fi

# Arch veya Ubuntu olduğuna göre uygun paket yöneticisi seç
if [[ "$OS_NAME" == "Ubuntu"* ]]; then
    PACKAGE_MANAGER="apt"
elif [[ "$OS_NAME" == "Arch Linux"* ]]; then
    PACKAGE_MANAGER="pacman"
else
    echo "Bu betik yalnızca Ubuntu veya Arch Linux üzerinde çalışır."
    exit 1
fi

# Paket yöneticisini güncelle
echo "Paket yöneticisini güncelleniyor..."
if [ "$PACKAGE_MANAGER" == "apt" ]; then
    sudo apt update
    sudo apt install -y git python3 python3-pip
elif [ "$PACKAGE_MANAGER" == "pacman" ]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm git python python-pip
fi

# Araçları klonla
echo "Araçlar Klonlanıyor..."

git clone https://github.com/root0emir/GolgeLinuxKriptografi.git
git clone https://github.com/root0emir/GolgeLinuxIzSilme.git
git clone https://github.com/root0emir/Guvenli_InternetRehberi.git
git clone https://github.com/root0emir/GolgeLinuxBrowser.git
git clone https://github.com/root0emir/IPChanger10SEC.git
git clone https://github.com/root0emir/MITMControl.git

# Bağımlılıkları yükle (Python projeleri için)
echo "Python bağımlılıklarını yükleniyor..."

# GolgeLinuxKriptografi bağımlılıkları
cd GolgeLinuxKriptografi
if [ -f requirements.txt ]; then
  pip3 install -r requirements.txt
else
  echo "GolgeLinuxKriptografi için requirements.txt bulunamadı."
fi
cd ..

# GolgeLinuxIzSilme bağımlılıkları
cd GolgeLinuxIzSilme
if [ -f requirements.txt ]; then
  pip3 install -r requirements.txt
else
  echo "GolgeLinuxIzSilme için requirements.txt bulunamadı."
fi
cd ..

# Guvenli_InternetRehberi bağımlılıkları
cd Guvenli_InternetRehberi
if [ -f requirements.txt ]; then
  pip3 install -r requirements.txt
else
  echo "Guvenli_InternetRehberi için requirements.txt bulunamadı."
fi
cd ..

# GolgeLinuxBrowser bağımlılıkları
cd GolgeLinuxBrowser
if [ -f requirements.txt ]; then
  pip3 install -r requirements.txt
else
  echo "GolgeLinuxBrowser için requirements.txt bulunamadı."
fi
cd ..

# IPChanger10SEC bağımlılıkları
cd IPChanger10SEC
if [ -f requirements.txt ]; then
  pip3 install -r requirements.txt
else
  echo "IPChanger10SEC için requirements.txt bulunamadı."
fi
cd ..

# MITMControl bağımlılıkları
cd MITMControl
if [ -f requirements.txt ]; then
  pip3 install -r requirements.txt
else
  echo "MITMControl için requirements.txt bulunamadı."
fi
cd ..

echo "Kurulum tamamlandı!"

