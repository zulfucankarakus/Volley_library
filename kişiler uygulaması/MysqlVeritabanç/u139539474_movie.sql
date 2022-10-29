-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 29 Kas 2018, 12:16:31
-- Sunucu sürümü: 10.2.16-MariaDB
-- PHP Sürümü: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `u139539474_movie`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bayraklar`
--

CREATE TABLE `bayraklar` (
  `bayrak_id` int(9) DEFAULT NULL,
  `bayrak_ad` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bayrak_resim` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `bayraklar`
--

INSERT INTO `bayraklar` (`bayrak_id`, `bayrak_ad`, `bayrak_resim`) VALUES
(1, 'Türkiye', 'turkiye'),
(2, 'Almanya', 'almanya'),
(3, 'İtalya', 'italya'),
(4, 'Fransa', 'fransa'),
(5, 'Hollanda', 'hollanda'),
(6, 'İspanya', 'ispanya'),
(7, 'Slovenya', 'slovenya'),
(8, 'Slovakya', 'slovakya'),
(9, 'Estonya', 'estonya'),
(10, 'Rusya', 'rusya'),
(11, 'Bulgaristan', 'bulgaristan'),
(12, 'Romanya', 'romanya'),
(13, 'Norveç', 'norvec'),
(14, 'Yunanistan', 'yunanistan'),
(15, 'Bosna Hersek', 'bosnahersek');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deneme`
--

CREATE TABLE `deneme` (
  `deneme_id` int(11) NOT NULL,
  `deneme_ad` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `deneme_boy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deneme2`
--

CREATE TABLE `deneme2` (
  `deneme_id` int(11) NOT NULL,
  `deneme_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `deneme2`
--

INSERT INTO `deneme2` (`deneme_id`, `deneme_ad`) VALUES
(1, 'merhaba'),
(2, 'nasılsın');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `filmler`
--

