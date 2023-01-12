#!/bin/bash

cmds=()
cmds2=()
n=0
d=0
for i in svg w20 w40 w80 w160 w320 w640 w1280 w2560 h20 h24 h40 h60 h80 h120 h240; do
    [ ! -d $i ] && mkdir $i
done
get() {
    cmds+=("dl $1 $2
")
    cmds2+=("resize $2
")
    ((n=n+1))
}
dl() {
    if [ -f svg/$2.svg ]; then
        printf "\rFound \x1b[33m$2\x1b[0m, skipping    "
    else
        curl $1 -o svg/$2.svg -s && 
        printf "\rDownloading \x1b[33m$2\x1b[0m        "
    fi
}
export -f dl
resize() {
    printf "\rConverting \x1b[33m$1\x1b[0m.svg to sizes            "
    for i in 20 40 80 160 320 640 1280 2560; do
        [ ! -f w$i/$1.png ] && inkscape -w $i svg/$1.svg -o w$i/$1.png
    done
    for i in 20 24 40 60 80 120 240; do
        [ ! -f h$i/$1.png ] && inkscape -h $i svg/$1.svg -o h$i/$1.png
    done
}
export -f resize 




# Countries
for i in $(curl https://restcountries.com/v3.1/all -s | jq '.[].cca2' -r | tr '[:upper:]' '[:lower:]'); do
    [ "$i" != "aq" ] && [ "$i" != "mq" ] && [ "$i" != "nu" ] && get https://flagcdn.com/$i.svg $i
done

# Flagcdn Fixes
get https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_the_Territorial_Collectivity_of_Martinique.svg mq
get https://upload.wikimedia.org/wikipedia/commons/f/f8/True_South_Antarctic_Flag.svg aq
get https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_Niue.svg nu

# Argentina
get https://upload.wikimedia.org/wikipedia/commons/f/f5/Bandera_de_la_Ciudad_de_Buenos_Aires.svg ar-c
get https://upload.wikimedia.org/wikipedia/commons/1/15/Bandera_de_la_Provincia_de_Buenos_Aires.svg ar-b
get https://upload.wikimedia.org/wikipedia/commons/7/7b/Bandera_de_la_Provincia_de_Catamarca.svg ar-k
get https://upload.wikimedia.org/wikipedia/commons/3/33/Bandera_de_la_Provincia_del_Chaco.svg ar-h
get https://upload.wikimedia.org/wikipedia/commons/8/88/Bandera_de_la_Provincia_del_Chubut.svg ar-u
get https://upload.wikimedia.org/wikipedia/commons/f/f6/Bandera_de_la_Provincia_de_C%C3%B3rdoba_2014.svg ar-x
get https://upload.wikimedia.org/wikipedia/commons/4/46/Bandera_de_la_Provincia_de_Corrientes.svg ar-w
get https://upload.wikimedia.org/wikipedia/commons/5/5b/Bandera_de_la_Provincia_de_Entre_R%C3%ADos.svg ar-e
get https://upload.wikimedia.org/wikipedia/commons/4/42/Bandera_de_la_Provincia_de_Formosa.svg ar-p
get https://upload.wikimedia.org/wikipedia/commons/c/c9/Bandera_de_la_Provincia_de_Jujuy.svg ar-y
get https://upload.wikimedia.org/wikipedia/commons/8/81/Bandera_de_la_Provincia_de_La_Pampa.svg ar-l
get https://upload.wikimedia.org/wikipedia/commons/6/60/Bandera_de_la_Provincia_de_La_Rioja.svg ar-f
get https://upload.wikimedia.org/wikipedia/commons/7/7c/Bandera_de_la_Provincia_de_Mendoza.svg ar-m
get https://upload.wikimedia.org/wikipedia/commons/c/ce/Bandera_de_la_Provincia_de_Misiones.svg ar-n
get https://upload.wikimedia.org/wikipedia/commons/b/bc/Bandera_de_la_Provincia_de_Neuqu%C3%A9n.svg ar-q
get https://upload.wikimedia.org/wikipedia/commons/5/5d/Bandera_de_la_Provincia_del_R%C3%ADo_Negro.svg ar-r
get https://upload.wikimedia.org/wikipedia/commons/6/6a/Bandera_de_la_Provincia_de_Salta.svg ar-a
get https://upload.wikimedia.org/wikipedia/commons/b/b0/Flag_of_the_San_Juan_Province.svg ar-j
get https://upload.wikimedia.org/wikipedia/commons/0/0e/Bandera_de_la_Provincia_de_San_Luis.svg ar-d
get https://upload.wikimedia.org/wikipedia/commons/4/45/Bandera_de_la_Provincia_de_Santa_Cruz.svg ar-z
get https://upload.wikimedia.org/wikipedia/commons/8/84/Bandera_de_la_Provincia_de_Santa_Fe.svg ar-s
get https://upload.wikimedia.org/wikipedia/commons/0/07/Bandera_de_la_Provincia_de_Santiago_del_Estero.svg ar-g
get https://upload.wikimedia.org/wikipedia/commons/9/94/Bandera_de_la_Provincia_de_Tierra_del_Fuego.svg ar-v
get https://upload.wikimedia.org/wikipedia/commons/c/ce/Bandera_de_la_Provincia_de_Tucum%C3%A1n.svg ar-t

# Australia
get https://upload.wikimedia.org/wikipedia/commons/4/46/Flag_of_Tasmania.svg au-tas
get https://upload.wikimedia.org/wikipedia/commons/f/fd/Flag_of_South_Australia.svg au-sa 
get https://upload.wikimedia.org/wikipedia/commons/b/b7/Flag_of_the_Northern_Territory.svg au-nt 
get https://upload.wikimedia.org/wikipedia/commons/8/8c/Flag_of_the_Australian_Capital_Territory.svg au-act
get https://upload.wikimedia.org/wikipedia/commons/a/a5/Flag_of_Western_Australia.svg au-wa
get https://upload.wikimedia.org/wikipedia/commons/0/08/Flag_of_Victoria_%28Australia%29.svg au-vic 
get https://upload.wikimedia.org/wikipedia/commons/0/04/Flag_of_Queensland.svg au-qld
get https://upload.wikimedia.org/wikipedia/commons/0/00/Flag_of_New_South_Wales.svg au-nsw

# Austria
get https://upload.wikimedia.org/wikipedia/commons/2/29/Flag_of_Burgenland.svg at-1
get https://upload.wikimedia.org/wikipedia/commons/9/9b/Flag_of_Carinthia.svg at-2
get https://upload.wikimedia.org/wikipedia/commons/0/06/Flag_of_Lower_Austria.svg at-3
get https://upload.wikimedia.org/wikipedia/commons/9/97/Flag_of_Tirol_and_Upper_Austria.svg at-4
get https://upload.wikimedia.org/wikipedia/commons/b/bf/Flag_of_Salzburg%2C_Vienna%2C_Vorarlberg.svg at-5
get https://upload.wikimedia.org/wikipedia/commons/e/ed/Flag_of_Styria.svg at-6
get https://upload.wikimedia.org/wikipedia/commons/2/25/Flag_of_Tirol_%28state%29.svg at-7
get https://upload.wikimedia.org/wikipedia/commons/a/a7/Flag_of_Vorarlberg_%28state%29.svg at-8
get https://upload.wikimedia.org/wikipedia/commons/b/bf/Flag_of_Salzburg%2C_Vienna%2C_Vorarlberg.svg at-9

# Andorra
get https://upload.wikimedia.org/wikipedia/commons/6/6a/Flag_of_Andorra_la_Vella.svg ad-07
get https://upload.wikimedia.org/wikipedia/commons/8/87/Flag_of_Canillo.svg ad-02
get https://upload.wikimedia.org/wikipedia/commons/f/f8/Flag_of_Encamp.svg ad-03
get https://upload.wikimedia.org/wikipedia/commons/4/41/Bandera_de_Escaldes-Engordany.svg ad-08
get https://upload.wikimedia.org/wikipedia/commons/b/b9/Flag_of_La_Massana.svg ad-04
get https://upload.wikimedia.org/wikipedia/commons/5/5e/Flag_of_Ordino.svg ad-05
get https://upload.wikimedia.org/wikipedia/commons/0/02/Bandera_de_San_Juli%C3%A1n_de_Loria.svg ad-06

# Canada
get https://upload.wikimedia.org/wikipedia/commons/f/f5/Flag_of_Alberta.svg ca-ab
get https://upload.wikimedia.org/wikipedia/commons/b/b8/Flag_of_British_Columbia.svg ca-bc
get https://upload.wikimedia.org/wikipedia/commons/c/c4/Flag_of_Manitoba.svg ca-mb
get https://upload.wikimedia.org/wikipedia/commons/f/fb/Flag_of_New_Brunswick.svg ca-nb
get https://upload.wikimedia.org/wikipedia/commons/d/dd/Flag_of_Newfoundland_and_Labrador.svg ca-nl
get https://upload.wikimedia.org/wikipedia/commons/9/9a/Nova_Scotia_flag.svg ca-ns
get https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Ontario.svg ca-on
get https://upload.wikimedia.org/wikipedia/commons/d/d7/Flag_of_Prince_Edward_Island.svg ca-pe
get https://upload.wikimedia.org/wikipedia/commons/5/5f/Flag_of_Quebec.svg ca-qc
get https://upload.wikimedia.org/wikipedia/commons/b/bb/Flag_of_Saskatchewan.svg ca-sk
get https://upload.wikimedia.org/wikipedia/commons/c/c1/Flag_of_the_Northwest_Territories.svg ca-nt
get https://upload.wikimedia.org/wikipedia/commons/9/90/Flag_of_Nunavut.svg ca-nu
get https://upload.wikimedia.org/wikipedia/commons/6/69/Flag_of_Yukon.svg ca-yt

# Comoros
get https://upload.wikimedia.org/wikipedia/commons/3/33/Flag_of_Grande_Comore.svg km-g
get https://upload.wikimedia.org/wikipedia/commons/a/a6/Flag_of_Anjouan_%28official%29.svg km-a
get https://upload.wikimedia.org/wikipedia/commons/c/c2/Flag_of_Moh%C3%A9li_%28official%29.svg km-m

# Federated States of Micronesia
get https://upload.wikimedia.org/wikipedia/commons/5/55/Flag_of_Chuuk.svg fm-trk
get https://upload.wikimedia.org/wikipedia/commons/2/23/Flag_of_Kosrae.svg fm-ksa
get https://upload.wikimedia.org/wikipedia/commons/c/ce/Flag_of_Pohnpei.svg fm-pni
get https://upload.wikimedia.org/wikipedia/commons/2/2c/Flag_of_Yap.svg fm-yap

# Greece
get https://upload.wikimedia.org/wikipedia/commons/4/43/Flag_of_Cretan_State.svg gr-m
#     https://en.wikipedia.org/wiki/ISO_3166-2:GR TODO: add these

# Liechtenstein
get https://upload.wikimedia.org/wikipedia/commons/e/e0/Flag_of_Balzers_Liechtenstein-1.svg li-01
get https://upload.wikimedia.org/wikipedia/commons/5/52/Flag_of_Eschen_Liechtenstein-1.svg li-02
get https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Gamprin_Liechtenstein-1.svg li-03
get https://upload.wikimedia.org/wikipedia/commons/0/04/Flag_of_Mauren_Liechtenstein-1.svg li-04
get https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Planken_Liechtenstein-1.svg li-05
get https://upload.wikimedia.org/wikipedia/commons/3/3d/Flag_of_Ruggell_Liechtenstein-1.svg li-06
get https://upload.wikimedia.org/wikipedia/commons/6/65/Flag_of_Schaan_Liechtenstein-1.svg li-07
get https://upload.wikimedia.org/wikipedia/commons/e/e2/Flag_of_Schellenberg_Liechtenstein-1.svg li-08
get https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_Triesen_Liechtenstein-1.svg li-09
get https://upload.wikimedia.org/wikipedia/commons/4/4f/Flag_of_Triesenberg_Liechtenstein-1.svg li-10
get https://upload.wikimedia.org/wikipedia/commons/4/43/Flag_of_Vaduz_Liechtenstein-1.svg li-11

# Mauritius 
get https://upload.wikimedia.org/wikipedia/commons/3/31/Flag_of_Port_Louis%2C_Mauritius.svg mu-pl

# Mexico
get https://upload.wikimedia.org/wikipedia/commons/9/9c/Flag_of_Baja_California_Sur.svg mx-bcs
get https://upload.wikimedia.org/wikipedia/commons/7/70/Flag_of_Durango.svg mx-dur
get https://upload.wikimedia.org/wikipedia/commons/b/b8/Flag_of_Guerrero.svg mx-gro
get https://upload.wikimedia.org/wikipedia/commons/2/2b/Flag_of_Jalisco.svg mx-jal
get https://upload.wikimedia.org/wikipedia/commons/1/18/Flag_of_Queretaro.svg mx-que
get https://upload.wikimedia.org/wikipedia/commons/a/a0/Flag_of_Quintana_Roo.svg mx-roo
get https://upload.wikimedia.org/wikipedia/commons/2/26/Flag_of_Tlaxcala.svg mx-tla

# Netherlands
get https://upload.wikimedia.org/wikipedia/commons/1/1c/Flag_of_Drenthe.svg nl-dr
get https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Flevoland.svg nl-fl
get https://upload.wikimedia.org/wikipedia/commons/b/b1/Flag_of_Gelderland.svg nl-ge
get https://upload.wikimedia.org/wikipedia/commons/e/e6/Flag_of_Groningen.svg nl-gr
get https://upload.wikimedia.org/wikipedia/commons/d/d1/Flag_of_Limburg_%28Netherlands%29.svg nl-li
get https://upload.wikimedia.org/wikipedia/commons/a/a2/North_Brabant-Flag.svg nl-nb
get https://upload.wikimedia.org/wikipedia/commons/5/51/Flag_of_North_Holland.svg nl-nh
get https://upload.wikimedia.org/wikipedia/commons/f/f8/Flag_of_Overijssel.svg nl-ov
get https://upload.wikimedia.org/wikipedia/commons/4/4b/Utrecht_%28province%29-Flag.svg nl-ut
get https://upload.wikimedia.org/wikipedia/commons/5/54/Flag_of_Zeeland.svg nl-ze

get https://upload.wikimedia.org/wikipedia/commons/5/5a/Flag_of_Saba.svg bq-sa
get https://upload.wikimedia.org/wikipedia/commons/0/08/Flag_of_Sint_Eustatius.svg bq-se 

# Papua New Guinea
get https://upload.wikimedia.org/wikipedia/commons/e/e4/Flag_of_Bougainville.svg pg-nsb

# Portugal
get https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_Madeira.svg pt-30
get https://upload.wikimedia.org/wikipedia/commons/6/6c/Flag_of_the_Azores.svg pt-20

# Russia 
get https://upload.wikimedia.org/wikipedia/commons/1/16/Flag_of_Adygea.svg ru-ad
get https://upload.wikimedia.org/wikipedia/commons/f/ff/Flag_of_Altai_Republic.svg ru-al
get https://upload.wikimedia.org/wikipedia/commons/3/3d/Flag_of_Bashkortostan.svg ru-ba
get https://upload.wikimedia.org/wikipedia/commons/6/68/Flag_of_Buryatia.svg ru-bu
get https://upload.wikimedia.org/wikipedia/commons/1/13/Flag_of_the_Chechen_Republic.svg ru-ce
get https://upload.wikimedia.org/wikipedia/commons/d/d7/Flag_of_Chuvashia.svg ru-cu
get https://upload.wikimedia.org/wikipedia/commons/c/c3/Flag_of_Dagestan.svg ru-da
get https://upload.wikimedia.org/wikipedia/commons/0/00/Flag_of_Ingushetia.svg ru-in
get https://upload.wikimedia.org/wikipedia/commons/d/d8/Flag_of_Kabardino-Balkaria.svg ru-kb
get https://upload.wikimedia.org/wikipedia/commons/9/9f/Flag_of_Kalmykia.svg ru-kl
get https://upload.wikimedia.org/wikipedia/commons/5/59/Flag_of_Karachay-Cherkessia.svg ru-kc
get https://upload.wikimedia.org/wikipedia/commons/6/69/Flag_of_Karelia.svg ru-kr
get https://upload.wikimedia.org/wikipedia/commons/e/ec/Flag_of_Khakassia.svg ru-kk
get https://upload.wikimedia.org/wikipedia/commons/5/54/Flag_of_Komi.svg ru-ko
get https://upload.wikimedia.org/wikipedia/commons/a/a7/Flag_of_Mari_El.svg ru-me
get https://upload.wikimedia.org/wikipedia/commons/2/2f/Flag_of_Mordovia.svg ru-mo
get https://upload.wikimedia.org/wikipedia/commons/e/eb/Flag_of_Sakha.svg ru-sa
get https://upload.wikimedia.org/wikipedia/commons/1/1c/Flag_of_North_Ossetia.svg ru-se
get https://upload.wikimedia.org/wikipedia/commons/2/28/Flag_of_Tatarstan.svg ru-ta
get https://upload.wikimedia.org/wikipedia/commons/7/77/Flag_of_Tuva.svg ru-ty
get https://upload.wikimedia.org/wikipedia/commons/c/c7/Flag_of_Udmurtia.svg ru-ud
get https://upload.wikimedia.org/wikipedia/commons/4/4b/Flag_of_Altai_Krai.svg ru-alt
get https://upload.wikimedia.org/wikipedia/commons/a/a7/Flag_of_Kamchatka_Krai.svg ru-kam
get https://upload.wikimedia.org/wikipedia/commons/4/4f/Flag_of_Khabarovsk_Krai.svg ru-kha
get https://upload.wikimedia.org/wikipedia/commons/a/a7/Flag_of_Krasnodar_Krai.svg ru-kda
get https://upload.wikimedia.org/wikipedia/commons/2/2d/Flag_of_Krasnoyarsk_Krai.svg ru-kya
get https://upload.wikimedia.org/wikipedia/commons/b/b5/Flag_of_Perm_Krai.svg ru-per
get https://upload.wikimedia.org/wikipedia/commons/3/38/Flag_of_Primorsky_Krai.svg ru-pri
get https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Stavropol_Krai.svg ru-sta
get https://upload.wikimedia.org/wikipedia/commons/b/b8/Flag_of_Zabaykalsky_Krai.svg ru-zab
get https://upload.wikimedia.org/wikipedia/commons/1/16/Flag_of_Arkhangelsk_Oblast.svg ru-ark
get https://upload.wikimedia.org/wikipedia/commons/8/87/Flag_of_Astrakhan_Oblast.svg ru-ast
get https://upload.wikimedia.org/wikipedia/commons/b/b8/New_Flag_of_Belgorod_Oblast.svg ru-bel
get https://upload.wikimedia.org/wikipedia/commons/2/2b/Flag_of_Bryansk_Oblast.svg ru-bry
get https://upload.wikimedia.org/wikipedia/commons/c/ce/Flag_of_Chelyabinsk_Oblast.svg ru-che
get https://upload.wikimedia.org/wikipedia/commons/1/14/Flag_of_Irkutsk_Oblast.svg ru-irk
get https://upload.wikimedia.org/wikipedia/commons/5/5b/Flag_of_Ivanovo_Oblast.svg ru-iva
get https://upload.wikimedia.org/wikipedia/commons/e/e4/Flag_of_Kaliningrad_Oblast.svg ru-kgd
get https://upload.wikimedia.org/wikipedia/commons/e/ed/Flag_of_Kaluga_Oblast.svg ru-klu
get https://upload.wikimedia.org/wikipedia/commons/e/e3/Flag_of_Kemerovo_Oblast.svg ru-kem
get https://upload.wikimedia.org/wikipedia/commons/4/41/Flag_of_Kirov_Oblast.svg ru-kir
get https://upload.wikimedia.org/wikipedia/commons/2/2c/Flag_of_Kostroma_Oblast.svg ru-kos
get https://upload.wikimedia.org/wikipedia/commons/9/92/Flag_of_Kurgan_Oblast.svg ru-kgn
get https://upload.wikimedia.org/wikipedia/commons/7/70/Flag_of_Kursk_Oblast.svg ru-krs
get https://upload.wikimedia.org/wikipedia/commons/6/66/Flag_of_Leningrad_Oblast.svg ru-len
get https://upload.wikimedia.org/wikipedia/commons/3/36/Flag_of_Lipetsk_Oblast.svg ru-lip
get https://upload.wikimedia.org/wikipedia/commons/2/29/Flag_of_Magadan_Oblast.svg ru-mag
get https://upload.wikimedia.org/wikipedia/commons/4/48/Flag_of_Moscow_oblast.svg ru-mos
get https://upload.wikimedia.org/wikipedia/commons/3/3b/Flag_of_Murmansk_Oblast.svg ru-mur
get https://upload.wikimedia.org/wikipedia/commons/0/04/Flag_of_Nizhny_Novgorod_Region.svg ru-niz
get https://upload.wikimedia.org/wikipedia/commons/6/68/Flag_of_Novgorod_Oblast.svg ru-ngr
get https://upload.wikimedia.org/wikipedia/commons/3/39/Flag_of_Novosibirsk_oblast.svg ru-nvs
get https://upload.wikimedia.org/wikipedia/commons/6/60/Flag_of_Omsk_Oblast.svg ru-oms
get https://upload.wikimedia.org/wikipedia/commons/d/d6/Flag_of_Orenburg_Oblast.svg ru-ore
get https://upload.wikimedia.org/wikipedia/commons/0/05/Flag_of_Oryol_Oblast.svg ru-orl
get https://upload.wikimedia.org/wikipedia/commons/d/da/Flag_of_Penza_Oblast.svg ru-pnz
get https://upload.wikimedia.org/wikipedia/commons/e/ef/Flag_of_Pskov_Oblast.svg ru-psk
get https://upload.wikimedia.org/wikipedia/commons/d/d9/Flag_of_Rostov_Oblast.svg ru-ros
get https://upload.wikimedia.org/wikipedia/commons/8/8c/Flag_of_Ryazan_Oblast.svg ru-rya
get https://upload.wikimedia.org/wikipedia/commons/5/57/Flag_of_Sakhalin_Oblast.svg ru-sak
get https://upload.wikimedia.org/wikipedia/commons/1/13/Flag_of_Samara_Oblast.svg ru-sam
get https://upload.wikimedia.org/wikipedia/commons/f/f5/Flag_of_Saratov_Oblast.svg ru-sar
get https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_Smolensk_Oblast.svg ru-smo
get https://upload.wikimedia.org/wikipedia/commons/e/ef/Flag_of_Sverdlovsk_Oblast.svg ru-sve
get https://upload.wikimedia.org/wikipedia/commons/3/39/Flag_of_Tambov_Oblast.svg ru-tam
get https://upload.wikimedia.org/wikipedia/commons/5/50/Flag_of_Tomsk_Oblast.svg ru-tom
get https://upload.wikimedia.org/wikipedia/commons/6/69/Flag_of_Tula_Oblast.svg ru-tul
get https://upload.wikimedia.org/wikipedia/commons/6/60/Flag_of_Tver_Oblast.svg ru-tve
get https://upload.wikimedia.org/wikipedia/commons/4/4e/Flag_of_Tyumen_Oblast.svg ru-tyu
get https://upload.wikimedia.org/wikipedia/commons/d/d8/Flag_of_Ulyanovsk_Oblast.svg ru-uly
get https://upload.wikimedia.org/wikipedia/commons/2/2d/Flag_of_Vladimir_Oblast.svg ru-vla
get https://upload.wikimedia.org/wikipedia/commons/3/35/Flag_of_Volgograd_Oblast.svg ru-vgg
get https://upload.wikimedia.org/wikipedia/commons/a/af/Flag_of_Vologda_oblast.svg ru-vlg
get https://upload.wikimedia.org/wikipedia/commons/6/64/Flag_of_Voronezh_Oblast.svg ru-vor
get https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Yaroslavl_Oblast.svg ru-yar
get https://upload.wikimedia.org/wikipedia/commons/0/03/Flag_of_Moscow%2C_Russia.svg ru-mow
get https://upload.wikimedia.org/wikipedia/commons/c/ca/Flag_of_Saint_Petersburg.svg ru-spe
get https://upload.wikimedia.org/wikipedia/commons/0/0e/Flag_of_the_Jewish_Autonomous_Oblast.svg ru-yev
get https://upload.wikimedia.org/wikipedia/commons/a/a0/Flag_of_Chukotka.svg ru-chu
get https://upload.wikimedia.org/wikipedia/commons/7/70/Flag_of_Yugra.svg ru-khm
get https://upload.wikimedia.org/wikipedia/commons/1/15/Flag_of_Nenets_Autonomous_District.svg ru-nen
get https://upload.wikimedia.org/wikipedia/commons/c/c7/Flag_of_Yamal-Nenets_Autonomous_District.svg ru-yan

# South Korea
get https://upload.wikimedia.org/wikipedia/commons/c/ca/Flag_of_Seoul.svg kr-11
get https://upload.wikimedia.org/wikipedia/commons/6/65/Flag_of_Daegu.svg kr-27
get https://upload.wikimedia.org/wikipedia/commons/5/53/Flag_of_Daejeon.svg kr-30
get https://upload.wikimedia.org/wikipedia/commons/5/59/Flag_of_Gwangju.svg kr-29
get https://upload.wikimedia.org/wikipedia/commons/0/0c/Flag_of_Incheon.svg kr-28
get https://upload.wikimedia.org/wikipedia/commons/e/ef/Flag_of_Ulsan.svg kr-31
get https://upload.wikimedia.org/wikipedia/commons/7/7d/Flag_of_North_Chungcheong_Province.svg kr-43
get https://upload.wikimedia.org/wikipedia/commons/1/1c/Flag_of_South_Chungcheong_Province.svg kr-44
get https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Gangwon_Province.svg kr-42
get https://upload.wikimedia.org/wikipedia/commons/3/36/Flag_of_Gyeonggi_Province%2C_South_Korea.svg kr-41
get https://upload.wikimedia.org/wikipedia/commons/e/ef/Flag_of_North_Gyeongsang_Province.svg kr-47
get https://upload.wikimedia.org/wikipedia/commons/a/ae/Flag_of_South_Gyeongsang_Province.svg kr-48
get https://upload.wikimedia.org/wikipedia/commons/2/2a/Flag_of_North_Jeolla_Province.svg kr-45
get https://upload.wikimedia.org/wikipedia/commons/5/58/Flag_of_South_Jeolla_Province.svg kr-46
get https://upload.wikimedia.org/wikipedia/commons/3/35/Flag_of_Jeju.svg kr-49
get https://upload.wikimedia.org/wikipedia/commons/4/45/Flag_of_Sejong_City%2C_South_Korea.svg kr-50

# United Arab Emirates
get https://upload.wikimedia.org/wikipedia/commons/7/7c/Flag_of_Ajman.svg ae-aj
get https://upload.wikimedia.org/wikipedia/commons/d/d8/Flag_of_Abu_Dhabi.svg ae-az
get https://upload.wikimedia.org/wikipedia/commons/c/cb/Flag_of_the_United_Arab_Emirates.svg ae-fu
get https://upload.wikimedia.org/wikipedia/commons/5/5d/Flag_of_Sharjah_and_Ras_Al_Khaimah.svg ae-sh
get https://upload.wikimedia.org/wikipedia/commons/0/07/Flag_of_Dubai.svg ae-du
get https://upload.wikimedia.org/wikipedia/commons/5/5d/Flag_of_Sharjah_and_Ras_Al_Khaimah.svg ae-rk
get https://upload.wikimedia.org/wikipedia/commons/f/fb/Flag_of_Umm_al-Qaiwain.svg ae-uq

# United Kingdom
get https://flagcdn.com/gb-sct.svg gb-sct
get https://flagcdn.com/gb-wls.svg gb-wls
get https://flagcdn.com/gb-eng.svg gb-eng
get https://flagcdn.com/gb-nir.svg gb-nir
get https://upload.wikimedia.org/wikipedia/commons/0/0a/Flag_of_Shetland.svg gb-zet
get https://upload.wikimedia.org/wikipedia/commons/f/fd/Flag_of_the_British_Antarctic_Territory.svg gb-bq
get https://upload.wikimedia.org/wikipedia/commons/8/89/Flag_of_Tristan_da_Cunha.svg sh-ta 
get https://upload.wikimedia.org/wikipedia/commons/6/65/Flag_of_Ascension_Island.svg sh-ac

# United States
for i in "ri" "ga" "nd" "la" "ak" "wa" "nm" "ma" "ut" "ms" "tx" "wv" "nj" "hi" "pa" "sd" "tn" "de" "mo" "fl" "ct" "md" "wy" "ne" "or" "id" "ky" "co" "mn" "ia" "me" "mi" "ks" "az" "sc" "nv" "oh" "va" "in" "ok" "il" "mt" "nh" "ar" "wi" "al" "vt" "nc" "ny" "ca"; do
    get "https://flagcdn.com/us-$i.svg" us-$i
done

get https://upload.wikimedia.org/wikipedia/commons/d/d4/Flag_of_the_District_of_Columbia.svg us-dc
get https://upload.wikimedia.org/wikipedia/commons/2/2a/Flag_of_the_Midway_Islands_%28local%29.svg um-71
get https://upload.wikimedia.org/wikipedia/commons/4/47/Flag_of_Wake_Island.svg um-79
get https://upload.wikimedia.org/wikipedia/commons/e/e5/Flag_of_Johnston_Atoll_%28local%29.svg um-67

# Historical Alpha-2 Codes 
get https://upload.wikimedia.org/wikipedia/commons/a/a9/Flag_of_the_Soviet_Union.svg su
get https://upload.wikimedia.org/wikipedia/commons/6/61/Flag_of_Yugoslavia_%281946-1992%29.svg yu
get https://upload.wikimedia.org/wikipedia/commons/3/3e/Flag_of_Serbia_and_Montenegro_%281992%E2%80%932006%29.svg cs
get https://upload.wikimedia.org/wikipedia/commons/a/a1/Flag_of_East_Germany.svg dd
get https://upload.wikimedia.org/wikipedia/commons/d/db/Flag_of_South_Yemen.svg yd
get https://upload.wikimedia.org/wikipedia/commons/e/eb/Flag_of_the_Netherlands_Antilles_%281959%E2%80%931986%29.svg an

echo "${cmds[@]}" | parallel 
echo
echo "${cmds2[@]}" | parallel
echo
echo "const IDs = \`$(ls svg | sed 's/.svg//')\`.split('\n');
" > autogenerated.js