CREATE TABLE `filmler` (
  `film_id` int(11) NOT NULL,
  `film_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `film_yil` int(11) NOT NULL,
  `film_resim` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `yonetmen_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `filmler`
--

INSERT INTO `filmler` (`film_id`, `film_ad`, `film_yil`, `film_resim`, `kategori_id`, `yonetmen_id`) VALUES
(1, 'Interstellar', 2015, 'interstellar.png', 4, 1),
(2, 'Inception', 2010, 'inception.png', 4, 1),
(3, 'The Pianist', 2002, 'thepianist.png', 3, 4),
(4, 'Bir Zamanlar Anadolu\'da', 2011, 'birzamanlaranadoluda.png', 3, 3),
(5, 'The Hateful Eight', 2015, 'thehatefuleight.png', 1, 2),
(18, 'Django', 2013, 'django.png', 1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_ad`) VALUES
(1, 'Aksiyon'),
(3, 'Drama'),
(4, 'Bilim Kurgu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kelimeler`
--

CREATE TABLE `kelimeler` (
  `kelime_id` int(9) DEFAULT NULL,
  `ingilizce` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `turkce` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `kelimeler`
--

INSERT INTO `kelimeler` (`kelime_id`, `ingilizce`, `turkce`) VALUES
(1, 'apple', 'elma'),
(2, 'door', 'kapı'),
(3, 'pencil', 'kalem'),
(4, 'window', 'pencere'),
(5, 'table', 'masa'),
(6, 'chair', 'sandalye'),
(7, 'lock', 'kilit'),
(8, 'box', 'kutu'),
(9, 'night', 'gece'),
(10, 'day', 'gün'),
(11, 'morning', 'sabah'),
(12, 'cable', 'kablo'),
(13, 'room', 'oda'),
(14, 'phone', 'telefon'),
(15, 'sun', 'güneş'),
(16, 'moon', 'ay'),
(17, 'world', 'dünya'),
(18, 'book', 'kitap'),
(19, 'light', 'ışık'),
(20, 'red', 'kırmızı'),
(21, 'green', 'yeşil'),
(22, 'grey', 'gri'),
(23, 'yellow', 'sarı'),
(24, 'home', 'ev'),
(25, 'garden', 'bahçe'),
(26, 'kitchen', 'mutfak'),
(27, 'breakfast', 'kahvaltı'),
(28, 'dinner', 'akşam yemeği'),
(29, 'word', 'kelime'),
(30, 'school', 'okul'),
(31, 'doctor', 'doktor'),
(32, 'order', 'sipariş'),
(33, 'lesson', 'ders'),
(34, 'page', 'sayfa'),
(35, 'city', 'şehir'),
(36, 'country', 'ülke'),
(37, 'flag', 'bayrak'),
(38, 'homework', 'ödev'),
(39, 'teacher', 'öğretmen'),
(40, 'week', 'hafta');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kisiler`
--

CREATE TABLE `kisiler` (
  `kisi_id` int(11) NOT NULL,
  `kisi_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kisi_tel` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `kisiler`
--

INSERT INTO `kisiler` (`kisi_id`, `kisi_ad`, `kisi_tel`) VALUES
(54, 'Abuzer Kadayıf 3', '0909090909'),
(55, 'Çiçek abbasx', '1234679555'),
(56, 'ahmet ahmet aga ', '888888'),
(57, 'ahmet aga', '48754'),
(58, 'yeni kişi', '123789'),
(59, 'merhaba', 'Tel213123214'),
(61, 'Neeee', '036692254');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notlar`
--

CREATE TABLE `notlar` (
  `not_id` int(11) NOT NULL,
  `ders_adi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `not1` int(10) NOT NULL,
  `not2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `notlar`
--

INSERT INTO `notlar` (`not_id`, `ders_adi`, `not1`, `not2`) VALUES
(1, 'Tarih', 80, 100),
(2, 'Kimya', 90, 65),
(7, 'Biyoloji', 90, 90),
(8, 'Beden', 100, 97),
(10, 'Trafik', 70, 90);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `siparis_id` int(11) NOT NULL,
  `siparis_adet` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`siparis_id`, `siparis_adet`, `urun_id`) VALUES
(1, 2, 2),
(2, 5, 11);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ukategoriler`
--

CREATE TABLE `ukategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `ukategoriler`
--

INSERT INTO `ukategoriler` (`kategori_id`, `kategori_ad`) VALUES
(1, 'Yiyecekler'),
(2, 'Tatlılar'),
(3, 'İçecekler');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(11) NOT NULL,
  `urun_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `urun_resim` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `urun_fiyat` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `urun_ad`, `urun_resim`, `urun_fiyat`, `kategori_id`) VALUES
(1, 'Tiramisu', 'tiramisu', 15, 2),
(2, 'Baklava', 'baklava', 17, 2),
(3, 'Sütlaç', 'sutlac', 10, 2),
(4, 'Kadayıf', 'kadayif', 11, 2),
(5, 'Izgara Tavuk', 'izgaratavuk', 15, 1),
(6, 'Izgara Somon', 'izgarasomon', 15, 1),
(7, 'Ayran', 'ayran', 3, 3),
(8, 'Pizza', 'pizza', 18, 1),
(9, 'Makarna', 'makarna', 16, 1),
(10, 'Lazanya', 'lazanya', 19, 1),
(11, 'Izgara Köfte', 'izgarakofte', 15, 1),
(12, 'Su', 'su', 2, 3),
(13, 'Kahve', 'kahve', 9, 3),
(14, 'Fanta', 'fanta', 5, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetmenler`
--

CREATE TABLE `yonetmenler` (
  `yonetmen_id` int(11) NOT NULL,
  `yonetmen_ad` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `yonetmenler`
--

INSERT INTO `yonetmenler` (`yonetmen_id`, `yonetmen_ad`) VALUES
(1, 'Christopher Nolan'),
(2, 'Quentin Tarantino'),
(3, 'Nuri Bilge Ceylan'),
(4, 'Roman Polanski');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `deneme`
--
ALTER TABLE `deneme`
  ADD PRIMARY KEY (`deneme_id`);

--
-- Tablo için indeksler `deneme2`
--
ALTER TABLE `deneme2`
  ADD PRIMARY KEY (`deneme_id`);

--
-- Tablo için indeksler `filmler`
--
ALTER TABLE `filmler`
  ADD PRIMARY KEY (`film_id`),
  ADD KEY `fk_yonetmen` (`yonetmen_id`),
  ADD KEY `fk_kategori` (`kategori_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kisiler`
--
ALTER TABLE `kisiler`
  ADD PRIMARY KEY (`kisi_id`);

--
-- Tablo için indeksler `notlar`
--
ALTER TABLE `notlar`
  ADD PRIMARY KEY (`not_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`siparis_id`),
  ADD KEY `fk_siparisler_urunler` (`urun_id`);

--
-- Tablo için indeksler `ukategoriler`
--
ALTER TABLE `ukategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`),
  ADD KEY `fk_ukategori_urunler` (`kategori_id`);

--
-- Tablo için indeksler `yonetmenler`
--
ALTER TABLE `yonetmenler`
  ADD PRIMARY KEY (`yonetmen_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `deneme`
--
ALTER TABLE `deneme`
  MODIFY `deneme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `deneme2`
--
ALTER TABLE `deneme2`
  MODIFY `deneme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `filmler`
--
ALTER TABLE `filmler`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `kisiler`
--
ALTER TABLE `kisiler`
  MODIFY `kisi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Tablo için AUTO_INCREMENT değeri `notlar`
--
ALTER TABLE `notlar`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `ukategoriler`
--
ALTER TABLE `ukategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `yonetmenler`
--
ALTER TABLE `yonetmenler`
  MODIFY `yonetmen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `fk_siparisler_urunler` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`);

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `fk_ukategori_urunler` FOREIGN KEY (`kategori_id`) REFERENCES `ukategoriler` (`kategori_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
