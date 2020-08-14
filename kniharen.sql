-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: mysql57.websupport.sk:3311
-- Čas generovania: Pi 24.Júl 2020, 14:20
-- Verzia serveru: 5.7.25-28-log
-- Verzia PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `kniharen`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `authors`
--

CREATE TABLE `authors` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nation_id` int(10) UNSIGNED DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `death_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `authors`
--

INSERT INTO `authors` (`id`, `first_name`, `middle_name`, `last_name`, `real_name`, `nation_id`, `birth_date`, `birth_place`, `death_date`, `death_place`, `info`, `photo`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ayn', NULL, 'Rand', 'Alisa Zinovievna Rozenbaumová', 99, '1905-02-02', 'Petrohrad, Rusko', '1981-03-06', 'New York, USA', 'Ayn Randová (vyslov: [ajn rendová], rod. Alisa Zinovievna Rozenbaumová, rus. Алиса Зиновьевна Розенбаум; * 2. február 1905, Petrohrad – † 6. marec 1982, New York) bola vplyvná americká spisovateľka a filozofka 20. storočia.\r\n\r\nBola zakladateľkou kompletného a konzistentného filozofického systému, ktorý nazvala \"Objektivizmus\". K najvplyvnejším dielam Ayn Randovej patria novely The Fountainhead (Zdroj) (1943) a Atlas Shrugged (Atlas pokrčil plecami) (1957). Jej tvorba zdôrazňuje koncepty individualizmu, egoizmu, racionalizmu a kapitalizmu. Typickým hrdinom jej románov je človek, ktorého schopnosti a nezávislosť vzbudzujú u ostatných dešpekt, napriek tomu sa však vytrvalo snaží dosiahnuť svoje hodnoty.\r\n\r\nRandová verila v to, že\r\n1. človek si musí zvoliť svoje hodnoty a konanie pomocou rozumu, zdôvodnenia.\r\n2. jedinec má právo žiť pre svoj vlastný osoh, neobetovať sa pre iných a ani iní pre neho.\r\n3. nikto nemá právo vnucovať hodnoty iným fyzickým násilím.', '1bb0ec86-861a-4bca-ad1e-0e4630d10a49.jpg', 'ayn-rand', 1, '2017-07-19 16:46:29', '2018-10-09 02:55:07'),
(2, 'Erich Maria', '', 'Remarque', '', 41, '1898-06-22', 'Osnabrück, Nemecká ríša', '1970-09-25', '', 'Erich Maria Remarque, vlastným menom Erich Paul Remark bol nemecko-švajčiarsky prozaik a dramatik. Úspech E. M. Remarqua je založený na tvorbe napínavého deja, na účinnej charakterizácii osôb a nekompromisnom antifašistickom, antimilitaristickom a humanistickom postoji.\r\nJeho tvorba bola ovplyvnená Jackom Londonom, Ernestom Hemingwayom a nórskym spisovateľom Knutom Hamsunom, ktorý ale na rozdiel od Remarqua sympatizoval s fašistickým hnutím v Nórsku. Diela Remarquea sa vyznačujú silným humanizmom a protifašistickou a spoločensko-kritickou tématikou. Hrdinovia jeho diel sú vždy nejakým spôsobom zrazení k zemi a stratení. Väčšinou ide o mladých ľudí, čo si nedokážu pod vplyvom vonkajšej determinácie (vojny) nájsť miesto a uplatnenie v živote. Využitím podrobnej charakteristiky postáv, prvkov expresionizmu, naturalistických opisov scén na fronte, ale i drsných slov, dodáva autor celému dielu osobité kúzlo. Jeho vrcholným dielom je sugestívne napísaný román Na západe nič nové.\r\n', 'b51bebc8-e029-4a40-857b-31277a3fef21.jpg', 'erich-maria-remarque', 1, '2017-07-19 17:03:29', '2017-10-15 08:44:20'),
(3, 'Dan', 'Jay', 'Millman', '', 125, '1946-02-22', 'Los Angeles, California', NULL, '', '', 'af5d9f1f-dc42-4df4-be45-60b838f23445.jpg', 'dan-millman', 1, '2017-07-20 08:17:52', '2017-07-20 08:17:52'),
(4, 'Ernest', 'Miller', 'Hemingway', '', 125, '1899-07-21', 'Oak Park, Illinois, USA', '1961-07-02', 'Ketchum, Idaho, USA', 'Ernest Miller Hemingway (* 21. júl 1899, Oak Park, Illinois – † 2. júl 1961, Ketchum, Idaho) bol americký spisovateľ, nositeľ Nobelovej ceny (1954) a Pulitzerovej ceny (1953). Je považovaný za spisovateľa Stratenej generácie a za jedného z najdôležitejších autorov amerického realizmu. Bol novinárom a vojnovým korešpondentom.\r\nOd januára 1916 prispieval reportážami do školského časopisu a v školskom almanachu sa objavovali jeho prvé poviedky; jedna sa zaoberala Indiánmi a druhá bola z boxerského prostredia. Za novelu Starec a more bol v roku 1954 odmenený Nobelovou cenou. Práve v súvislosti s touto novelou ho kritika začala považovať za najväčšiu postavu americkej literatúry prvej polovice 20. storočia. Na vrchole slávy sa Hemingwayova tvorba skončila.', '5e918535-83af-4c3a-9d1e-b55331281761.jpg', 'ernest-hemingway', 1, '2017-07-20 15:53:59', '2017-07-20 15:53:59'),
(5, 'Joanne', '', 'Rowlingová ', '', 36, '1965-07-31', 'Yate, Gloucestershire, Anglicko', NULL, '', 'J. K. Rowlingová sa narodila v Chipping Sodbury, Gloucestershire, Spojené kráľovstvo v roku 1965. Spolu s matkou, otcom a mladšou sestrou Dianou sa presťahovali do Winterbourne, Bristol a potom do Tutshill blízko mesta Chepstow. Navštevovala strednú školu vo Wyedean Comprehensive, kde už vtedy rozprávala príbehy svojim priateľom. V roku 1990 jej 45-ročná matka podľahla po desaťročnom boji skleróze multiplex.\r\n\r\nPo štúdiách francúzštiny a literatúry na University of Exeter, s ročným pobytom v Paríži, sa presťahovala do Londýna, aby robila prieskum a pracovala ako bilingválna sekretárka pre Amnesty International. V tomto období, počas jednej štvorhodinovej cesty z Manchestru do Londýna dostala nápad napísať príbeh o mladom chlapcovi navštevujúcom čarodejnícku školu. Kým sa dostala do cieľovej stanice, mala už v svojej hlave postavy a dobrý základ pre knihu Harry Potter a Kameň mudrcov, na ktorej začala pracovať počas obednej prestávky.\r\n\r\nRowlingová sa potom presťahovala do mesta Porto v Portugalsku, aby učila angličtinu ako cudzí jazyk. Tam sa 16. októbra 1992 vydala za portugalského televízneho novinára Jorge Arantesa. Kým sa v roku 1995 rozviedli, mali spolu dievčatko, Jessicu Rowlingovú Arantesovú (* 27. júla 1993).\r\n\r\nV decembri 1994 sa spolu so svojou dcérou presťahovali do blízkosti svojej sestry v Edinburghu. Nezamestnaná a žijúca na podpore dokončila v edinburghskej kaviarni svoj prvý román. (Je rozšírená klebeta, že román písala v kaviarni, aby ušla zo svojho studeného bytu, ale podľa nej samej to nie je pravda).\r\n\r\nZa štvrtý diel série – Harry Potter a Ohnivá čaša jej bola udelená cena Hugo za rok 2001 v kategórii román.\r\n', '4d6c047b-f9c9-4dc1-b620-d56334865188.jpg', 'joanne-rowlingova', 1, '2017-08-04 09:44:20', '2017-08-04 09:44:20'),
(6, 'Paulo', '', 'Coelho', '', 17, '1947-08-24', 'Rio de Janeiro, Brazília', NULL, '', 'Ako sedemročný sa stal žiakom jezuitskej školy svätého Ignáca v Rio de Janeiro. Už tu sa údajne rozhodol, že sa stane spisovateľom. Ako sedemnásťročný bol dvakrát internovaný v psychiatrickej liečebni (poslal ho tam jeho otec, keď mu oznámil, že chce byť spisovateľom), kde sa podrobil opakovanej elektrošokovej terapii.\r\n\r\nPaulo študoval právo, no štúdium neukončil a začal sa venovať divadlu. Následne napísal texty pre úspešnú brazílsku alternatívnu rockovú kapelu a pre komiksový seriál. Najznámejšie sú skladby, ktoré vznikli v spolupráci s Raulom Seixasom Eu nasci há dez mil anos atrás, Gita, Al Capone. Jeho fascinácia spirituálnym svetom sa zrodila už v čase hippies. Za svoje anarchistické aktivity bol uväznený.\r\n\r\nAko dvadsaťšesťročný sa rozhodne \"byť normálny\", zamestná sa v gramofónovej spoločnosti Polygram, ožení sa a presťahuje sa do Londýna. Tu sa začína pomaly venovať literatúre a rodia sa jeho prvotiny.\r\n\r\nV Amsterdame zažije údajne „mystické stretnutie“, na základe ktorého sa vydá na púť do Santiaga de Compostela a stane sa katolíkom. O rok na to (1987) napíše svoju prvú knihu Pútnik – mágov denník (O diário de um mago), kde opíše zážitky na základe práve spomínanej púte. V roku 1988 napísal svoju najúspešnejšiu knihu Alchymista. Jeho prvé dve knihy sú bestsellermi až o pár rokov neskôr, keď vychádza román Brida.\r\n\r\nPotom nasledovali ďalšie knihy, preklady do 56 jazykov a celosvetový úspech. Jeho knihy boli vydané v 150 krajinách. Jeho poslednou knihou je Rukopis z Akkry (2012).\r\n\r\nDosiaľ snáď najvýznamnejším dielom stále ostáva Alchymista (O Alquimista), ktorý sa stal dôležitým literárnym fenoménom XX. storočia. Zaradil sa do výbavy povinného čítania na školách vo Francúzsku, Taliansku, Portugalsku, Brazílii, Taiwane, USA, Veľkej Británie, Španielsku a iných krajinách. Ilustrované vydanie Alchymistu urobil výtvarník Moebius (autor scén filmu Piaty element). Filmárske práva na Alchymistu získala spoločnosť Warner Brothers, ktorá produkciu a réžiu zverila do rúk Laurencovi Fishburnovi. BMG Classics vydalo CD Alchymistova symfónia. Toto dielo bolo inšpiráciou pre mnohé divadelné predstavenia a muzikály.\r\n\r\nPaulo Coelho má vlastný inštitút Instituto Paulo Coelho, ktorý slúži na podporu chudobným deťom v Brazílii.', 'ea4150c4-98bd-4f24-81f1-673402fae0dd.jpg', 'paulo-coelho', 1, '2017-08-04 09:46:43', '2017-08-04 09:46:43'),
(7, 'Haruki', '', 'Murakami', '', 57, '1949-01-12', 'Kjóto, Japonsko', NULL, '', 'Murakami študoval od roku 1968 na univerzite Waseda dejiny divadla. Od roku 1974 do roku 1981 mal Murakami v Tokiu jazzový bar Peter Cat, v osemdesiatych rokoch 20. storočia začal písať, cestoval do Európy, do Talianska a Grécka. V roku 1991 sa stal na Princetonskej univerzite v New Jersey hosťovským docentom, neskôr profesorom. V júli 1993 ho volajú do William Howard Taft University (Santa Ana/CA), od roku 2001 žije zasa v japonskom Oiso.\r\n\r\nUrčujúcou témou jeho románov je stále strata milovaného človeka a jeho márne hľadanie. Často prekračuje hranice medzi science fiction a realitou. Cítiť v ňom japonské korene, je však veľmi ovplyvnený západným svetom. Na Západe je veľmi obľúbený a priznáva sa k tradíciam Kafku a Dostojevského. Prekladal napríklad takých spisovateľov ako F. Scott Fitzgerald, John Irving, Paul Theroux a Raymond Carver.\r\n', '83b13cdc-529c-41fb-b2e9-411de441d56e.jpg', 'haruki-murakami', 1, '2017-08-04 09:50:14', '2017-08-04 09:50:14'),
(8, 'Walt', '', 'Whitman', '', 125, '1819-05-31', 'Huntington, New York, USA', '1892-03-26', 'Camden, New Jersey, USA', 'Walt Whitman bol americký básnik, esejista, novinár a humanista. Už štyri roky po jeho smrti ho mnohí zahraniční pozorovatelia vyhlásili za \"najväčšieho amerického básnika\". Považuje sa za prvého mestského básnika. Tvorí prechod medzi transcendentalizmom a realizmom a oba smery vteľuje do svojho diela. Jeho diela sa preložili do viac ako 25 jazykov. Whitman patrí k najvplyvnejším a najrozporuplnejším básnikom.\r\nJeho diela boli označené prídomkami ako \"drzý šok\" či \" najodvážnejší a najdiskutovanejší príspevok, ktorým kto kedy prispel do americkej literatúry\".\r\n', 'f04b3287-b553-4072-8f4f-1a9367dda616.jpg', 'walt-whitman', 1, '2017-08-04 09:52:50', '2017-08-04 09:52:50'),
(9, 'Dan', '', 'Brown', '', 125, '1964-06-22', 'New Hampshire, USA', NULL, '', 'Dan Brown  je úspešný americký spisovateľ, ktorého celosvetovo preslávil jeho román Da Vinciho kód z roku 2003. Brownove romány sa odohrávajú v časovom rozmedzí 24 hodín a venujú sa témam ako symboly, šifry, tajné spoločnosti, či konšpiračné teórie. Jeho knihy boli preložené do 52 jazykov, a k roku 2012 predaj prekročil hranicu 200 miliónov kusov.\r\n\r\nV štyroch Brownových románoch, Anjeli a démoni, Da Vinciho kód, Stratený symbol a Inferno, ako hlavná postava vystupuje profesor Robert Langdon, hardvardský profesor dejín umenia a kresťanskej symboliky, ktorý je na stope veľkých historických a kresťanských tajomstiev, záhad a nezodpovedaných otázok. Závery týchto diel sú čiastočne kontroverzné a diskutabilné. Tieto romány vzbudili veľký odpor a pohoršenie predovšetkým katolíckej cirkvi. Séria kníh s prof. Robertom Langdonom sú Da Vinciho Kód Anieli a Demony a Inferno a ďalšie\r\n', 'f4d22e10-5175-4217-bdeb-bf0b2e84cceb.jpg', 'dan-brown', 1, '2017-08-04 09:54:57', '2017-08-04 09:54:57'),
(10, 'Francis', 'Scott', 'Fitzgerald', '', 125, '1894-09-24', 'Saint Paul, Minnesota, USA', '1940-12-21', 'Hollywood, Kalifornia, USA', 'Francis Scott Fitzgerald je jedným z najvýznamnejších amerických spisovateľov. Narodil sa 24. septembra 1896 v meste St. Paul v Minnesote. Samotné meno Francis Scott Key Fitzgerald je odrazom dobrého pôvodu jeho rodiny. Obaja jeho rodičia boli katolíci. Jeho otec, oddaný starému juhu a jeho hodnotám, pochádzal z Marylandu a jeho matka, Marry Mc.Quillan bola dcérou írskeho imigranta, ktorý bol obchodníkom. Otec Edward nebol veľmi úspešný vo svojom podnikaní v St. Paul, tak sa neskôr presťahovali do New Yorku, kde sa stal obchodníkom pre spoločnosť Procter and Gamble.\r\n\r\nKeď mal Fitzgerald 12 rokov, jeho otca prepustili zo zamestnania a s celou rodinou sa vrátili späť do St. Paul, kde žili z dedičstva jeho matky Marry. Počas štúdia na akadémii, keď mal 13 rokov, napísal svoju prvú prácu. Bol to detektívny román, ktorý bol uverejnený v školských novinách. Scott však nebol veľmi dobrým študentom, a tak ho rodičia poslali na katolícku prípravnú školu v New Jersey. V roku 1913 nastúpil na Priceton University. Tu sa venoval písaniu muzikálových textov a scenárov pre školský muzikálový klub a pravidelne prispieval do časopisov ako Princeton Tiger a Nassau.\r\n\r\nV roku 1915 sa zoznámil s Ginevrou King, do ktorej sa bezhlavo zamiloval. Ginevra, ktorá pochádzala z bohatých pomerov, však na jeho dvorenie odpovedala so značným nezáujmom. Láska, ktorá bola neopätovaná práve kvôli rozličnosti sociálnych vrstiev sa stala motívom pre viacero jeho diel. V novembri 1915 odišiel z Princetonu kvôli zdravotným problémom, ale aj slabému študijnému prospechu. Do školy sa neskôr vrátil no neskôr štúdium opäť vzdáva. V roku 1917 vstúpil do armády a bol poverený ako podporučík v pechote. V presvedčení, že vojna znamená smrť napísal román The Romantic Egoist, ktorý neskôr vyšiel pod názvom This Side of Paradise (Táto strana raja).\r\n\r\nV roku 1918 bol prevelený do Camp Sheridan v blízkosti Alabamy. Tam sa zaľúbil do známej krásky Zeldy Sayre, 18-ročnej dcéry sudcu najvyššieho súdu. Neoficiálne sa zasnúbili a Scott neskôr vyhlásil, že „sa zamiloval do víchrice“.[1]\r\n\r\n Zelda Sayre\r\nVojna skončila tesne pred tým, ako mal byť prevelený do zámoria. Po svojom prepustení v roku 1919 odišiel do New Yorku hľadať svoje šťastie. Chcel sa konečne oženiť so Zeldou. Francisovi sa dlhšiu dobu nedarilo nájsť zamestnanie, ktoré by ich uživilo. Zelda stratila trpezlivosť dlhšie čakať kým sa mu začne dariť a zrušila ich zasnúbenie.\r\n\r\nRozhodol sa vrátiť späť do St. Paul, aby prepísal román Táto strana raja. V roku 1919 sa na neho usmialo šťastie a vydavateľstvo schválilo jeho rukopis. Vďaka tomuto románu dňa 26. marca 1920 sa 24-ročný Fitzgerald stal slávnym takmer zo dňa na deň a o týždeň neskôr sa oženil so Zeldou. Začali žiť extravagantným životom mladých celebrít. Herečka Lillian Gish o nich povedala: „Oni neurobili dvadsiate roky, oni boli dvadsiate roky.“ [1] Žili na vysokej nohe, usporadúvali rôzne večierky a ich výdavky postupne presahovali ich príjem. Po hýrivom lete sa Fitzgeraldovci usadili v New Yorku, kde napísal jeho druhý román The Beautiful and Damned (Krásni a prekliati), ktorý získal pozitívnu kritiku a Warner Bros. podľa neho dokonca natočil film. V roku 1921, krátko po tom ako Zelda otehotnela, uskutočnili ich prvý výlet do Európy. Neskôr sa rozhodli vrátiť do St. Paul, aby tam Zelda porodila ich dieťa. Narodila sa im dcéra Frances Scott (Scottie) Fitzgerald.\r\n\r\nV roku 1922 vyšla jeho ďalšia zbierka poviedok pod názvom Tales of the Jazz Age (Poviedky džezového veku ), z ktorej pochádzajú slávne kúsky ako The Diamond As Big As the Ritz (Diamant veľký ako Ritz) alebo šablóna k úspešnému filmu s rovnakým názvom The Curious Case of Benjamin Button (Podivuhodný prípad Benjamina Buttona).\r\n\r\nSituácia vo Fitzgeraldovom živote sa však skomplikovala. Francis čím ďalej viac pil a stal sa z neho alkoholik. Písal len keď bol triezvy. Zelda tiež holdovala alkoholu viac ako bolo vhodné, ale nestala sa alkoholičkou. Alkohol vyvolával časté hádky a spory v ich domácnosti. V tomto čase vznikal námet na jeho román The Great Gatsby (Veľký Gatsby).\r\n\r\nJeho povesť alkoholika spôsobila, že mnohí ho považovali za nezodpovedného spisovateľa a nevedeli čo od neho očakávať. Nikto mu však nemohol odoprieť, že jeho štýl bol jasný, lyrický, pestrý a vtipný. Dokázal čitateľov vtiahnuť do času a miesta deja a „Jazz Age“, doba umenia, zázrakov a hojnosti, s ktorou bol spájaný, sa dokonale odzrkadľovala v mnohých z jeho diel. Hľadajúc pokoj a inšpiráciu, na jar roku 1921 odišiel do Francúzska. V lete roku 1924 napísal svoj najznámejší román The Great Gatsby. Toto dielo ho preslávilo a bolo veľkým pokrokom Fitzgeraldovej techniky.\r\n\r\nChoroba a smrť\r\nFitzgerald bol dlhé roky alkoholikom. Podľa autorky Zeldinho životopisu, Nancy Milford, Fitzgeraldove tvrdenia, že mal tuberkulózu boli len zámienkou na to, aby zakryl svoje problémy s alkoholom. Avšak Fitzgeraldov učenec Matthew J. Bruccoli, tvrdil, že mal pretrvávajúce príznaky tuberkulózy.\r\n\r\n Zeldin a Fitzgeraldov hrob v Rockville, Maryland.\r\nNa konci tridsiatych rokov prekonal dva srdcové infarkty. Nakoniec sa infarkt stal aj príčinou jeho smrti.\r\n\r\nNa Zeldinom a Fitzgeraldovom pomníku je napísaná posledná veta z jeho veľkého románu Veľký Gatsby: \"So we beat on, boats against the current. Borne back ceaselessly into the past.\" (F.S.Fitzgerald, The Great Gatsby). Jedným z ľudí, ktorí prišli na jeho pohreb bola Dorothy Parker, ktorá plakala a neustále mrmlala frázu, ktorá bola vyslovená aj pri pohrebe Jaya Gatsbyho v románe Veľký Gatsby: \"he poor son-of-a-bitch\" (F.S.Fitzgerald, The Great Gatsby).\r\n\r\nNeskôr bolo jeho telo prevezené do Marylandu. Na jeho pohrebe sa zúčastnilo 20 až 30 ľudí, medzi nimi aj jeho dcéra Frances \"Scottie\" Fitzgerald (vtedy 19 ročná) a jeho editor Maxwell Perkins.\r\n\r\nZelda zomrela v roku 1948 pri požiari v Highland psychiatrickej liečebni v Asheville , Severnej Karolíne. Obaja Fitzgeraldovci boli presunutí do rodinnej hrobky v Saint Marie cintoríne , v Rockville , Maryland, v roku 1975.\r\n\r\nFitzgerald zomrel ako 44-ročný, predtým ako stihol dokončiť svoj román Láska k poslednému magnátovi (The Love of the last Tycoon). Jeho rukopis , ktorý zahŕňal rozsiahle poznámky k nepísanej časti románu, bol upravený jeho priateľom, literárnym kritikom Edmundom Wilsonom a publikoval ho v roku 1941 ako The Last Tycoon (Posledný magnát). V roku 1994 bola kniha znova vydaná pod pôvodným názvom Láska k poslednému magnátovi (The Love of the last Tycoon).\r\n', 'bec2d56d-3ee5-491d-abad-47c05715e56e.jpg', 'francis-fitzgerald', 1, '2017-08-04 09:58:21', '2017-08-04 09:58:21'),
(11, 'John', 'Michael', 'Green', NULL, 125, '1977-08-24', 'Indianapolis, Indiana, USA', NULL, NULL, 'John Michael Green je americký spisovateľ, vlogger a tvorca online vyučbových videí.\r\nV roku 2005 získal Michael L. Printz Award za svoju prvotinu Kam zmizla Aljaška. Jeho román Na vine sú hviezdy z januára 2012 sa dostal na zoznam bestsellerov New York Times. V roku 2014 bol zaradený do zoznamu 100 najvplyvnejších ľudí na svete podľa časopisu Time.\r\nJe držiteľom viacerých významných literárnych cien, bol tiež dvakrát finalistom literárnych cien denníka Los Angeles Times. Spolu s bratom Hankom tvorí jednu z najobľúbenejších online videorelácií.\r\nMedzi jeho najväčšie diela patria Kam zmizla Aljaška[3], Na vine sú hviezdy a Papierové miesta. \"Poučka o podstate predvídateľnosti Katherín.\" \"Nech sneží.\" Ďalšie neboli vydané v slovenčine.\r\nDve z jeho kníh, Na vine sú hviezdy a Papierové mestá, boli sfilmované. Sfilmovanie tretej- Kam zmizla Aljaška, sa plánuje na rok 2017.\r\nV súčasnosti žije s manželkou a dvoma deťmi v Indianapolise.', '8346168e-9f95-4d5e-b596-468186e4bba8.jpg', 'john-green', 1, '2017-08-10 15:18:39', '2018-09-04 16:08:25'),
(12, 'Albert', '', 'Camus', '', 39, '1913-11-07', 'Mondovi, Alžírsko', '1960-01-04', 'Villeblevin, Francúzsko', 'Vyrástol v Alžíri v chudobnej rodine. Venoval sa divadlu ako herec, písal do novín, za druhej svetovej vojny bol redaktorom, potom (1944-1946) bol šéfredaktor časopisu Combat (Bitka) v Paríži. Aktívne sa zúčastnil hnutia odporu. Neskôr bol vedúcim pracovníkom vo vydavateľstve Gallimard.', '8e3c062d-ac46-49fe-9c8a-32125ed7898c.jpg', 'albert-camus', 1, '2017-08-10 15:44:07', '2017-08-10 15:44:07'),
(13, 'Stephen', 'Edwin', 'King', '', 125, '1947-10-01', 'Portland, Maine,  U.S.A.', NULL, '', 'Napísal viac ako päťdesiat románov vrátane siedmich pod pseudonymom Richard Bachman, z ktorých sa po celom svete predalo viac ako 350 miliónov výtlačkov (údaj z konca roka 2006), z ktorých mnohé boli adaptované do množstva filmov či komiksov. Takisto napísal takmer 200 poviedok a noviel, ktoré vyšli v deviatich zbierkach. Veľa jeho príbehov sa odohráva v štáte Maine, kde má trvalé bydlisko.\r\nPočas svojej spisovateľskej kariéry bol ocenený cenami „Bram Stoker Award“, „World Fantasy Award“, „British Fantasy Society Awards“, jeho novela The Way Station bola nominovaná na cenu Nebula Award, za poviedku The Man in the Black Suit dostal cenu „O. Henry Award“. V roku 2003 ho „The National Book Foundation“ ocenila medailou za „Distinguished Contribution to American Letters“. Za celoživotný prínos k literatúre a svoje dielo dostal ocenenia, ako sú: „World Fantasy Award for Life Achievement“ (2004), „The Canadian Booksellers Association Lifetime Achievement Award“ (2007) a „The Grand Master Award“ (2007).', '26693e2a-ef98-4bc4-8c62-b2aae415929a.jpg', 'stephen-king', 1, '2017-09-15 17:55:11', '2017-09-15 17:55:11'),
(14, 'Samuel', '', 'Björk', '', 88, NULL, '', NULL, '', 'Samuel Björk je pseudonym nórskeho spisovateľa, dramatika a príležitostného skladateľa, speváka Frode Sander Oieneho. Prvý autorský román s názvom Cestujem sama, získal medzinárodné uznanie a status svetový bestseller. \r\n\r\nFrode Sander Oien je prevažne známy v nórskej umeleckej spoločnosti, keď ako dvadsaťjeden ročný napísal prvú divadelnú hru. Pri zhliadnutí na kariéru Oiena môžeme konštatovať, že je srdcom a dušou umelec. Ako sa sám vyjadruje, tak práca je jeho hobby, ktoré ho napĺňa. Tvorbu Oiena porovnávajú literárni kritici k autorom ako Stieg Larsson alebo Jo Nesbo. \r\n\r\nUmelec – samouk, ktorý vydal doposiaľ šesť štúdiových albumov, päť divadelných hier, býva a pracuje v nórskom Trondheime.', '0c833ec5-0923-497b-afde-72b5a90be9ed.jpg', 'samuel-bjork', 1, '2017-09-16 17:40:44', '2017-09-16 17:40:44'),
(15, 'Ray', 'Douglas', 'Bradbury', '', 125, '1920-08-22', 'Waukegan, Illinois, USA', '2012-06-05', 'Los Angeles, Kalifornia, USA', '', 'e76ec3e8-2fcd-47d4-a9bc-426a28b1012e.jpg', 'ray-bradbury', 1, '2017-10-15 08:32:03', '2017-10-15 08:32:03'),
(16, 'Antoine ', 'Marie Roger ', 'de Saint-Exupéry', '', 39, '1900-06-29', '', '1944-07-31', '', 'bol francúzsky spisovateľ, letec, často je považovaný tiež za filozofa. Medzi jeho najznámejšie diela patria Zem ľudí, Citadela alebo Malý princ.', 'ba24e170-a9bd-4a9b-9806-a6a04d3b8b52.jpg', 'antoine-de-saint-exupery', 1, '2017-10-29 17:42:57', '2017-10-29 17:42:57'),
(17, 'Maxim', '', 'E. Matkin', '', 104, NULL, '', NULL, '', '', NULL, 'maxim-e-matkin', 1, '2017-10-29 18:38:09', '2017-10-29 18:38:09'),
(18, 'Ralf', '', 'Rothmann', '', 41, '1953-05-10', '', NULL, '', 'Nemecký prozaik, básnik a dramatik. Rodák z Porúria sa pôvodne živil ako vodič, kuchár, murár a ošetrovateľ. Témou jeho románov je zväčša osamelosť, drobné rebélie, pokusy vymaniť sa z malomeštiackeho či robotníckeho prostredia. Väčšina z jeho próz má silnú autobiografickú pečať – to je aj dôvod, prečo sa odohrávajú buď v Porúrií alebo v Berlíne, kde autor od roku 1976 žije. Kritici Rothmanna označujú za jeden z najvýraznejších hlasov jeho generácie. Za jeho dielo ho ocenili mnohými renomovanými literárnymi cenami.', '087fafc8-ec5b-4ed5-abd0-96ce6d17783f.jpg', 'ralf-rothmann', 1, '2017-11-01 07:38:33', '2017-11-01 07:38:33'),
(19, 'Nathan', 'Joseph', 'Filer', '', 124, NULL, '', NULL, '', 'Pracoval ako zdravotník na psychiatrickej klinike v Bristole, preto sa mu tak pôsobivo podarilo opísať postavu trpiacu schizofréniou. V súčasnosti sa venuje písaniu a filmovej réžii. Navyše prednáša kreatívne písanie na Spa University v Bathe. Šok z pádu je jeho prvý román, za ktorý dostal mnohé ocenenia, napríklad renomovanú cenu Costa Book of the Year 2013 (pre britských a írskych autorov) a cenu Betty Trask za najlepší debut.', '8e2e349e-2246-448b-b447-ae86db1fab02.jpg', 'nathan-filer', 1, '2017-11-04 06:04:15', '2017-11-04 06:05:41'),
(20, 'Richard', '', 'Bach', '', 125, '1936-06-23', 'Oak Park, Illinois, USA', NULL, '', 'Lietať začal už ako 17-ročný a neskôr istý čas pracoval ako pilot vzdušných síl. Vystriedal rôzne zamestnania a bol dvakrát ženatý. S prvou ženou Bette, s ktorou sa rozviedol v roku 1970, má šesť detí. Jeho syn Jonathan, ktorý je novinárom, vydal knihu o tom, aké to bolo vyrastať bez otca a stretnúť sa s ním až ako študent na strednej škole. Jeho druhou manželkou sa stala herečka Leslie Parrish, s ktorou sa stretol počas nakrúcania filmu Jonathan Livingston Seagull (Čajka Jonathan Livingston). Vzali sa v roku 1981, no ich manželstvo dlho nevydržalo. Richard Bach žije v súčasnosti v meste Stanwood, štát Washington.\r\n\r\nStal sa autorom množstva beletrie i literatúry faktu. Mnohé jeho diela obsahujú filozofiu new age. Väčšina jeho diel obsahuje lietanie, či už skutočné alebo ako filozofickú metaforu a tiež o nich možno povedať, že sú poloautobiografické, pretože na ilustrovanie svojej vlastnej filozofie využíva aktuálne alebo vymyslené udalosti zo svojho života. Najväčší úspech však dosiahol poviedkou Čajka Jonathan Livingston z roku 1972. Kniha obsahuje menej ako 10 000 slov, no napriek tomu sa veľmi rýchlo stala bestsellerom a prekonala všetky rekordy v predajnosti od čias, keď vyšla kniha Odviate vetrom, nakoľko len v roku 1972, kedy kniha vyšla, sa predalo viac než 1 milión výtlačkov. O rok neskôr sa kniha stala námetom pre filmové spracovanie, a soundtrack k filmu vytvoril Neil Diamond. Vzťah s jeho druhou ženou sa stal námetom diela Most cez navždy.', '7a661af2-48ee-4aee-8273-b552fce21eee.gif', 'richard-bach', 1, '2017-11-04 06:21:04', '2017-11-04 06:21:04'),
(21, 'Mitch', '', 'Albom', '', NULL, '1958-05-23', 'Passaic, New Jersey, USA', NULL, '', '', '03f1c360-5f11-413e-8bea-5d10af45870f.jpg', 'mitch-albom', 1, '2017-11-05 10:33:31', '2017-11-05 10:33:31'),
(22, 'Julian', 'Patrick', 'Barnes', '', 124, '1946-01-19', 'Leicester, Spojené kráľovstvo', NULL, '', '', 'eac5c2c6-4949-4613-939e-e19c00037b7b.jpg', 'julian-barnes', 1, '2017-11-05 11:17:59', '2017-11-05 11:17:59'),
(23, 'Stephen', 'William', 'Hawking', NULL, 124, NULL, NULL, NULL, 'Cambridge, Spojené kráľovstvo', NULL, '0HpiKaD1BY3X0aUMSfBUHWdIrYPQLsQOcfAgOmFc.jpg', 'stephen-hawking', 1, '2018-05-28 06:06:31', '2018-06-20 15:20:33'),
(24, 'Jaroslav', NULL, 'Kalfař', NULL, 32, NULL, NULL, NULL, NULL, NULL, 'tg2OOk2t2Wc6fEUc9K1oNicr1cBUlvg1u7lEsFtO.jpg', 'jaroslav-kalfar', 1, '2018-06-02 09:58:14', '2018-06-02 09:58:14'),
(26, 'William', NULL, 'Shakespeare', NULL, 36, NULL, NULL, NULL, NULL, '(* apríl 1564; pokrstený 26. apríla 1564, Stratford-upon-Avon – † 23. apríl 1616, Stratford-upon-Avon) bol významný anglický spisovateľ, dramatik a herec.\r\n\r\nWilliam Shakespeare sa narodil ako tretie z ôsmich detí a najstarší preživší syn. Jeho otec bol v Stratforde považovaný za významného muža. Shakespeare pravdepodobne navštevoval Gymnázium Eduarda VI. v Stratforde. Ako osemnásťročný sa oženil s Anne Hathwayovou. Anne bola dcérou farmára zo Shothery a svadba sa konala neobvykle rýchlo. Dôvodom bolo zrejme Annino tehotenstvo. V roku 1583 sa im totiž narodila dcéra Susanna (pokrstená 27. mája) a v roku 1585 prišli na svet dvojčatá Hamnet a Judith. Shakespearov jediný syn, ktorého meno pripomína aj jedna z jeho najslávnejších hier, Hamlet, však zomrel v mladom veku.\r\n\r\nNie je známe, kedy a prečo sa Shakespeare rozhodol odísť zo Stratfordu do Londýna, ani čo bolo impulzom k jeho londýnskej kariére herca a dramatika. Shakespeare sa stal členom jednej z dvoch najznámejších divadelných skupín v Londýne, a po menej úspešnej kariére herca sa stal populárnym autorom dramatických textov. Zachovalo sa 18 divadelných hier, no Shakespeare ani jednu z nich neautorizoval. Dnešné súborné vydania jeho hier obsahujú 37 až 39 dramatických textov. Okrem toho sa venoval písaniu poém a sonetov. Sonety sú čiastočne adresované tajomnej žene, tzv. čiernej dáme, a čiastočne neznámemu mužovi.\r\n\r\nPosledné roky svojho života Shakespeare strávil v rodnom Stratforde. Zomrel vo veku 52 rokov, 23. apríla (v predpokladaný deň jeho narodenia) v roku 1616. Jeho kolegovia herci a dramatici z Londýna sedem rokov po jeho smrti (1623) publikovali vyše 900-stranové súborné vydanie jeho hier (36 hier) a neskorší vydavatelia do tzv. shakespearovského kánonu pridali ešte jednu, resp. tri ďalšie hry. Vďaka súbornému vydaniu z roku 1623 sa jeho dielo zachovalo do dnešných čias. Shakespeare je pochovaný pred oltárom kostola Holy Trinity Church v mestečku Stratford-upon-Avon. Na stene neďaleko Shakespearovho hrobu je umiestnená jeho busta.\r\n\r\nVraví sa, že Shakespeare si sám napísal i epitaf na svoj pomník:\r\n\"Drahý priateľu, pre Kristove rany, nevykop\r\nnikdy piesok, ktorý skrýva tento hrob.\r\nKto tento hrob zachová, nech Boh ho omilostí,\r\na nech je preklínaný, kto pohne moje kosti.\"', 'tDgP07D7fLv3X6QFQDalLkZ9erxQyaIOkSNwZO8c.jpg', 'william-shakespeare', 2, '2018-06-04 03:44:24', '2018-06-04 03:44:24'),
(27, 'Jerome', 'David', 'Salinger', NULL, NULL, NULL, NULL, NULL, NULL, 'Jerome David Salinger (* 1. január 1919, Manhattan, New York, USA – † 27. január 2010, Cornish, New Hampshire, USA) bol americký prozaik. \r\nJeho najznámejším dielom je román Kto chytá v žite a poviedky o rodine Glassovcov. Ústredným motívom väčšiny Salingerových diel sú problémy dospievania, dosah vojny (u Seymoura Glassa) alebo iných traumatických udalostí (v prípade Holdena Caulfielda) na psychiku mladých mužov a ich vzťah k malým deťom (ako stelesneniu nevinnosti). \r\nSalinger bol známy aj pre svoju samotársku povahu, od roku 1974 neposkytol žiadny rozhovor, neobjavoval sa na verejnosti a od roku 1965 nepublikoval žiadne ďalšie dielo.', 'nYZZQElMftr8B0ZNo3HNM4LpVZuRG6R8eqbOC92L.jpg', 'jerome-salinger', 2, '2018-06-21 06:56:34', '2018-06-21 06:56:34'),
(28, 'Martin', NULL, 'Repa', NULL, 104, NULL, NULL, NULL, NULL, NULL, NULL, 'martin-repa', 2, '2018-06-23 10:09:12', '2018-06-23 10:09:12'),
(29, 'Christie', NULL, 'Golden', NULL, 125, '1963-09-21', NULL, NULL, NULL, NULL, '07uu1tyaK3S4iN20PdBOcGYN7B5qBXTDfeKR0YmX.png', 'christie-golden', 2, '2018-07-03 11:08:19', '2018-07-03 11:08:19'),
(30, 'Erlend', NULL, 'Loe', NULL, 88, '1969-05-24', NULL, NULL, NULL, 'je nórsky spisovateľ. Debutoval v roku 1993 knihou Tatt av Kvinnen. O rok neskôr mu vyšla knižka pre deti Fisken o šoférovi kamiónu Kurtovi. Loeho štýl písania býva označovaný ako naivný, často využíva humor a iróniu.', '1I8a0LLOtjtMdaHanToYG2WRXwU8UeIMYDxsm0x5.jpg', 'erlend-loe', 2, '2018-07-08 14:14:57', '2018-07-08 14:14:57'),
(31, 'Anne-Laure', NULL, 'Bondoux', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anne-laure-bondoux', 2, '2018-07-09 05:26:38', '2018-07-09 05:26:38'),
(32, 'Paul', NULL, 'Johnson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'paul-johnson', 2, '2018-07-09 05:30:09', '2018-07-09 05:30:09'),
(33, 'Miroslav', NULL, 'Válek', NULL, 104, NULL, NULL, NULL, NULL, NULL, 'ChabqPR02TuATairseN7L3KxpiTgAdfAOGoEv2jA.jpg', 'miroslav-valek', 2, '2018-07-09 05:32:47', '2018-07-09 05:32:47'),
(34, 'Giles', NULL, 'Milton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'giles-milton', 2, '2018-07-09 05:34:36', '2018-07-09 05:34:36'),
(35, 'Paolo', NULL, 'Giordano', NULL, 55, NULL, NULL, NULL, NULL, NULL, '3RZN4HLn6o47HKpetX0hEArlDLRXyaJAT7UvLcvd.jpg', 'paolo-giordano', 2, '2018-07-09 05:37:58', '2018-07-09 05:37:58'),
(36, 'Gabriel', NULL, 'Chevallier', NULL, 39, NULL, NULL, NULL, NULL, NULL, 'mlREgNjncP8z6yWgRbj0bUPZ6sIUEvxPyr16sKRf.jpg', 'gabriel-chevallier', 2, '2018-07-09 05:39:47', '2018-07-09 07:00:16'),
(37, 'Anna', 'Marie', 'Franková', 'Annelies Marie Franková', 41, NULL, NULL, NULL, NULL, NULL, '9yAa0g2vuI0b3UgZ7lUkpW4HnT9RBmO8j46Xpi54.jpg', 'anna-frankova', 2, '2018-08-10 03:58:30', '2018-08-10 03:58:30'),
(38, 'Douglas', 'Noël', 'Adams', NULL, NULL, '1952-03-11', 'Cambridge, Spojené kráľovstvo', '2001-05-11', 'Santa Barbara, Kalifornia, USA', 'Douglas Noël Adams bol anglický spisovateľ sci-fi.\r\nJeho rodičia sa rozišli, keď mal päť rokov. Matka bola zdravotná sestra a otec študent teológie. Matka ho vychovávala sama, a tak si už ako stredoškolák privyrábal ako ošetrovateľ v ústave pre duševne chorých, zametač kurínov aj ako asistent pri röntgene. Na strednej škole mal vynikajúce hodnotenie z angličtiny (neskôr slúžil profesorom ako vzorový príklad žiaka), čo mu dopomohlo k štipendiu na štúdiá anglickej literatúry v Cambridge.\r\nBol študentom – bohémom. Patril k hlavným aktérom divadelného diania na škole, ale bol aj dobrým a zábavným spoločníkom. Neil Gaiman, jeho spolupracovník a priateľ, si na spoločné študentské roky spomína ako na zbierku absurdných príhod a skúšku hraníc, kam až sa dá zájsť s provokatívnosťou v témach. Po jednom predstavení vysokoškolskej hry, ktorá sa hrala v divadelnom West Ende v Londýne, sa Adams stretol s Grahamom Chapmanom, členom Monty Pythonovcov. Časom sa s Pytónmi skamarátil a občas spolu aj pracovali. Aj keď Adams vystupoval len v jednej epizóde TV seriálu Monty Pythonov Lietajúci cirkus, všeobecne bol považovaný za jedného z členov skupiny.\r\nZomrel 11. mája 2001 na srdcový záchvat. Počas celého života mal rád rockovú hudbu a jeho dôvernými priateľmi boli členovia skupiny Pink Floyd. Na zádušnej omši po jeho pohrebe v roku 2001 zaspieval osobne David Gilmour skladbu „Wish You Were Here“.\r\n\r\nJeho humorné fantasy si našlo veľký ohlas aj medzi ľuďmi, ktorí nie sú fanúšikmi fantasy a sci-fi. Veľkú popularitu si získal hlavne vďaka rozhlasovej hre stanice BBC The Hitchhiker`s guide to galaxy. Túto hru neskôr zhrnul do knihy The Hitchhiker`s guide to galaxy (1979). Bol natočený aj vydarený rovnomenný seriál, v ktorom je síce zobrazený iba základný príbeh, ale nápady, ktoré boli použité namiesto počítačových efektov, a gagy sú geniálne. V roku 2005 bol natočený aj rovnomenný film.\r\n\r\nNeil Gaiman sa netajil obdivom k Adamsovi a dokonca napísal niekoľko kníh, ktoré sa vzťahovali k Stopárovmu sprievodcovi galaxiou. Adams ale za svoju najdôležitejšiu knihu nepovažoval Stopárového sprievodcu, ale knihu o ochrane ohrozených druhov Last Chance to see, na ktorú sa ale často zabúda.', 'FiaQcOnpuBi8ObpB3eKiprJ2ydaT79VsD1qsugO8.jpg', 'douglas-adams', 2, '2018-08-31 05:37:41', '2018-09-04 15:38:39'),
(39, 'Charles', NULL, 'Bukowski', 'Henry Charles Bukowski (Heinrich Karl Bukowski)', 125, NULL, 'Andernach, Nemecko', NULL, 'San Pedro, USA', 'Henry Charles Bukowski, rodený Heinrich Karl Bukowski bol americký spisovateľ. Je známy aj pod prezývkami ako Hank, Buk. Vo svojich dielach vystupoval pod menom Henry Chinaski. \r\n\r\nNarodil sa v nemeckom mestečku Andernach, kde sa jeho matka, rodená Nemka, zoznámila s jeho otcom, americkým vojakom slúžiacim v Nemecku počas okupácie na konci 1. svetovej vojny. Keď mal Bukowski dva roky, rodina sa presťahovala do Ameriky. Vyrastal v Los Angeles, kde prežil 40 rokov. Bukowski mal škaredé detstvo. Otec ho bil, niektoré pramene uvádzajú, že ho dokonca zneužíval. Bukowski začal piť ako trinásťročný, aby zmiernil následky neradostného života. Alkohol neprispel zdraviu jeho pleti sužovanej akné, vďaka ktorému vyzeral staršie. Alkohol sprevádzal Bukowského počas celého jeho života. V roku 1955 Bukowského hospitalizovali s krvácajúcim vredom, ktorý spôsobil alkoholizmus. Vred mu vyliečili, z alkoholizmu sa však nedostal. Po prepustení začal znova piť, ale aj písať. Bukowski viedol zaujímavý život, raz bol dokonca zadržaný vo vyšetrovacej väzbe pre podozrenie z vyhýbania sa vojenskej službe. Vystriedal veľa zamestnaní. Pracoval na pošte takmer 10 rokov. O tejto etape života napísal román Poštový úrad. Ako sám hovoril, pracoval aj v tých najpodradnejších zamestnaniach len preto, aby mal peniaze na alkohol. Zomrel na dôsledky leukémie v San Pedre v Kalifornii vo veku 73 rokov. \r\n\r\nSvoj prvý príbeh vydal vo veku 24 rokov, aktívne však začal písať až keď mal 34 rokov. Vydal viac ako 45 kníh básni a próz. Svojou tvorbou aj spôsobom života sa Bukowski niekedy dáva do súvislosti s beat generation. V skutočnosti však s nimi nemal nič spoločné. Jeho ciele a prístup k životu boli totiž úplne iné a do podvedomia verejnosti sa ako spisovateľ výrazne zapísal až v osemdesiatych rokoch 20. storočia. Bukowského tvorba sa úplne odlišuje od do tej doby uverejňovanej literatúry. Texty sú ľahké a oplývajú drsným humorom, ktorý samozrejme nie je pre každého. Počas písania Bukowski rád počúval vážnu hudbu, čo je v súvislosti s charakterom jeho textov zvláštny paradox. Obľúbil si hlavne Mahlera a Brahmsa. Bukowského knihy sú príbehmi obyčajných ľudí, ukazujú ich rutinný život taký vzdialený ideálu amerického sna', '6ITsIpQqTg8dkLxhrJS83liiOV1t9dCAVOPTJzHf.jpg', 'charles-bukowski', 2, '2018-09-06 06:13:50', '2018-09-06 06:13:50'),
(40, 'Mark B.', NULL, 'Mills', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'opt00qxOI9MVP14dWFPRo1uLLbFByqsFNAcOUVwu.jpg', 'mark-b-mills', 2, '2018-09-07 02:21:20', '2018-09-07 02:49:55'),
(41, 'Jessie', 'Kathryn', 'Burton', NULL, 36, '1982-08-17', NULL, NULL, NULL, NULL, 'QpoFeGsglEXeVgrqamdO1bxKeu3dNZwQfCW4lw4T.jpg', 'jessie-burton', 2, '2018-09-07 02:22:43', '2018-09-24 16:40:02'),
(43, 'Sebastian', NULL, 'Niedlich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sebastian-niedlich', 2, '2018-09-22 16:21:02', '2018-09-22 16:21:02'),
(44, 'Stephen', NULL, 'Chbosky', NULL, NULL, NULL, 'Pittsburgh', NULL, NULL, 'je americký spisovatel, scenárista a filmový režisér, známý svým bestsellerem z roku 1999 Ten, kdo stojí v koutě (původní název je The Perks of Being Wallflower). Režíroval i filmovou verzi této knihy (Charlieho malá tajemství), ve kterém účinkují v hlavní roli: Logan Lerman, Ema Watson a Ezra Miller. Další jeho napsaný scénář byl k filmu z roku 2005 Rent (Bohémové). Chbosky je spolutvůrcem, výkonným producentem a scenáristou televizního seriálu CBS Jericho, který se začal vysílat v roce 2006.', '3xmkuQiuJP3fcplgndUcyNvl3LYgb1PXon5LP5P0.jpg', 'stephen-chbosky', 2, '2018-09-28 06:47:12', '2018-09-28 06:47:12'),
(45, 'Jean-Michel', NULL, 'Guenassia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sqGul5AM2unhk6dbtvrsnwl5NsZ1wQHb8GM21XFU.jpg', 'jean-michel-guenassia', 2, '2018-11-01 16:55:29', '2018-11-01 16:55:29'),
(46, 'Hermann', NULL, 'Hesse', NULL, NULL, '1877-07-02', 'Calw, Švábsko, Německo', '1962-09-09', '9. srpna 1962 Montagnola, Švýcarsko', 'byl německo-švýcarský prozaik, básník a esejista, nositel Nobelovy ceny za literaturu za rok 1946.', 'eLvSjSfVkCoSdc8MfJjJsZqgemQFCulrT4VmvAc1.jpg', 'hermann-hesse', 2, '2018-11-10 22:03:44', '2018-11-10 22:03:44'),
(47, 'Fiodor', 'Michajlovič', 'Dostojevskij', 'Фёдор Михайлович Достоевский', 99, NULL, 'Moskva, Ruská ríša', '1881-02-09', 'Petrohrad, Ruská ríša', 'bol ruský spisovateľ a mysliteľ, predchodca existencializmu, filozof a člen petraševskovského hnutia. Dostojevskij je jedným zo zakladateľov moderného psychologického románu. Jeho umelecká tvorba podstatne ovplyvnila vývin svetovej prózy.', 'unYKJH3I15a7Mvzp9BrKgeTdLFx6uP0BGuj7W5Du.jpg', 'fiodor-dostojevskij', 2, '2018-12-06 08:50:59', '2018-12-06 08:51:39'),
(48, 'Romain', NULL, 'Rolland', NULL, 39, '1866-01-29', 'Clamecy, Francúzsko', '1944-12-30', 'Vézelay, Francúzsko', 'bol francúzsky prozaik, dramatik, hudobný a literárny kritik. Narodil sa v burgundskom mestečku Clamecy v rodine notára. Keďže už v útlom veku prejavoval veľké nadanie, jeho rodina sa v roku 1880 rozhodla presťahovať do Paríža, aby mohol získať čo najlepšie vzdelanie. Tu vyštudoval v rokoch 1886 – 1889 históriu na elitnej škole École Normale Supérieure a potom pokračoval v štúdiu dva roky v Ríme, kde začal svoju literárnu činnosť. V rokoch 1893 – 1912 bol profesorom dejín na École Normale a prednášal dejiny hudby na Sorbonne. Súčasne bol hudobným kritikom a písal hudobné kompozície. Od roku 1912 sa venoval výhradne umeleckej činnosti.\r\n\r\nV roku 1904 začal pracovať na svojom kľúčovom diele, románe Ján Krištof, ktorý vyšiel v roku 1914 a za ktorý bol v roku 1915 ocenený Nobelovou cenou. Finančnú sumu spojenú s cenou však Rolland z väčšej časti venoval na zmiernenie útrap ľudí postihnutých prvou svetovou vojnou. Svoje humanistické a pacifistické názory Rolland prejavoval prácou v novovzniknutom Červenom kríži a ovplyvňovaním verejnej mienky početnými esejami z oblasti politiky, filozofie, divadla a hudby. Veľmi rýchlo sa tak dostal do kultúrneho povedomia Európy.\r\n\r\nDlhoročná práca na Jánovi Krištofovi Rollanda natoľko zväzovala, že po dokončení diela túžil napísať niečo menej rozsiahlejšie. Sám o tom píše „Je to reakcia proti desaťročiam nevoľnosti v brnení Jána Krištofa, ktoré síce bolo robené na moju mieru, ale nakoniec mi bolo príliš tesné. Cítil som neprekonateľnú túžbu po voľnej galskej veselosti, až bezohľadnosti.“ Výsledkom tejto túžby bol román Colas Bruegnon z roku 1919, ktorý u nás zdomácnel pod názvom Dobrý človek ešte žije. Román sa odohráva v Rollandovom rodnom Burgundsku a ide zrejme o jeho najčítanejšie a najobľúbenejšie dielo. Okrem toho v tej dobe napísal ešte dve menej rozsiahle práce – novelu Peter a Lucia (1920) a román Clerambault (1920).\r\n\r\n\r\nRolland v časopise Colliers\r\nOd roku 1922 do roku 1933 pracoval na svojom druhom rozsiahlom románe s názvom Očarená duša a stal sa známou postavou svetovej kultúry až do takej miery, že po okupácii Francúzska hitlerovským Nemeckom sa nacisti neodvážili Rollanda zatknúť, aby nespôsobili svetovú vlnu nevôle. A to aj napriek tomu, že propagoval Sovietsky zväz a jeho socialistickú formu vlády (tu možno predpokladať, že nemal dostatok informácií o hrôzach sovietskeho režimu), kritizoval fašizmus a jeho predstaviteľov ako aj Mníchovskú dohodu z roku 1938. Po uzatvorení Molotovho-Ribbentropovho paktu v roku 1939 zaujal kritický postoj aj ku Stalinovi.\r\n\r\nOkrem prozaických prác je autorom celého radu životopisov významných svetových osobností ako Beethovena, Michelangela, alebo Nikolajeviča Tolstého a je taktiež autorom divadelných hier určených pre tzv. ľudové divadlo. V tvorbe divadla pre najširšie ľudové vrstvy, ktoré by im sprostredkovalo hlboké mravné ideály, videl Rolland možnosť povznesenia ľudstva.\r\n\r\nRomain Rolland zomrel v roku 1944 v Burgundsku, v mestečku Vézelay blízko svojho rodiska.', 'a3iELEEH7ieuVwfRnvlsrVdMourAmWawXZPgpGLl.jpg', 'romain-rolland', 2, '2018-12-07 14:54:46', '2018-12-07 14:54:46'),
(49, 'Alexandr', 'Isajevič', 'Solženicyn', 'Александр Исаевич Солженицын', 99, '1918-12-11', 'Kislovodsk, Rusko', '2008-08-03', 'Moskva, Rusko', 'bol ruský spisovateľ, publicista, politický činiteľ a účastník 2. svetovej vojny.\r\nNarodil sa v meste Kislovodsk. Jeho otec Isakij Semionovič zomrel nešťastnou náhodou pri poľovačke ešte pred jeho narodením. V roku 1925 sa s matkou presťahoval do Rostova nad Donom. V nižších ročníkoch školy sa mu často vysmievali za to, že nosil pravoslávny kríž. Čelil tiež problémom, pretože nechcel vstúpiť do pionierskej organizácie, či za navštevovanie kostola. Pod vplyvom školy však neskôr prijal komunistickú ideológiu. Vo vyšších ročníkoch sa začal zaujímať o literatúru, históriu a spoločenské dianie. Písal tiež básne. V roku 1936 vstúpil do Komsomolu a začal študovať na Rostovskej štátnej univerzite, keďže však nechcel aby bola literatúra jeho jediným zdrojom obživy, študoval matematiku a fyziku. V apríli 1940 sa oženil s Nataliou Rešetkovskou. Po štúdiách pracoval ako učiteľ fyziky.\r\n\r\nPo napadnutí Sovietskeho zväzu nacistickým Nemeckom najprv v septembri 1941 mobilizoval a v polovici októbra bol povolaný do armády. Požiadal o prijatie do dôstojníckeho kurzu, ktorý absolvoval v meste Kostroma. V októbri roku 1942 sa stal poručíkom. Na front sa dostal vo februári 1943 ako veliteľ batérie vzdušného odposluchu (tieto jednotky boli súčasťou protilietadlovej obrany). Dosiahol hodnosť kapitána, bol vyznamenaný Radom Vlasteneckej vojny a Radom červenej zástavy.\r\n\r\nEšte počas vojny ho vo februári 1945 zatkli a za protištátnu činnosť (v liste priateľovi kritizoval Stalina) a odsúdili na 8 rokov väzenia, 2 roky strávil na nútených prácach v GULAGu. Po Stalinovej smrti dostal amnestiu a do roku 1956 bol vo vyhnanstve v Kazachstane. V roku 1957 bol rehabilitovaný. V roku 1962 napísal novelu Jeden deň Ivana Denisoviča, ktorá opisovala tvrdý život v sovietskych pracovných táboroch. Spolu s ďalšou pomerne kritickou poviedkou Matrionina chalupa z roku 1962 ich vydal A. T. Tvardovskij v časopise Novyj mir v roku 1963. V priebehu roka však odstránením Chruščova reformné procesy v sovietskej Komunistickej strane ustali a opäť sa dostal do nemilosti najvyšších predstaviteľov.\r\n\r\nV roku 1968 bol vylúčený zo Zväzu sovietskych spisovateľov. O dva roky neskôr mu bola udelená Nobelova cena za literatúru, ktorú si nemohol prebrať. Následne bol roku 1974 násilne odsunutý do západného Nemecka a zbavený sovietskeho občianstva. V roku 1976 odišiel do USA.\r\n\r\nDo Ruska sa vrátil v roku 1994. V roku 1997 bol zvolený za riadneho člena Ruskej akadémie vied. V posledných rokoch svojho života kritizoval západných politikov za pokrytectvo a požívanie dvojakého metra v medzinárodných vzťahoch, ale napr. aj rozširovanie NATO. V roku 2007 získal Štátnu cenu Ruskej federácie, ktorú mu osobne udelil V. Putin. Zomrel v neskorých nočných hodinách 3. augusta[1] 2008 v Moskve na srdcový infarkt. Bol pochovaný 6. augusta 2008 na Donskom cintoríne v Moskve.', 'qH3CiaxoySyF9J3J5eE4TPooe126EwJURdiYhdCC.jpg', 'alexandr-solzenicyn', 2, '2018-12-07 14:58:34', '2018-12-07 14:58:34'),
(50, 'Jason', NULL, 'Fried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jason-fried', 2, '2018-12-17 05:05:30', '2018-12-17 05:05:30'),
(51, 'Jonas', NULL, 'Jonasson', 'Pär-Ola Jonas Jonasson', 112, '1961-07-06', 'Växjö, Švédsko', NULL, NULL, 'je švédský spisovatel a novinář.', '1ILaiq6siGEIHtAGpengeokiQbCiv0h9JUCeTcIh.jpg', 'jonas-jonasson', 2, '2018-12-22 11:43:13', '2018-12-22 11:43:13'),
(52, 'Malcolm', NULL, 'Gladwell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'malcolm-gladwell', 2, '2019-01-29 20:00:33', '2019-01-29 20:00:33'),
(53, 'Mark', NULL, 'Manson', NULL, 125, '1984-03-09', NULL, NULL, NULL, NULL, '2CtgNvmfA4bTfVzS39wbgwlN2pojKsyvBsGUGLnr.jpg', 'mark-manson', 2, '2019-03-06 15:19:04', '2019-03-06 15:19:04'),
(54, 'Charles', NULL, 'Duhigg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'charles-duhigg', 2, '2019-04-01 08:44:58', '2019-04-01 08:44:58'),
(55, 'Napoleon', NULL, 'Hill', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OsSUm4uCIs7zXwyZ5tfJT8eH80imPBXVftoB4WrO.jpg', 'napoleon-hill', 2, '2019-06-17 04:06:49', '2019-06-17 04:06:49'),
(56, 'Matt', NULL, 'Haig', NULL, 124, '1975-07-03', NULL, NULL, NULL, NULL, 'lK2RYHOpds1PmguM7E6KFaVjwSk4YpvF3yhuOx86.jpg', 'matt-haig', 2, '2019-07-08 06:01:14', '2019-07-08 06:01:14'),
(57, 'Ľuboš', NULL, 'Jurík', NULL, 104, NULL, NULL, NULL, NULL, NULL, NULL, 'lubos-jurik', 2, '2019-09-10 04:07:11', '2019-09-10 04:07:11'),
(58, 'Svetlana', NULL, 'Alexijevič', 'Sviatlana Aľaksandravna Aleksijevičová', 12, '1946-05-31', 'Stanislav, ZSSR', NULL, NULL, 'Svetlana Alexijevič je bieloruská novinárka a spisovateľka, laureátka Nobelovej ceny za literatúru 2015 za polyfónny literárny štýl, ktorý „je dokumentom utrpenia a odvahy našej doby“. V roku 1972 absolvovala žurnalistiku na Leninovej univerzite v Minsku. Pracovala pre regionálne noviny a ako učiteľka. V roku 1976 sa stala dopisovateľkou minského literárneho časopisu Neman. Ako novinárka robila rozhovory s ľuďmi, ktorí zažili druhú svetovú vojnu, sovietsku intervenciu do Afganistanu alebo černobyľskú haváriu. Žila v Paríži, Göteborgu a Berlíne. V roku 2013 sa opäť vrátila do Minska. Vo svojich dielach píše o udalostiach, ktoré sú v ruskej histórii opomínané a vytláčané: o účasti žien v druhej svetovej vojne, o vojnových osudoch detí či každodennom živote po úpadku komunizmu. Je držiteľkou mnohých ocenení, medzi inými Peace Prize of the German Book Trade, Prix Médicis essai, Leipziger Book Prize on European Understanding, Andrei Sinyavsky Prize, Kurt Tucholsky Prize for the „Courage and Dignity in Writing“ (the Swedish PEN), literárne ocenenie Angelus, a je dvojnásobná držiteľka Ceny Ryszarda Kapuścińskeho za literárnu reportáž. V edícii Prekliati reportéri sme doposiaľ vydali knihy Svetlany Alexijevič: Vojna nemá ženskú tvár (Absynt, 2015), Časy zo second handu (Absynt, 2016), Zinkoví chlapci (Absynt, 2016), Černobyľská modlitba (Absynt, 2017), Poslední svedkovia (Absynt, 2018)). Z ďalšej tvorby Svetlany Alexijevič je nutné spomenúť knihy Poslední svedkovia (1985) o osudoch detí počas druhej svetovej vojny, Očarení smrťou (1993), výpoveď o samovrahoch po rozpade Sovietskeho zväzu, či Černobyľská modlitba (1997), ktorá podáva neľútostné svedectvo o jadrovej apokalypse z 26. apríla 1986.', 'yK8JHxZH05gOxZolhFXzptKXQCYgpeLCjEUlb9rV.jpg', 'svetlana-alexijevic', 2, '2019-09-23 05:20:32', '2019-09-23 05:32:56'),
(60, 'Veronika', 'Homolová', 'Tóthová', NULL, 104, NULL, NULL, NULL, NULL, 'Veronika Homolová Tóthová (1980) pracuje ako televízna a rozhlasová reportérka už viac ako sedemnásť rokov.\r\n\r\nPred desiatimi rokmi sa začala venovať spracúvaniu spomienok ľudí, ktorí prežili nacistické peklo alebo komunistické väzenie a prenasledovanie. Natočila viac ako 70 reportáží s touto tematikou a 15-dielny cyklus dokumentárnych filmov s názvom Neumlčaní. Za sériu reportáží získala v rokoch 2008 -2012 niekoľko novinárskych ocenení.\r\n\r\nViola Stern Fischerová, žena, ktorá prežila Mengeleho pokusy, štyri koncentračné tábory a nakoniec nacistom utiekla, zverila svoje spomienky po rokoch reportérke Veronike Homolovej Tóthovej. Kniha Mengeleho dievča (2016) zaznamenáva jej osud i osudy iných ľudí, ktoré by nemali upadnúť do zabudnutia.', '8dhPD5BVPOfjSvzzBUXVOCW40nqpKJAOX8q2A0jr.jpg', 'veronika-tothova', 1, '2020-02-10 14:31:19', '2020-02-10 14:31:19'),
(61, 'Yuval', NULL, 'Harari Noah', NULL, 54, '1976-02-24', NULL, NULL, NULL, NULL, '7CSZ5Eeo3ss0ChtaqxPV1fprFBUq8cVZPnbh6M5j.jpg', 'yuval-harari-noah', 2, '2020-02-12 04:48:41', '2020-02-12 04:48:41'),
(62, 'Manfredi', 'Valerio', 'Massimo', NULL, 55, '1942-03-08', 'Castelfranco Emilia, province of Modena, Emilia-Romagna, Italy', NULL, NULL, NULL, 'WNKGpbQqSn8QoCsqjAPbO1ln0EdOG7xjkrgNJmht.jpg', 'manfredi-massimo', 2, '2020-07-03 03:25:43', '2020-07-03 03:25:43');
INSERT INTO `authors` (`id`, `first_name`, `middle_name`, `last_name`, `real_name`, `nation_id`, `birth_date`, `birth_place`, `death_date`, `death_place`, `info`, `photo`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(63, 'Maja', NULL, 'Lunde', NULL, 88, '1975-07-30', 'Bislett, Oslo, Norway', NULL, NULL, NULL, 'Hm2EewJdP3lytgOhEQ2YhH1H4tYayce4pG2QQoJE.jpg', 'maja-lunde', 2, '2020-07-03 03:32:58', '2020-07-03 03:32:58');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `bazaar_categories`
--

CREATE TABLE `bazaar_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `bazaar_subcategories`
--

CREATE TABLE `bazaar_subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bazaar_category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `link_type` int(11) DEFAULT '0',
  `link_id` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) DEFAULT '0',
  `title_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_publised` tinyint(1) NOT NULL DEFAULT '0',
  `publish_date` datetime DEFAULT NULL,
  `num_visitors` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `user_id`, `link_type`, `link_id`, `title`, `slug`, `text`, `likes`, `title_image`, `created_at`, `updated_at`, `is_publised`, `publish_date`, `num_visitors`) VALUES
(2, 1, NULL, NULL, 'Čo stálo zato? (2018)', '20190926-co-stalo-zato-2018', '<p>Aj vďaka tejto stránke sa mi darí rozpomenúť si ktoré knihy som v minulom roku prečítal (ale stránka <a href=\"https://www.goodreads.com/\">www.goodreads.com</a> je na podobné zaznamenávanie prečítaných kníh lepšia ;-) ). Po pár rokoch je počet kníh ktoré sa mi podarilo prečítať pod 30, ale aj napriek nižšiemu počtu bolo viacero s nich vynikajúcich. Vybral som týchto päť, sú to viacmenej známe knihy, ja ich len môžem odporučiť tým, ktorí si na ne čas zatiaľ nenašli.</p><h3>5. <a href=\"https://kniharen.sk/kniha/anna-frankova-dennik-anny-frankovej\">Denník Anny Frankovej</a> - <a href=\"https://kniharen.sk/autor/anna-frankova\"><i>Anna Franková</i></a></h3><p> </p><h3>4. <a href=\"https://kniharen.sk/kniha/haruki-murakami-norske-drevo\">Norské dřevo</a> - <a href=\"https://kniharen.sk/autor/haruki-murakami\"><i>Haruki Murakami</i></a></h3><p> </p><h3>3. <a href=\"https://kniharen.sk/kniha/jean-michel-guenassia-klub-nenapravitelnych-optimistov\">Klub nenapraviteľných optimistov</a> - <a href=\"https://kniharen.sk/autor/jean-michel-guenassia\"><i>Jean-Michel Guenassia</i></a></h3><p> </p><h3>2. <a href=\"/kniha/paolo-giordano-osamelost-prvocisel\">Osamělost prvočísel</a> - <a href=\"https://kniharen.sk/autor/paolo-giordano\">Paolo Giordano</a></h3><p> </p><h3>1. <a href=\"/kniha/ayn-rand-atlas-pokrcil-plecami\">Atlas pokrčil plecami</a> - <a href=\"https://kniharen.sk/autor/ayn-rand\">Ayn Rand</a></h3><p> </p><p>Časom by som chcel o každej knihe niečo napísať, ale ako vidíte v úvode stránky, toto nie je jej primárny účel.</p><p> </p><p><br> </p><p> </p><p> </p><p> </p>', 0, NULL, '2019-01-30 19:00:54', '2020-07-24 00:21:12', 1, NULL, 336);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_year` int(11) DEFAULT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `books`
--

INSERT INTO `books` (`id`, `name`, `original_name`, `slug`, `publish_year`, `author_id`, `about`, `cover_img`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Zdroj', 'The Fountainhead', 'ayn-rand-zdroj', NULL, 1, NULL, '7JL4e5SDyCt7GEokNNXeUvSRAHMlDAywaKMsiWdZ.jpg', 1, '2017-07-19 16:59:01', '2018-10-24 12:45:11'),
(2, 'Na západe nič nové', ' Im Westen nichts Neues', 'erich-maria-remarque-na-zapade-nic-nove', 1929, 2, '', '6cf54ebc-b6e7-4a27-b5b6-e2d814d065aa.jpg', 1, '2017-07-19 17:09:04', '2017-07-24 14:35:29'),
(3, 'Traja kamaráti', 'Drei Kameraden', 'erich-maria-remarque-traja-kamarati', 1938, 2, 'Traja kamaráti (nem. Drei Kameraden) je román nemecko-švajčiarskeho prozaika a dramatika Ericha Maria Remarqua z roku 1938.  Román opisuje osud vojnou poznačených ľudí, pre ktorých je návrat z frontu novým bojom so zúfalstvom a úzkosťou. Je situovaný do nemeckej povojnovej spoločnosti prvej svetovej vojny.\r\nDej románu sa odohráva po 1. svetovej vojne vo Weimarskej republike počas hospodárskej krízy. Rozprávačom a hlavnou postavou románu je Robert Lohkamp. Stratená generácia - 3 hrdinovia románu - prežili vojnu, no naučili sa skôr bojovať ako žiť. Kladú si otázku, prečo žijú. Mladosť stratili vo vojne, ale stratili v nej aj zmysel vlastnej existencie. Sú skeptickí voči inštitúciám, rodine, náboženstvu. Stratili pôdu pod nohami a v spoločnosti, do ktorej sa vrátili, ju nenašli. Neprestali však veriť v kamarátstvo. Snažia sa bojovať o priateľstvo, napríklad predajú svoje milované auto Karl, aby zachránili Robertovu Patríciu.\r\n\r\nObsah knihy\r\nJa-rozprávač Robby Lohkamp žije po prvej svetovej vojne v Berlíne. Mesto je ovplyvnené zlatými 20.-tymi rokmi, veľkou dávkou radosti a rozšafnosti s veľkým zmyslom pre zábavu v protiklade s infláciou, chudobou a politickým chaosom. Lohkamp má v čase románu 30 rokov a tým patrí k stratenej generácii. Už ako 18-ročný sa stal rekrútom a o rok neskôr stál v stredobode brutálnych a nehumánnych bojov prvej svetovej vojny. Toto obdobie zničilo jeho život a urobilo ho bezcenným a nepoužiteľným pre povojnové obdobie. Nevzdáva sa a pokúša sa túto pre celú generáciu význačnú prototypickú krízu riešiť individuálnym spôsobom. Svoje miesto vo vojne nahrádza svojou predstavou, že tentokrát je vojakom v armáde vlastného života. O svoj osud sa delí s dvomi kamarátmi z vojny Gottfriedom Lenzom a Ottom Kösterom. Spoločne otvoria dielňu na opravu automobilov. Zo začiatku sa autodielni darí, ale neskôr ju z dôvodov chýbajúcich zákazníkov musia zavrieť. Aj v súkromnom živote stoja ako kamaráti bok po boku a pokúšajú sa spoločnými silami zvíťaziť nad spomienkami na zážitky zo životunebezpečného frontu. Ich nový postoj k životu a predovšetkým alkohol, im v tomto pomáhajú. Bar sa stane stredobodom spoločenského života a rum prostriedkom na vymanenie sa zo smutnej reality. Potom Robby spozná dcéru dôstojníka Pat, zaľúbia sa a napriek nepriaznivým okolnostiam a mnohým úboho žijúcim ľuďom sa ich láska v okolí vyvíja pozitívne. Ich láska je intenzívna a čoskoro traja kamaráti prijmú Pat medzi seba. Robby a Pat sa ihneď zhodnú, že vzájomná láska, je to jediné zmysluplné, pravé a veľké v ich živote. Navzájom sa utešujú voči nezmyselnosti a pominuteľnosti života a zhodujú sa aj v názore, že svet by zariadili ináč. Pocit pominuteľnosti a nutnosti umierať sa silno odráža hlavne v Lenzovom zavraždení. Politická vražda spáchaná bandou Sturmabteilung (SA) privoláva pomstu. Zvyšní kamaráti zabijú Lenzových vrahov a pracovníkov hrozivého systému a sami sa kamarátovi postarajú o dôstojnú rozlúčku a kar. Ale ani nádherná a silná láska medzi Robbym a Pat nemá mať dlhé trvanie. Prostredníctvom chrlenia krvi a dusivých záchvatov sa ohlasuje jej smrť. Pat k Robbyho ľútosti zomiera a v otvorenom konci ho zanechá smutného a duševne prázdneho.\r\n\r\nKontext a analýza\r\nErich Maria Remarque román Traja kamaráti dokončil v roku 1936 v švajčiarskom exile a venoval ho svojej prvej žene Ilse Jutte Remarque-Zambona. Až na niekoľko menších úprav zodpovedá v roku 1933 vypracovanej prvotine Pat a zaraďuje sa do trilógie. Po románoch Na západe nič nové a Cesta späť tematicky nadväzuje obdobnými opismi osudov na predošlé knihy. Hlavný hrdinovia (mužského rodu) týchto troch románov prežívajú podobný povojnový osud a všetci traja sa snažia tento problém individuálne vyriešiť. Kolektívne riešenie tohto problému sa Remarqovi javilo príliš utopické, preto v románe Traja kamaráti zobrazuje sociálno ekonomický stav krajiny ako aj duševný stav povojnovej generácie. Túto absolútne neľudskú vojnu a jej následky opisuje Remarque v tejto súvislosti ako životnú katastrofu a analyzuje zlomenú psychiku indivídua a zároveň i celého národa v jednom. Román kladie otázku na význam života a smrti a zmysel života v takej ťažkej dobe. Pre zdôraznenie tejto tématiky Remarque stavia do protikladu zastrašujúcej politickej situácie silnú lásku. Práve v tejto dobe utopická láska medzi Robbym a Pat (ide o Remarqueov najkrajší ľúbostný príbeh) je sprevádzaná pochopením a súcitom. Milujúci unikajú občianskosti s jej všetkými cieľmi a vedú život bez vyšších zámerov. Vychutnávajú spoločne maličkosti všedných dní a ako príslušníci rádu bezúspešných odolávajú životu, ktorý je pre nich nič netrvá, životu bez plánov a budúcnosti. Politická téma románu sa zaoberá nastávajúcim fašizmom v Nemecku. Pokým Remarque prepracovával román v švajčiarskom exile, uchopili moc v Nemecku nacisti a Remarque tušil aké to bude mať následky. Už len z týchto dôvodov nebolo možné román v Nemecku uverejniť. V USA, v Spojenom kráľovstve, v Argentínii a niekoľkých severských štátoch román vyšiel už v roku 1937 a získal hlavne v Spojených štátoch a Spojenom kráľovstve výnimočne pozitívny kritický ohlas. Zahraničné recenzie vyzdvihovali predovšetkým Remarqueov talent sprístupniť udalosti pre nenemecké publikum a zasadiť do toho času dôveryhodný ľúbostný príbeh. Troch kamarátov vyzdvihovali ako román novej vecnosti kvôli jeho bezprostrednej reči, jeho dobovej a faktockej autentickosti. Medzi rokmi 1938 a 1941 nasledovali francúzska, brazílska a turecká verzia. Nemecké vydanie bolo vytlačené v exilovom nakladateľstve Querido, ale mnoho nemeckých čitateľov ho nečítalo. Zlé kritiky boli skôr výnimočné. V Nemecku vyšiel až v roku 1951 a ihneď zožal negatívnu kritiku. Potlačenie fašizmu a smútok z veľkej porážky zabraňovali prístupu čitateľa k Remarqueovmu dielu. V rusko hovoriacom prostredí bolo prvé vydanie naopak prijaté s obrovským nadšením. V socialistických krajinách sa román stal kultovou knižkou mladých a ostal ňou dodnes. Pevné kamarátstvo a láska, ktoré uľahčujú zlé časy, tam upútava čitateľov viacerých generácií.', 'e0972ff1-c1af-41cc-83a1-a3997da7bc13.jpg', 1, '2017-07-19 17:15:52', '2017-07-24 14:49:17'),
(4, 'Cesta späť', 'Der Weg zurück', 'erich-maria-remarque-cesta-spat', 1931, 2, '', 'ef9f993b-a8f7-4595-a0e1-6a974dd0770d.jpg', 1, '2017-07-20 03:52:32', '2017-07-24 14:49:27'),
(5, 'Víťazný oblúk,', '', 'erich-maria-remarque-vitazny-obluk', 1946, 2, '', NULL, 1, '2017-07-20 04:16:33', '2017-07-24 14:49:36'),
(6, 'Čas žitia a čas umierania', 'Zeit zu leben, Zeit zu sterben ', 'erich-maria-remarque-cas-zitia-a-cas-umierania', 1954, 2, '', '08767175-5c7f-47ad-be96-593c51927695.jpg', 1, '2017-07-20 06:01:07', '2017-07-24 14:49:46'),
(7, ' Nebo nepozná obľúbencov', 'Der Himmel kennt keine Günstlinge ', 'erich-maria-remarque-nebo-nepozna-oblubencov', 1961, 2, '', 'f5820560-0a6d-4aca-8132-66c0224ccd74.jpg', 1, '2017-07-20 06:02:32', '2017-07-24 14:50:00'),
(8, 'Čierny obelisk', 'Der schwarze Obelisk ', 'erich-maria-remarque-cierny-obelisk', 1956, 2, '', '3ac98947-27c9-474a-a51d-93062ddb4379.jpg', 1, '2017-07-20 06:04:44', '2017-07-24 14:50:12'),
(9, ' Noc v Lisabone', 'Die Nacht von Lissabon', 'erich-maria-remarque-noc-v-lisabone', 1962, 2, '', '331b2c91-8107-4348-98e6-f919e6b10702.jpg', 1, '2017-07-20 06:09:55', '2017-07-24 14:50:26'),
(10, 'Tiene v raji', 'Schatten im Paradies ', 'erich-maria-remarque-tiene-v-raji', 1971, 2, '', 'cbbb4001-3709-42b7-ae90-ecb548fb0653.jpg', 1, '2017-07-20 06:11:07', '2017-07-24 14:50:36'),
(12, 'Starec a more', 'The Old Man and the Sea', 'ernest-hemingway-starec-a-more', 1952, 4, '', 'c8cc901e-44d1-4e19-b63e-15f287bdf435.jpg', 1, '2017-07-20 15:58:17', '2017-07-20 15:58:17'),
(13, 'Cesta pokojného bojovníka', 'Way of the Peaceful Warrior', 'dan-millman-cesta-pokojneho-bojovnika', 1980, 3, '', '1641bbdf-0de7-40f5-8d5a-df7570b76cf7.jpg', 1, '2017-07-20 16:49:57', '2017-07-20 16:49:57'),
(14, 'Slnko aj vychádza', 'The Sun Also Rises', 'ernest-hemingway-slnko-aj-vychadza', 1926, 4, '', '5118952e-fc9b-41ab-b10d-8a9a1a2aa5c5.jpg', 1, '2017-07-24 14:53:33', '2017-07-24 14:53:33'),
(15, 'Zbohom zbraniam', 'A Farewell to Arms', 'ernest-hemingway-zbohom-zbraniam', 1929, 4, '', 'a9b08dc6-5e1f-44c0-95fc-895081c31f05.jpg', 1, '2017-07-24 15:12:40', '2017-07-24 15:12:40'),
(16, 'Anjeli a démoni', 'Angels & Demons', 'dan-brown-anjeli-a-demoni', 2000, 9, '', 'b5e20e12-4af2-4ad8-b338-4985830b5fac.jpg', 1, '2017-08-05 08:26:33', '2017-08-05 08:26:33'),
(17, 'Da Vinciho kód', 'The Da Vinci Code', 'dan-brown-da-vinciho-kod', 2003, 9, '', '5cb937c5-abe9-4e9b-a231-c7c9d8057898.jpg', 1, '2017-08-05 08:46:21', '2017-08-05 08:46:21'),
(18, 'Stratený symbol', 'The Lost Symbol', 'dan-brown-strateny-symbol', 2009, 9, '', '58d5c6e3-5371-4c8a-b167-45ae11dbae51.jpg', 1, '2017-08-05 08:47:08', '2017-08-05 08:47:08'),
(19, 'Inferno', 'Inferno', 'dan-brown-inferno', 2013, 9, '', '0fd7ee8f-00fb-4cc3-bb33-a311b773cb3c.jpg', 1, '2017-08-05 08:47:53', '2017-08-05 08:47:53'),
(20, 'Digitálna pevnosť', 'Digital Fortress', 'dan-brown-digitalna-pevnost', 1998, 9, '', '1cc6d3ac-99ae-4830-9b3c-87cc5bcedc2c.jpg', 1, '2017-08-05 08:48:31', '2017-08-05 08:48:31'),
(21, 'Bod klamu', 'Deception Point', 'dan-brown-bod-klamu', 2001, 9, '', '056ef876-10cf-4325-9b98-9eccf4fcf032.jpg', 1, '2017-08-05 08:49:12', '2017-08-05 08:49:12'),
(22, 'Táto strana raja', 'This Side of Paradise', 'francis-fitzgerald-tato-strana-raja', 1920, 10, '', 'e060c19c-bfdf-4fec-9666-9813fc608d4f.jpg', 1, '2017-08-06 06:02:49', '2017-08-06 06:02:49'),
(23, 'Krásni a prekliati ', 'The Beautiful and Damned', 'francis-fitzgerald-krasni-a-prekliati', 1922, 10, '', '154a8991-f318-4031-bd85-f07d16f62c3c.jpg', 1, '2017-08-06 06:04:02', '2017-08-06 06:04:02'),
(24, 'Veľký Gatsby ', 'The Great Gatsby', 'francis-fitzgerald-velky-gatsby', 1925, 10, '', '6db01373-39f9-461c-8ce6-0e098bb74d70.jpg', 1, '2017-08-06 06:05:42', '2017-08-06 06:05:42'),
(25, 'Nežná je noc', 'Tender Is the Night', 'francis-fitzgerald-nezna-je-noc', 1934, 10, '', '4ef167cd-1d22-41b5-9b41-829d24c609fc.jpg', 1, '2017-08-06 06:06:54', '2017-08-06 06:06:54'),
(26, 'Posledný magnát', 'The Last Tycoon', 'francis-fitzgerald-posledny-magnat', 1941, 10, '', 'cf7cf751-f201-491f-aec4-48fec48d7160.jpg', 1, '2017-08-06 06:08:40', '2017-08-06 06:08:40'),
(27, 'Pútnik z Compostely', 'O Diário de um Mago', 'paulo-coelho-putnik-z-compostely', 1987, 6, '', 'a6e90b01-702f-4d47-9ebe-5b721d670302.jpg', 1, '2017-08-06 06:14:46', '2017-08-06 06:14:46'),
(28, 'Alchymista', 'O Alquimista', 'paulo-coelho-alchymista', 1988, 6, '', 'dd2007e9-5cad-4a3c-a4cc-173f9fffcd37.jpg', 1, '2017-08-06 06:15:29', '2017-08-06 06:15:29'),
(29, 'Brida', 'Brida', 'paulo-coelho-brida', 1990, 6, '', 'bda5b38c-d789-4224-9fcf-5a0faa38f360.jpg', 1, '2017-08-06 06:16:02', '2017-08-06 06:16:02'),
(30, 'Valkýry', 'As Valkírias', 'paulo-coelho-valkyry', 1992, 6, '', '1ef248f1-d4af-4029-b5cb-4bc3d9e4a8b2.jpg', 1, '2017-08-06 06:16:47', '2017-08-06 06:16:47'),
(31, 'Maktub', '', 'paulo-coelho-maktub', 1994, 6, '', NULL, 1, '2017-08-06 06:18:29', '2017-08-06 06:18:29'),
(32, 'Na brehu Rio Pedra som si sadla a plakala', 'Na margem do rio Piedra eu sentei e chorei', 'paulo-coelho-na-brehu-rio-pedra-som-si-sadla-a-plakala', 1994, 6, '', 'b6e57374-f84e-454c-a04d-ff8c698e31fc.jpg', 1, '2017-08-06 06:23:39', '2017-08-06 06:23:53'),
(33, 'Piata hora', 'O Monte Cinco', 'paulo-coelho-piata-hora', 1996, 6, '', '1955e2c0-3c35-4a83-9afb-9b1056507f55.jpg', 1, '2017-08-06 06:32:01', '2017-08-06 06:32:01'),
(34, 'Veronika sa rozhodla zomrieť', 'Veronika decide morrer', 'paulo-coelho-veronika-sa-rozhodla-zomriet', 1998, 6, '', '89eec16c-8362-47f4-a010-91243ea62c8d.jpg', 1, '2017-08-06 06:32:33', '2017-08-06 06:32:33'),
(35, 'Démon a slečna Prymová', 'O Demônio e a Srta. Prym', 'paulo-coelho-demon-a-slecna-prymova', 2000, 6, '', '3c969ba8-21d3-4ed7-8ae7-46f0a93b0bd7.jpg', 1, '2017-08-06 06:33:03', '2017-08-06 06:38:51'),
(36, 'Jedenásť minút', 'Onze Minutos', 'paulo-coelho-jedenast-minut', 2003, 6, '', 'fa264f55-57ca-4420-8054-702edb70f4f9.jpg', 1, '2017-08-06 06:39:33', '2017-08-06 06:39:33'),
(37, 'Záhir', 'O Zahír', 'paulo-coelho-zahir', 2005, 6, '', 'e41874a6-8891-454f-84e4-3f54c7563ea2.jpg', 1, '2017-08-06 06:40:00', '2017-08-06 06:40:00'),
(38, 'Čarodejnica z Portobella', 'A bruxa de Portobello', 'paulo-coelho-carodejnica-z-portobella', 2006, 6, '', '2d66f6f0-f8ef-4d98-b688-44649efc723a.jpg', 1, '2017-08-06 06:40:43', '2017-08-06 06:40:43'),
(39, 'Víťaz je sám', 'O Vencedor Está Só', 'paulo-coelho-vitaz-je-sam', 2008, 6, '', 'b7d97c88-ac25-4145-897e-c472be4acfe7.jpg', 1, '2017-08-06 06:41:26', '2017-08-06 06:41:26'),
(40, 'Alef', 'O Aleph', 'paulo-coelho-alef', 2010, 6, '', '4ad7fc22-0cb6-4f3b-9645-5f74c0a1ae84.jpg', 1, '2017-08-06 06:42:24', '2017-08-06 06:42:24'),
(41, 'Rukopis z Akkry', '', 'paulo-coelho-rukopis-z-akkry', 2012, 6, '', '396bcc0f-6cb6-4afa-9035-3ded5bdde4ac.jpg', 1, '2017-08-06 06:43:03', '2017-08-06 06:43:03'),
(42, 'Cudzoložstvo', 'Adultério', 'paulo-coelho-cudzolozstvo', 2014, 6, '', 'a1674672-13df-4d07-8e33-6b88a245e3e6.jpg', 1, '2017-08-06 06:44:07', '2017-08-06 06:44:07'),
(43, 'Špiónka', 'A Espiã', 'paulo-coelho-spionka', 2016, 6, '', '199e4d4c-0910-4c92-83d6-827615599aab.jpg', 1, '2017-08-06 06:44:44', '2017-08-06 06:44:44'),
(44, 'Harry Potter a Kameň mudrcov ', 'Harry Potter and the Philosopher\'s Stone', 'joanne-rowlingova-harry-potter-a-kamen-mudrcov', 1997, 5, '', '6c532fa6-6288-44f5-a4e0-515893b5e2cb.jpg', 1, '2017-08-10 10:32:29', '2017-08-10 10:32:29'),
(45, 'Harry Potter a Tajomná komnata', 'Harry Potter and the Chamber of Secrets', 'joanne-rowlingova-harry-potter-a-tajomna-komnata', 1998, 5, '', '38b21a9a-180d-41da-8981-26e0c3eb72ed.jpg', 1, '2017-08-10 10:32:59', '2017-08-10 10:32:59'),
(46, 'Harry Potter a Väzeň z Azkabanu ', 'Harry Potter and the Prisoner of Azkaban', 'joanne-rowlingova-harry-potter-a-vazen-z-azkabanu', 1999, 5, '', '8f92f631-b4f4-46e0-bcb9-f54e9dfd2389.jpg', 1, '2017-08-10 10:33:29', '2017-08-10 10:33:29'),
(47, 'Harry Potter a Ohnivá čaša', 'Harry Potter and the Goblet of Fire', 'joanne-rowlingova-harry-potter-a-ohniva-casa', 2000, 5, '', '2c8a6837-37be-4249-9722-d94ef5afe0fb.jpg', 1, '2017-08-10 10:34:02', '2017-08-10 10:34:02'),
(48, 'Harry Potter a Fénixov rád', 'Harry Potter and the Order of the Phoenix', 'joanne-rowlingova-harry-potter-a-fenixov-rad', 2003, 5, '', '5f33f23c-683d-4b26-b3b4-dfe3a4dabaa7.jpg', 1, '2017-08-10 10:34:33', '2017-08-10 10:39:13'),
(49, 'Harry Potter a Polovičný princ ', 'Harry Potter and the Half-Blood Prince', 'joanne-rowlingova-harry-potter-a-polovicny-princ', 2005, 5, '', '7480eff3-40a8-4e5d-9243-32bdd8bc0b4b.jpg', 1, '2017-08-10 10:35:07', '2017-08-10 10:35:07'),
(50, 'Harry Potter a Dary smrti ', 'Harry Potter and the Deathly Hallows', 'joanne-rowlingova-harry-potter-a-dary-smrti', 2007, 5, '', '17f7d6c0-fe4d-485f-8bfa-eb72da27a74b.jpg', 1, '2017-08-10 10:35:30', '2017-08-10 10:35:30'),
(51, 'Hon na ovcu', 'Hitsuji o meguru bōken', 'haruki-murakami-hon-na-ovcu', 1982, 7, '', 'afbc917d-84ee-4eb8-a5cd-2dc948bdeeea.jpg', 1, '2017-08-10 10:52:34', '2017-08-10 10:52:34'),
(52, 'Konec světa & Hard-boiled Wonderland', 'Sekai no owari to hādoboirudo wandārando', 'haruki-murakami-konec-sveta-hard-boiled-wonderland', 1985, 7, '', NULL, 1, '2017-08-10 10:53:25', '2017-08-10 10:53:25'),
(53, ' Norské dřevo ', 'Noruwei no mori', 'haruki-murakami-norske-drevo', 1987, 7, '', '0b82a4fe-ac58-43e5-bbf9-8f4c962cf06a.jpg', 1, '2017-08-10 10:54:19', '2017-08-10 10:54:26'),
(54, 'Tancuj, tancuj, tancuj', 'Kokkyō no minami, taiyō no nishi', 'haruki-murakami-tancuj-tancuj-tancuj', 1988, 7, '', '2761efb1-60f3-4a06-9ea2-0dd8dc51a3a4.jpg', 1, '2017-08-10 10:56:44', '2017-08-10 10:56:44'),
(55, 'Na jih od hranic, na západ od slunce', 'Kokkyō no minami, taiyō no nishi', 'haruki-murakami-na-jih-od-hranic-na-zapad-od-slunce', 1992, 7, '', 'e43f5bf7-6622-4019-8bf0-4be5a7619e28.jpg', 1, '2017-08-10 10:57:39', '2017-08-10 10:57:39'),
(56, 'Kronika vtáčika na kľúčik', 'Nejimaki-dori kuronikuru', 'haruki-murakami-kronika-vtacika-na-klucik', 1995, 7, '', 'ed2c432e-7b09-4949-93e7-89a1b5d9564a.jpg', 1, '2017-08-10 10:58:36', '2017-08-10 10:58:36'),
(57, 'Sputnik, má láska', 'Supūtoniku no koibito', 'haruki-murakami-sputnik-ma-laska', 1999, 7, '', 'eeb9c986-bcc0-4634-81fd-7d89a5ecfc77.jpg', 1, '2017-08-10 10:59:24', '2017-08-10 10:59:24'),
(58, ' Kafka na pobřeží ', 'Umibe no Kafuka', 'haruki-murakami-kafka-na-pobrezi', 2002, 7, '', 'b23d1a11-18a6-48e0-bc82-91da9fcbb8e6.jpg', 1, '2017-08-10 11:00:19', '2017-08-10 11:00:19'),
(59, 'Afterdark', 'Afutā Dāku	', 'haruki-murakami-afterdark', 2004, 7, '', '2b45f57f-6daa-4e70-a77c-9877920ab5bb.jpg', 1, '2017-08-10 13:41:39', '2017-08-10 13:41:39'),
(60, 'Bezfarebný Tsukuru Tazaki a jeho roky putovania', 'Shikisai wo motanai Tasaki Tsukuru to, Kare no Junrei no Toshi', 'haruki-murakami-bezfarebny-tsukuru-tazaki-a-jeho-roky-putovania', 2013, 7, '', '3ff2f4af-8a00-4413-9783-3c30f9ff0f81.jpg', 1, '2017-08-10 13:42:49', '2017-08-10 13:42:49'),
(61, 'Kam zmizla Alijaška', 'Looking For Alaska', 'john-green-kam-zmizla-alijaska', 2006, 11, '', 'd35774f3-50b6-4915-a5c1-9229c2b2dc32.jpg', 1, '2017-08-10 15:20:22', '2017-08-10 15:20:22'),
(62, 'Poučka o podstate predvídateľnosti Katherín', 'An Abundance of Katherines', 'john-green-poucka-o-podstate-predvidatelnosti-katherin', 2006, 11, '', 'c8d5d07f-5e04-4524-82f3-0ec76ac4ca6e.jpg', 1, '2017-08-10 15:22:24', '2017-08-10 15:22:24'),
(63, 'Papirové mestá', 'Paper Towns', 'john-green-papirove-mesta', 2008, 11, '', '38a423d0-cb67-417f-bfdd-2ccc8a8a44b8.jpg', 1, '2017-08-10 15:23:22', '2017-08-10 15:23:22'),
(64, 'Will Grayson, Will Grayson ', 'Will Grayson, Will Grayson ', 'john-green-will-grayson-will-grayson', 2010, 11, '', 'fdeea4d4-5cf8-4cb5-837d-d3e416cb7acb.jpg', 1, '2017-08-10 15:24:19', '2017-08-10 15:24:19'),
(65, 'Na vine sú hviezdy', 'The Fault in Our Stars', 'john-green-na-vine-su-hviezdy', 2012, 11, '', 'd9fa76fb-1a7b-476c-a433-7a2764351b8d.jpg', 1, '2017-08-10 15:25:30', '2017-08-10 15:25:30'),
(66, 'Cudzinec', 'Stranger', 'albert-camus-cudzinec', 1942, 12, '', '36ec2711-4673-4e6a-8daa-3429a5943b71.jpg', 1, '2017-08-10 15:46:40', '2017-08-10 15:46:40'),
(67, 'Komu zvonia do hrobu', 'For Whom the Bell Tolls', 'ernest-hemingway-komu-zvonia-do-hrobu', 1940, 4, 'Hlavným hrdinom je Robert Jordan – Američan, profesor španielčiny, antifašista. Volali ho „súdruh Dynamitero“, pretože strážil výbušniny. Je to hrdina, ktorý aj napriek veľkej láske k Márii obetuje pre spoločenskú spravodlivosť aj vlastný život. Uvedomuje si nevyhnutnosť disciplíny a podriadenia sa vyšším cieľom.\r\n\r\nAko dobrovoľník sa pripojí na stranu republikánov. Jeho úlohou je vyhodiť do vzduchu most a znemožniť tak prísun nepriateľských posíl v čase útoku. Počas troch dní sa zaľúbi do Márie. Je to žena, ktorá trpela, lebo fašisti jej zavraždili otca a i ju samotnú zneužili. Bola citlivá. Robert však pochybuje o úspechu akcie, ale veľmi disciplinovane a dôsledne plnil úlohu. Most zničia, akcia sa podarí, ale Jordan si zlomí nohu, posiela partizánsku skupinu do bezpečia uvedomujúc si bezmocnosť. Očakáva nepriateľa a chce ich aspoň na chvíľu zastaviť. Chce bojovať do konca života: „Bojoval som vyše roka za to, v čo verím. Ak vyhráme tu, vyhráme všade. Svet je pekné miesto a oddá sa zaň bojovať a veľmi nerád ho opúšťam.“\r\nV diele nájdeme surovosť totality, fašistov, to ako zneužívali ženy, odrezávali hlavy atď. Jazyk diela je expresívny. Nájdeme tu priamočiare vykreslenie postáv, ale aj filozofické reflexie. Rozvíja sa tu myšlienka, že boj je súčasťou života a nemožno pred ním ujsť a že boj jedného dobrého človeka nemôže byť záležitosť jednotlivca, ale celého ľudstva.\r\n\r\nMotto knihy – prevzaté od anglického básnika Johna Donna:\r\n„Nikto nie je ostrovom samým pre seba;\r\nkaždý je kusom pevniny, kusom súše;\r\na ak more odmyje hrudu, Európa sa zmenší,\r\nakoby sa stratil výbežok zeme\r\nalebo sídlo tvojich priateľov či tvoje vlastné;\r\nsmrť každého človeka umenší mňa,\r\nlebo ja som súčasťou človečenstva:\r\na preto sa nikdy nepýtaj, komu zvonia do hrobu;\r\nzvonia Tebe.“', 'f3f3783c-0ecc-447b-9a35-3dc8f1e93580.jpg', 1, '2017-08-10 15:49:11', '2017-08-10 15:49:11'),
(68, 'Atlas pokrčil plecami', 'Atlas Shrugged', 'ayn-rand-atlas-pokrcil-plecami', 1957, 1, NULL, '6jUlNS9PyIRS1NwV8TGWh1cET7dpsBqo5ip2gx23.jpg', 1, '2017-09-07 10:48:19', '2018-10-24 12:44:43'),
(69, 'To', 'It', 'stephen-king-to', 1986, 13, 'Bylo jich sedm a byli velmi mladí, když se jejich první klopýtnutí změnilo v horor. Nyní už jsou dospělými muži a ženou. Rozprchli se do velkého světa, aby v něm dosáhli úspěchu a štěstí. Ale nikdo z nich se nemůže ubránit síle, která je táhne zpátky do městečka Derry, aby stanuli tváří v tvář noční můře bez konce a zlu beze jména...\r\n\r\n', '3509ce96-4545-4a62-96b1-6570136dda5a.jpg', 1, '2017-09-16 11:11:59', '2017-09-16 17:37:42'),
(70, 'Cestujem sama', '', 'samuel-bjork-cestujem-sama', NULL, 14, '', '5114dc3c-c9af-4e75-942b-d6ae5831759b.jpg', 1, '2017-09-16 17:42:17', '2017-09-16 17:42:17'),
(71, '451 stupňov Fahrenheita', '', 'ray-bradbury-451-stupnov-fahrenheita', NULL, 15, '', '0d6db701-d3c5-48eb-b93c-b37156e6011c.jpg', 1, '2017-10-15 08:37:28', '2017-10-15 08:37:28'),
(72, 'Malý princ', 'Le Petit Prince', 'antoine-de-saint-exupery-maly-princ', 1943, 16, 'Malý princ (franc. Le petit prince) je najznámejšie dielo francúzskeho spisovateľa a pilota Antoineho de Saint-Exupéryho. Je to najslávnejší rozprávkový príbeh modernej literatúry. V knihe je mnoho metafor a prirovnaní, je možné tu nájsť myšlienky, ktoré autor konkrétne vyjadril v Zemi ľudí. Kniha rozpráva príbeh pilota, samotného autora, ktorý stroskotá na Sahare a tam sa stretáva s Malým princom, ktorý prišiel z ďalekej planétky.\r\n\r\nKniha obsahuje aj kresby autora, ktoré sú reprodukované vo väčšine vydaní. Kniha bola preložená do viac ako 180 jazykov a dialektov. Predalo sa celosvetovo viac ako 80 miliónov kópií. Patrí medzi 50 najpredávanejších kníh. Malý princ bol spracovaný v niekoľkých adaptáciách vo filmovom muzikáli od Lernera Loeweho, dve opery a jeden animovaný seriál. Malý princ je často knihou pre začiatočníkov pri štúdiu francúzskeho jazyka.', 'e9a678dc-ddb9-426e-9333-756b1fd5db99.jpg', 1, '2017-10-29 17:45:00', '2017-10-29 17:48:38'),
(73, 'Muži, kteří nemají ženy', '', 'haruki-murakami-muzi-kteri-nemaji-zeny', NULL, 7, '', NULL, 1, '2017-10-29 17:53:06', '2017-10-29 17:53:06'),
(74, 'Láska je chyba v programe', '', 'maxim-e-matkin-laska-je-chyba-v-programe', NULL, 17, '', NULL, 1, '2017-10-29 18:38:35', '2017-10-29 18:38:35'),
(75, 'Umrieť na jar', '', 'ralf-rothmann-umriet-na-jar', NULL, 18, '', '8e718045-a434-4d59-88e5-99834f713214.jpg', 1, '2017-11-01 07:40:25', '2017-11-01 07:40:25'),
(76, 'Šok z pádu', 'The Shock of the Fall ', 'nathan-filer-sok-z-padu', 2013, 19, 'Šok z pádu je výnimočne dobre napísaná kniha, osobitý štýl autora odráža zložitý svet, v ktorom Matthew žije. Navyše, Filer má cit pre temnú komédiu života a Matthew je charizmatická postava, ktorá vás upúta, aj keď sa mu svet rúca. Čitateľ si napriek ťaživej téme príbeh užíva, je ním priam fascinovaný, pretože predstavuje isté tabu. U tínedžera Matthewa Holmesa naplno prepukne schizofrénia po náhlej smrti jeho brata Simona, ktorý počas rodinnej dovolenky utrpel úraz, pri ktorom zomrel. Zdá sa, že Simon ovplyvňuje život svojej rodiny aj po smrti. Zavŕta sa do mozgu Matthewa, ktorý sa s ním nevie rozlúčiť, v dome zavládne neopísateľný smútok a mama berie lieky. Spomienky na tragédiu servíruje Matthew v omrvinkách, ani nie chronologicky, ale čitateľa to vôbec neruší, skôr poháňa ďalej. Autor ukazuje, že pri duševnej chorobe nič nie je jasné ani jednoduché a nájsť jednoznačnú odpoveď je takmer nemožné.', 'ef681b2b-681e-4e84-82e9-993896b08e14.jpg', 1, '2017-11-04 06:07:29', '2017-11-04 06:07:29'),
(77, 'Čajka Jonathan Livingston', '', 'richard-bach-cajka-jonathan-livingston', 1970, 20, '', 'ed541a04-0c64-4790-a318-70d6a8867bf1.jpg', 1, '2017-11-04 06:23:03', '2017-11-04 06:23:14'),
(78, 'Utorky s Morriem', 'Tuesdays with Morrie', 'mitch-albom-utorky-s-morriem', 1997, 21, '', 'd18a2eca-796d-4ff1-91bd-a3cdfd0d65b4.jpg', 1, '2017-11-05 10:35:02', '2017-11-05 10:35:02'),
(79, 'Pocit konca', 'The Sense of an Ending', 'julian-barnes-pocit-konca', 2011, 22, '', '64aad5d2-1870-49f6-9802-f5d0dea1db4f.jpg', 1, '2017-11-05 11:22:18', '2017-11-05 11:22:18'),
(80, 'Roviny života', '', 'julian-barnes-roviny-zivota', NULL, 22, '', '7acf7d56-54cd-4e7e-8af4-893cb5f696f0.jpg', 1, '2017-11-05 11:23:15', '2017-11-05 11:23:15'),
(81, 'Stručná história času', NULL, 'stephen-hawking-strucna-historia-casu', NULL, 23, NULL, NULL, 1, '2018-05-28 06:07:20', '2018-05-28 06:07:20'),
(82, 'Kosmonaut z Čech', NULL, 'jaroslav-kalfar-kosmonaut-z-cech', NULL, 24, NULL, '027K0XUggBaIdTyeaQlxAn1iMdzGWYvnKuBb5MdL.jpg', 1, '2018-06-02 09:59:32', '2018-06-02 09:59:32'),
(83, 'Dvaja šľachtici veronskí', 'The Two Gentlemen of Verona', 'william-shakespeare-dvaja-slachtici-veronski', 1590, 26, NULL, NULL, 2, '2018-06-04 03:45:46', '2018-06-04 03:45:46'),
(84, 'Veselé panie windsorské', 'The Merry Wives of Windsor', 'william-shakespeare-vesele-panie-windsorske', NULL, 26, NULL, NULL, 2, '2018-06-04 03:46:09', '2018-06-04 03:46:09'),
(85, 'Mor', NULL, 'albert-camus-mor', NULL, 12, NULL, 'bRPSmLZXuYH9KUsDmJXbk997WUSFC6NWMqsmYXiO.jpg', 1, '2018-06-20 15:06:07', '2018-06-20 15:20:01'),
(86, 'Všade samé korytnačky', NULL, 'john-green-vsade-same-korytnacky', 2018, 11, NULL, '8Qc9mO9OTjauFPbwawpEF4wYXfgMHOlaSNZAzZgy.jpg', 1, '2018-06-20 15:12:52', '2018-08-27 03:47:09'),
(87, 'Kto chytá v žite', NULL, 'jerome-salinger-kto-chyta-v-zite', NULL, 27, NULL, 'i3aruA5qamcGvNAmJGpedLUuHLO6AkiKJj6KzRtX.jpg', 2, '2018-06-21 07:23:44', '2018-06-21 07:23:44'),
(88, 'Spútaní časom', NULL, 'martin-repa-sputani-casom', 2018, 28, NULL, 'Ce2vpKz8quV9s475zmW71YGbBLGKueiAKccOt0Zz.jpg', 2, '2018-06-23 10:09:30', '2018-06-29 15:15:18'),
(89, 'Durotan', 'Durotan', 'christie-golden-durotan', 2016, 29, 'Prelog k filmu Warcraft (2017).', '0giOHeSXfxERqqgbc92eCiLZth9DNNSUZccEdUgv.jpg', 2, '2018-07-03 11:09:46', '2018-07-04 17:58:43'),
(90, 'Doppler', NULL, 'erlend-loe-doppler', NULL, 30, 'Otec dvoch detí jedného dňa spadne v lese z bicykla a zrazu zacíti pokoj a harmóniu. Už ho neotravujú nekonečné detské pesničky zo synových rozprávok, myšlienky na novú kúpeľňu a výber správnej záchodovej misy. O to viac si však uvedomí smrť svojho otca. Rozhodne sa odsťahovať do lesa, kúsok od Oslo. Postaví si stan, zabije losiu samicu a jej mláďa prijme ako svojho adoptívneho syna. Snaží sa žiť život lovca a zberača, kým nepochopí, že je závislý na pravidelnom prísune nízkotučného mlieka a čokolády Toblerone. To ho prinúti opäť nadviazať kontakt s ľuďmi.', 'MPfUBRrmYXxHPJHiTafNXt7t67kq4BZutwdWSmFS.jpg', 2, '2018-07-08 14:18:36', '2018-07-08 14:18:36'),
(91, 'Kamióny volvo', NULL, 'erlend-loe-kamiony-volvo', NULL, 30, 'Voľné pokračovanie obľúbeného románu Doppler pokračuje tam, kde sme skončili.', 'gW5hhtcbuHrfOFE6GAa0qAp0mhtR8ycILpZ1m4td.jpg', 2, '2018-07-08 14:19:30', '2018-07-08 14:19:30'),
(92, 'Koniec sveta, ako ho poznáme', 'Slutten på verden slik vi kjenner den', 'erlend-loe-koniec-sveta-ako-ho-pozname', NULL, 30, 'Doppler je späť. Po rokoch strávených v lese sa teší, že znovu uvidí manželku a deti.', 'HjVPik17dR27x974m94yjg5t3a0NEkflS1ZH8w1j.jpg', 2, '2018-07-08 14:21:21', '2018-07-08 14:21:21'),
(93, 'Naivne. Super.', NULL, 'erlend-loe-naivne-super', NULL, 30, NULL, 'SbH2y9K77GF126YKExZFqNGso42ONoiFdRmFsdyk.jpg', 2, '2018-07-08 14:21:46', '2018-07-08 14:21:46'),
(94, 'Inventúra', 'Vareopptelling', 'erlend-loe-inventura', NULL, 30, NULL, 'aTRjg6cLpY4QzzCvvMJirtweFrhhVwcuuxh9Rutp.jpg', 2, '2018-07-08 14:22:08', '2018-07-08 14:22:08'),
(95, 'Jiskra života', NULL, 'erich-maria-remarque-jiskra-zivota', NULL, 2, NULL, 'K5N55nFFe8MYswIiq7niMIDx2DDG6UO697lXjtiU.jpg', 2, '2018-07-09 05:12:47', '2018-07-09 05:12:47'),
(96, 'Pôvod', 'Origin', 'dan-brown-povod', 2017, 9, NULL, '8GMt75ewPNy9pcLKx4INS4kOTmFEdTx4bdqAQgXC.jpg', 2, '2018-07-09 05:21:47', '2018-07-09 05:21:47'),
(97, 'Drahý příteli', NULL, 'anne-laure-bondoux-drahy-priteli', NULL, 31, NULL, 'IZEul7kqfDL8UaU7wcrCBZobmF5QhJiLOjqrtgi4.jpg', 2, '2018-07-09 05:27:05', '2018-07-09 05:27:05'),
(98, 'Spánek', NULL, 'haruki-murakami-spanek', NULL, 7, '„Je to už sedmnáct dní, co nemůžu spát,“ tak začíná povídka Harukiho Murakamiho, jejíž protagonistkou je zdánlivě obyčejná žena v domácnosti. Vlivem různých nečekaných okolností připomíná její noční život výlet do mimosmyslového prostoru. Ve světě, který je naprosto odlišný od našeho, prozkoumává svou rodinu, sama sebe, i význam života a smrti.', 'gnQpZsqUdx6ScAvPm0ipPje53emUQHwj1cZSSqYc.jpg', 2, '2018-07-09 05:28:57', '2018-08-08 16:24:33'),
(99, 'Sokrates', NULL, 'paul-johnson-sokrates', NULL, 32, NULL, 'U2Vdn7TIOl9prQoh8QQgdoxl1t7f3fQi4Wus8JU5.jpg', 2, '2018-07-09 05:30:29', '2018-07-09 05:30:29'),
(100, 'Strom duchu', NULL, 'ray-bradbury-strom-duchu', NULL, 15, NULL, 'CRitwWYzpC7oEPgRCCIl3JwABw01i8Ck9Irjd3Mx.jpg', 2, '2018-07-09 05:31:32', '2018-07-09 05:31:32'),
(101, 'Zakázaná láska', NULL, 'miroslav-valek-zakazana-laska', NULL, 33, NULL, '67eBc75yvuQhUiBsHyNQTrmG9oWqTPaWCvM83TY4.jpg', 2, '2018-07-09 05:33:44', '2018-07-09 05:33:44'),
(102, 'Keď Hitler bral kokaín a Leninovi ukradli mozog', NULL, 'giles-milton-ked-hitler-bral-kokain-a-leninovi-ukradli-mozog', NULL, 34, NULL, '4jzaC8HM0TeVomnXhaH7rDLC6txzxaXOilisJaA5.jpg', 2, '2018-07-09 05:35:05', '2018-07-09 05:35:05'),
(103, 'Osamělost prvočísel', 'La solitudine dei numeri primi', 'paolo-giordano-osamelost-prvocisel', NULL, 35, NULL, 'JHFFGzal2DG5OIVpAENuGDVudBiSspQtlpkGjouv.jpg', 2, '2018-07-09 05:38:44', '2018-10-15 16:28:51'),
(104, 'Zvonodrozdovo', NULL, 'gabriel-chevallier-zvonodrozdovo', NULL, 36, NULL, 'dTomE0svdc4eQR1kKQvMA2Mv2rMi8bHq9Km6pCsH.jpg', 2, '2018-07-09 05:40:34', '2018-07-09 05:40:34'),
(105, 'Spisovatel jako povolání', NULL, 'haruki-murakami-spisovatel-jako-povolani', NULL, 7, NULL, '0zGm2qFeoLukWFTPNMA2OqCE09OIfNpamA5EpT0L.jpg', 2, '2018-07-24 04:00:42', '2018-07-24 04:00:42'),
(106, 'Denník Anny Frankovej', NULL, 'anna-frankova-dennik-anny-frankovej', NULL, 37, 'Trinásťročná Anna Franková sa spolu s rodinou počas druhej svetovej vojny dva roky ukrývala v zadnej časti jednej budovy v Amsterdame. Tesne pred koncom vojny však padla za obeť nacistickému režimu. Anna si zapisovala udalosti od 12. júna 1942 do 1. augusta 1944 a zaznamenala všetko, čo sa okolo nej dialo, aj jednotlivé dni v úkryte. Keď v marci 1944 v Oranžskom rádiu počula výzvu občanom, aby poskytli svoje zápisky do zbierky na historické účely, svoje poznámky začala prepisovať do knižnej podoby. Stihla prepísať podstatnú časť pôvodných listov. Zápisky sa končia textom, ktorý Anna zaznamenala iba pár dní pred tým, ako ju aj jej rodinu našli vojaci a odvliekli do koncentračného tábora. Zápisky sa však zachovali a po vojne sa o ich knižné vydanie zaslúžil Annin otec Otto Frank, ktorý jediný vojnu prežil.', 'BMzvlSAEICvVCp06PW1H4fi57yUzyngzeF2Ynb1j.jpg', 2, '2018-08-10 03:59:21', '2018-08-27 04:04:33'),
(107, 'Holistická detektívna agentúra Dirka Gentlyho', 'Dirk Gently\'s Holistic detective agency', 'douglas-adams-holisticka-detektivna-agentura-dirka-gentlyho', 1987, 38, NULL, 'JWLGZCdhABXEP0mUVyvXtC7HUUcwEuqLi80LvD0r.jpg', 2, '2018-08-31 05:38:55', '2018-09-04 15:36:08'),
(108, 'Stopárov sprievodca galaxiou', 'The Hitchhiker\'s guide to galaxy', 'douglas-adams-stoparov-sprievodca-galaxiou', 1979, 38, 'Stopárov sprievodca galaxiou (orig.: The Hitchhiker\'s Guide to Galaxy, 1979) je prvý diel pentalógie (označovanej trilógia s piatimi dielmi) anglického spisovateľa Douglasa Adamsa.\r\n\r\nStopárov sprievodca galaxiou je veľmi pozoruhodná kniha, jedna z najpozoruhodnejších, ale rozhodne najúspešnejšia kniha akú kedy vydalo Mamutie Nakladateľstvo v Malom Medveďovi. Je úspešnejšia ako Nebeský radca gazdiniek, predávanejšia ako 53 zábaviek pri nulovej gravitácii a diskutovanejšia ako trilógia filozofických trhákov Oolona Colluphida: Kde urobil Pán Boh chybu, Výber najväčších Božích omylov a Čo je ten Pán Boh zač. Nahradila Galaktickú Encyklopédiu ako zdroj všetkého poznania len preto, lebo je o niečo lacnejšia ale hlavne preto, že má na obálke veľký vľúdny nápis ,,NEPODLIEHAJTE PANIKE´´', 'lXmWjLXKzsY2TaVvLxnCR0YURJvHjEIxq5azB3WH.jpg', 2, '2018-09-04 15:32:57', '2018-09-04 15:35:38'),
(109, 'Reštaurácia na konci vesmíru', 'The restaurant at the end of Universe', 'douglas-adams-restauracia-na-konci-vesmiru', 1980, 38, NULL, 'aR2hIERTjrKuQLkbfYnD6z5dvzb0gE5B1qQevGh2.jpg', 2, '2018-09-04 15:33:27', '2018-09-04 15:33:27'),
(110, 'Život, vesmír a všetko', 'Life, the Universe and Everything', 'douglas-adams-zivot-vesmir-a-vsetko', 1982, 38, NULL, 'RgIS9s0q2n3GRkG1X9ehVuq4IELggcRljNWXSU0L.jpg', 2, '2018-09-04 15:34:06', '2018-09-04 15:34:06'),
(111, 'Zbohom a ďakujeme za ryby!', 'So long, and thanks for all the fish', 'douglas-adams-zbohom-a-dakujeme-za-ryby', 1985, 38, NULL, 'amLpkczRXoGDAs6mOAghlnOPECCXKYCslHXdPLc2.jpg', 2, '2018-09-04 15:34:32', '2018-09-04 15:34:32'),
(112, 'Zväčša neškodná', 'Mostly harmless', 'douglas-adams-zvacsa-neskodna', 1992, 38, NULL, 'fP15xje9CXnmgCJyvJQgMSIdLgudh7oc7ean7686.jpg', 2, '2018-09-04 15:35:01', '2018-09-04 15:35:01'),
(113, 'Spev o mne', NULL, 'walt-whitman-spev-o-mne', NULL, 8, NULL, 'oXbRgCsspIdJrwd9MxcKXO3iNPx9dzTBpP7kYPnm.jpg', 2, '2018-09-05 09:46:24', '2018-09-05 09:49:01'),
(114, 'Listy trávy', 'Leaves of Grass', 'walt-whitman-listy-travy', NULL, 8, NULL, '4UikhcoPw3UJTuCSf1jYHYVlTrStl6NmHFcBiJsP.jpg', 2, '2018-09-05 09:47:02', '2018-09-05 09:48:52'),
(115, 'Dlhý temný súmrak bohov', 'The long dark tea-time of the Soul', 'douglas-adams-dlhy-temny-sumrak-bohov', 1988, 38, NULL, 'TYkMVMEsum3MDjciL0fQ35l4wfPtEv6GBC7o5T6H.jpg', 2, '2018-09-05 09:59:44', '2018-09-05 09:59:44'),
(116, 'Príbehy obyčajného šialenstva', NULL, 'charles-bukowski-pribehy-obycajneho-sialenstva', NULL, 39, NULL, 'kyZ7YdgdUOUxbbWML4tWTMjE95e3g3GmOIWey6QH.png', 2, '2018-09-06 06:15:33', '2018-09-06 06:15:33'),
(117, 'Faktótum', NULL, 'charles-bukowski-faktotum', NULL, 39, NULL, 'pJ80CDAmx75TAIo65trkODhtghlrRVPZ9EAgXyXP.jpg', 2, '2018-09-06 06:16:59', '2018-09-06 06:16:59'),
(118, 'Čakanie na pesa', NULL, 'mark-b-mills-cakanie-na-pesa', NULL, 40, NULL, '9dTtZtDN8CfQVmCAJUhttpmfB6uwNKpEF7YhEUpg.jpg', 2, '2018-09-07 02:22:19', '2018-09-07 02:22:19'),
(119, 'Miniaturista', 'The Miniaturist', 'jessie-burton-miniaturista', 2014, 41, 'Jednoho podzimního dne roku 1686 klepe na dveře velkolepého domu v nejbohatší části Amsterdamu osmnáctiletá Nella Oortmanová. Přijela z chudé venkovské rodiny, aby se ujala role manželky zámožného kupce Johannese Brandta, avšak místo milujícího manžela ji přivítá jeho odměřená sestra, černý sluha a prostořeká služebná. Když se Johannes později vrátí z cest, věnuje Nelle velice zvláštní svatební dar – skříňkovou repliku jejich domu. Nella si do ní objedná zařízení od tajuplného miniaturisty a od té chvíle se začnou dít prapodivné věci… \r\nRomán zachycuje dramatické osudy rodiny Brandtových na pozadí Amsterdamu sedmnáctého století, kdy toto město patřilo k nejbohatším a nejvlivnějším centrům své doby.', 'p7RyYH7TjVbwDiioVC4roATR3xyTcKMSVNT3flNW.jpg', 2, '2018-09-07 02:23:20', '2018-09-24 16:40:59'),
(120, 'Najkrajšia žena v meste', NULL, 'charles-bukowski-najkrajsia-zena-v-meste', NULL, 39, NULL, 'DMxQm1XoCWvov6277YJUgGvX3cyW7mfQwwOI6jV5.jpg', 1, '2018-09-08 06:59:50', '2018-09-08 07:01:27'),
(121, 'Sokrates', NULL, 'dan-millman-sokrates', NULL, 3, 'Filozofie pokojného bojovníka se stala životním stylem milionů lidí na celém světě. Ve své knize Sokrates, nesoucí podtitul Příběh o tom, jak se mladý chlapec stane pokojným bojovníkem a pokojný bojovník moudrým mužem, svým čtenářům Dan Millman předkládá dlouho očekávaný příběh o životě záhadného pumpaře a samorostlého učitele. Zavádí nás do carského Ruska devatenáctého století. Osiřelý chlapec, jemuž v žilách koluje kozácká a židovská krev, se snaží najít své místo na slunci. Žije však v zemi, kde vláda nabádá občany, aby zabíjeli své bližní, a kde den ode dne sílí revoluční nálady. Sergej Ivanov čili Sokrates je nucen opustit vojenskou akademii, kterou považuje za svůj jediný domov, a ocitá se ve světě, v němž mu jako záchytný bod slouží pouze slib tajemného starce.', '8q0hePsdHVGG7xz3oeUjMC0FH86jBYL0bBSAFJpO.jpg', 2, '2018-09-22 16:12:16', '2018-10-03 16:13:49'),
(122, 'Návrat pokojného bojovníka', NULL, 'dan-millman-navrat-pokojneho-bojovnika', NULL, 3, NULL, 'P6rwjyWrTzCKAu7zXcaP3Ea4dlrQeYmYyih8UY97.jpg', 2, '2018-09-22 16:13:07', '2018-09-22 16:13:07'),
(123, 'Smrť a iné okamihy môjho života', NULL, 'sebastian-niedlich-smrt-a-ine-okamihy-mojho-zivota', NULL, 43, 'Mať priateľov, to je pekná vec. A človek na nich niekedy natrafí naozaj na veľmi nezvyčajných miestach. Martin však nie je práve nadšený, keď sa pri posteli svojej umierajúcej babičky zoznámi so stelesnenou Smrťou, ktorá má podobu mladého muža vyzbrojeného sieťkou na motýle, do ktorej chytá duše umierajúcich. Pôvodne si prišiel po dušu starej dámy, ale je nesmierne šťastný, že ho konečne niekto vidí a počuje. Spriatelia sa a zrazu sa Martinovi začne zjavovať kedykoľvek a kdekoľvek, aj v tej najnevhodnejšej chvíli... Vraj on je ten pravý, on je predurčený na to, aby prevzal jeho úrad. A Martin naozaj začne mať nadprirodzené schopnosti. Keď však spozná ženu, o ktorej tuší, že je tá pravá, musí si položiť závažnú otázku: Má vôbec zmysel žiť, milovať a túžiť po šťastí, keď sa raz všetko aj tak skončí smrťou? Nuž, ale aj nad vážnymi vecami sa treba vedieť občas zasmiať, nemyslíte?', 'muec1X60dvz2byNnqSCEo0N7I5ZTSanWmobrmgS6.jpg', 2, '2018-09-22 16:21:37', '2018-09-22 16:21:54'),
(124, 'Charlieho malé tajomstvá', 'The Perks of Being a Wallflower', 'stephen-chbosky-charlieho-male-tajomstva', NULL, 44, NULL, 'ZtZbx0NkwyUngfSECW9pGZ3bz6jEHu0nPssAr9FT.jpg', 2, '2018-09-28 06:49:32', '2018-09-28 06:49:32'),
(125, 'Hippie', NULL, 'paulo-coelho-hippie', 2018, 6, 'Vo svojom najväčšmi autobiografickom románe s nami Paulo Coelho znovu prežíva sen generácie hippies, ktorá túžila zmeniť svet a šíriť mier. Paulo je mladý muž a chce sa stať spisovateľom. Nechá si narásť dlhé vlasy a vyberie sa do sveta hľadať slobodu a hlbší zmysel existencie. Zástupcovia brazílskej vojenskej diktatúry ho zatknú a uväznia. Neskôr, roku 1970 sa v Amsterdame stretne s Karlou a nasadnú na Magic Bus, ktorý ich má odviezť do Nepálu. Cestou prežijú výnimočný príbeh lásky. Aj ich spolucestujúci prechádzajú hlbokými premenami a nachádzajú nové životné hodnoty.', 'J299Z9lt4NfN7ZBgbdXuc8JXbycHy8G6bwpm4Ypl.jpg', 2, '2018-10-09 03:19:13', '2018-10-09 04:08:28'),
(126, 'Klub nenapraviteľných optimistov', 'Le club des incorrigibles optimistes', 'jean-michel-guenassia-klub-nenapravitelnych-optimistov', 2016, 45, NULL, 'ZKCy6tjOJ25ovpF9OvRZ6Xxv3oGrLoj12q96dUEa.jpg', 2, '2018-11-01 16:58:48', '2018-11-01 16:58:48'),
(127, 'Siddhartha', NULL, 'hermann-hesse-siddhartha', NULL, 46, NULL, 'JFTNCWqL6PCZfGXXQWQj4gGSkpP2z6BNqyZhZzfz.jpg', 2, '2018-11-10 22:06:23', '2018-11-10 22:06:23'),
(128, 'Zločin a trest', 'Преступление и наказание', 'fiodor-dostojevskij-zlocin-a-trest', 1866, 47, 'je vrcholný román ruského autora Fiodora Michajloviča Dostojevského. Ide o základné dielo ruskej realistickej literatúry 19. storočia.', 'INoHC2HHqQ2zhmBAh4kyfcLz0mDQRYfaWHt3YsjK.jpg', 2, '2018-12-06 08:54:03', '2018-12-06 08:54:03'),
(129, 'Idiot', 'Идиот', 'fiodor-dostojevskij-idiot', 1868, 47, 'Hlavním hrdinou románu je kníže Lev Nikolajevič Myškin, nedoléčený epileptik, jenž se po dlouhé době léčení vrací do Petrohradu, do ruské společnosti, v níž je zprvu kvůli své nemoci označován za „idiota“, ale svým chováním velmi rychle dovede předsudky ostatních změnit, a většinou dokonce zcela vyvrátit. Svou lidskostí, nesobeckou ušlechtilostí a zdánlivě až naivní dobrotivostí nad ostatní ruskou společností výrazně vyniká.\r\n\r\nPro své okolí se stane téměř nepostradatelným a nakonec je společností „pohlcen“. Jeho psychický stav se ovšem neustále zhoršuje a jako poslední rána osudu přichází vražda Nastasji Filippovny, nadpozemsky krásné, okouzlující, ale zároveň neobyčejně vnitřně sebetrýzněné a velice silné ženy, se kterou se měl oženit. (Je částí společnosti dokonce pokládána za nihilistku.) Tato událost zapříčiní jeho návrat do jeho dávného stavu, epilepsii, blízké idiotství. Kníže odjíždí zpět do Švýcarska na léčení, a ačkoli vrah neujde trestu, můžeme mluvit o snad nejtragičtějším vyvrcholení příběhu, jaké mohlo nastat - Myškin miloval dceru své vzdálené příbuzné Aglaju Ivanovnu Jepančinovou (snad stejně krásná jako Nastasja) a byli zasnoubeni, ale aniž by si to dobře uvědomil, dal nakonec přednost Nastasje Filippovně. Aglaju už nikdy nespatřil, nikdy se již nevyléčil, Nastasja byla zavražděna (její vrah Parfen Semjonovič Rogožin by ji ovšem zavraždil, i kdyby si Myškina neměla vzít). Aglaja si pak vzala bezvýznamného polského šlechtice a utekla od rodiny. Krása, zprvu tak silná a vítaná, je společností zničena, rozervána na kusy a nenávratně ztracena. Krása, jež (podle slov autora) měla „spasit svět“, je světem zničena, potupena, zhanobena a zapomenuta.', 'kp9PU5VUcE4Fa6aKlia8fMiIUF15EicA1Y0yABsW.jpg', 2, '2018-12-06 08:56:15', '2018-12-06 08:56:15'),
(130, 'Peter a Lucia', NULL, 'romain-rolland-peter-a-lucia', NULL, 48, NULL, NULL, 2, '2018-12-07 14:55:47', '2018-12-07 14:55:47'),
(131, 'Jeden deň Ivana Denisoviča', NULL, 'alexandr-solzenicyn-jeden-den-ivana-denisovica', NULL, 49, NULL, 'knCqeOb1IxvCvYSl3YTYgHuOaR4Qs4NNKo9b4oPw.png', 2, '2018-12-07 14:59:57', '2018-12-07 14:59:57'),
(132, 'Restart', NULL, 'jason-fried-restart', NULL, 50, 'Autori: Jason Fried David a Heinemeier Hansson', 'xCQCh2RY1ipzrptLBKHqVMRms7AusgJnAeMR0gTH.jpg', 2, '2018-12-17 05:07:03', '2018-12-18 10:58:20'),
(133, 'Skrytá škola', NULL, 'dan-millman-skryta-skola', NULL, 3, NULL, 'dQ9MXOa95vIYFRckWvHwjYU8ggDfj2xVmQf6GwBx.jpg', 2, '2018-12-17 05:09:12', '2018-12-17 05:09:12'),
(134, 'Storočný starček, ktorý vyliezol z okna a zmizol', NULL, 'jonas-jonasson-storocny-starcek-ktory-vyliezol-z-okna-a-zmizol', 2009, 51, NULL, 'Y8vyEhcydO9TIRVBFlLmxm8xmF5KqV6Y3en7vza2.jpg', 2, '2018-12-22 11:45:56', '2018-12-22 11:49:42'),
(135, 'Analfabetka, ktorá vedela počítať', NULL, 'jonas-jonasson-analfabetka-ktora-vedela-pocitat', 2013, 51, NULL, 'ifOAOmqRDInamlztuiw0ntK9H1TPlyGgX4VzCcK5.jpg', 2, '2018-12-22 11:47:19', '2018-12-22 11:47:19'),
(136, 'Zabijak Anders a jeho priatelia', NULL, 'jonas-jonasson-zabijak-anders-a-jeho-priatelia', 2015, 51, NULL, '4f3pYCYbqfUCLL1XSDp2rDKrjD9gqqMhMvKz8bGj.jpg', 2, '2018-12-22 11:48:16', '2018-12-22 11:48:16'),
(137, 'Stojedenročný starček, ktorý sa obával, že priveľa myslí', NULL, 'jonas-jonasson-stojedenrocny-starcek-ktory-sa-obaval-ze-privela-mysli', 2018, 51, NULL, 'VYyoUikpGTJL9XtdpCEkySqOTurge1I3OLoH9M55.jpg', 2, '2018-12-22 11:49:29', '2018-12-22 11:49:29'),
(138, 'Spiace krásavice', 'Sleeping Beauties', 'stephen-king-spiace-krasavice', 2017, 13, NULL, 'Civ4EdlvCKhOWBYN30XFjzp29KqJ0IHAKWxQwNCv.jpg', 2, '2018-12-26 19:22:19', '2018-12-27 09:46:22'),
(139, 'Bod zlomu', 'How Little Things Can Make a Big Difference', 'malcolm-gladwell-bod-zlomu', 2000, 52, NULL, 'uWpj5P1D7rnfSqJ3d6CZg7bipcE5Cvd79txp5mDD.jpg', 2, '2019-01-29 20:02:42', '2019-01-30 05:10:11'),
(140, 'Rukověť bojovníka světla', 'Manual do Guerreiro da Luz', 'paulo-coelho-rukovet-bojovnika-svetla', NULL, 6, NULL, 'r3FceE6zsqIkY7JOjAkJnhoqvqpDZw04nSX7j3gw.png', 2, '2019-02-26 19:10:36', '2019-02-26 19:10:36'),
(141, 'Jemné umenie mať veci v paži', NULL, 'mark-manson-jemne-umenie-mat-veci-v-pazi', NULL, 53, NULL, 'ULkT0N48Nk6zknDqPgbfUyYWAK5zyJUW6DUIecIa.jpg', 2, '2019-03-06 15:20:06', '2019-03-06 15:20:06'),
(142, 'Síla zvyku', NULL, 'charles-duhigg-sila-zvyku', NULL, 54, NULL, 'uKmJblY9ZDkA0f8Wdb1lQDviqp0TSeySiVP3HAvT.jpg', 2, '2019-04-01 08:45:31', '2019-04-01 08:45:31'),
(143, 'Stepní vlk', NULL, 'hermann-hesse-stepni-vlk', NULL, 46, NULL, '8Src1XdIJQAfNs79EiGTs2TL1ddsFPg3mMXN5gN1.jpg', 2, '2019-04-18 09:55:30', '2019-04-19 05:44:50'),
(144, 'Mysli a zbohatni', NULL, 'napoleon-hill-mysli-a-zbohatni', 1937, 55, NULL, 'XA9fwVXBGDa33uITPNrsWCswY7H7LFouxPXxIQIN.jpg', 2, '2019-06-17 04:23:36', '2019-06-17 04:23:36'),
(145, 'Outliers', NULL, 'malcolm-gladwell-outliers', NULL, 52, NULL, 'mc0li4u8AicsQjDbx2ep4o5UovKOlEy3lke4X1DV.png', 2, '2019-06-18 11:06:32', '2019-06-18 11:06:32'),
(146, 'Požierači neba', 'Divorare il cielo', 'paolo-giordano-pozieraci-neba', 2019, 35, 'Letá na juhotalianskom vidieku pri mestečku Speziale sú pre Teresu časom nesmiernej nudy. Jedného dňa jej však do života vtrhnú traja chlapci - bratia, no nie pokrvní, takmer ešte deti, plní nespútaných a čistých túžob ako ona. Uprostred víru udalostí, ktoré Terese navždy zmenia život, stojí Bern, ktorý ostatných priťahuje ako magnet a posúva ich za hranicu dovoleného. Bern pozná len absolútne vášne – Boha, sex, prírodu a dieťa.', '8izcqGsuQsFZ0toNS3jszjXnosBDVLqGJz5LAq4Z.jpg', 2, '2019-07-08 06:05:26', '2019-07-08 06:05:26'),
(147, 'Ako zastaviť čas', 'How to Stop Time', 'matt-haig-ako-zastavit-cas', 2018, 56, 'Čo by s nami urobila láska, keby sme žili stovky rokov? Tom Hazard má nebezpečné tajomstvo. Vyzerá ako bežný štyridsiatnik, trpí však zriedkavým neduhom − starne veľmi pomaly. Tom sa stretol so Shakespearom, plavil sa po oceáne s kapitánom Cookom a popíjal koktejly s Fitzgeraldom. Veľa toho zažil a o veľa prišiel. A teraz túži už len po jednom: po obyčajnom živote. \r\n\r\nAko zastaviť čas je príbeh o mužovi, ktorý sa stratil v čase a žene, ktorá by ho mohla zachrániť. O láske a rokoch, ktoré potrebujeme na to, aby sme pochopili, ako žiť a milovať.', 'YrSmohSrrqTUgumTl0XZg3r3eaL4Qbsup4LyPaAR.jpg', 2, '2019-07-08 06:06:08', '2019-07-08 06:06:08'),
(148, 'Alexander Dubček / Rok dlhší ako storočie', NULL, 'lubos-jurik-alexander-dubcek-rok-dlhsi-ako-storocie', 2015, 57, NULL, 'SNOMKZIWkUerysCQnomXNQdKsGBIiRZVI5Ngjwdk.jpg', 2, '2019-09-10 04:08:10', '2019-09-10 04:08:10'),
(149, 'Černobyľská modlitba', NULL, 'svetlana-alexijevic-cernobylska-modlitba', NULL, 58, '26. apríla 1986 o 1:24 zaznela v černobyľskej jadrovej elektrárni séria výbuchov. Bol to začiatok najväčšej jadrovej nehody v 20. storočí.\r\nČernobyľská katastrofa sa stala jednou z najsilnejších tém, ktorú vo svojej tvorbe spracovala laureátka Nobelovej ceny Svetlana Alexijevič. Dvadsať rokov po tejto jadrovej apokalypse sa vracia na miesta, ktoré boli Černobyľom najviac postihnuté, rozpráva sa s ľuďmi, ktorých sa bytostne dotkla a fatálne zasiahla do ich životov. Pozostalí, hasiči, bývalí zamestnanci – každý z nich má vlastný „černobyľský príbeh“. Svetlana Alexijevič svojím nenapodobiteľným spôsobom skladá kroniku nedávnej minulosti, aby tak vytvorila knihu, ktorá je pre nás všetkých varovaním najmä do budúcnosti\r\n\r\nTouto knihou, jej postavami a svedectvom, sa inšpiroval aj svetoznámy seriál HBO Chernobyl, ktorý úspešné láme rekordy diváckej sledovanosti v mnohých krajinách.', 'ZWas4N4BIwewUr0waYySGDJ0qFSKIlYSjO4tlrTu.jpg', 2, '2019-09-23 05:23:30', '2019-09-23 05:23:30'),
(151, 'Mengeleho dievča', NULL, 'veronika-tothova-mengeleho-dievca', 2016, 60, '„Každý večer, keď myslím na svojich drahých, ktorí už nežijú, si hovorím: Ako si to mohla prežiť? Sama neviem. Bolo to naozaj iba o šťastí a náhode. “\r\n\r\nTo sú slová Violy Fischerovej, ženy, ktorá prežila Mengeleho pokusy, štyri koncentračné tábory a nakoniec nacistom utiekla.\r\nTá hrozná doba stvorila množstvo príbehov. Príbehov o odvahe, statočnosti, láskavosti a obetovaní sa, ale aj o zlobe, podlosti a obludnom ponižovaní iných ľudských bytostí. Príbeh Violy Fischerovej je však výnimočný. Ona totiž okrem toho, že prežila peklo táborov smrti a našla v sebe silu na riskantný útek, dokázala ešte niečo. Vďaka nej chytili brutálnu dozorkyňu z Birkenau.\r\n\r\nPo vojne sa náhodou stretla so svojou veľkou láskou. Mužom, o ktorom roky nevedela, či ešte žije. Ale nakoniec sa vydala za niekoho iného. Rytiera. Skutočného novodobého rytiera, ktorý získal toto vyznamenanie od francúzskeho prezidenta za statočnosť v boji na strane spojencov.\r\n\r\nViola Fischerová po rokoch zverila svoje spomienky reportérke Veronike Homolovej Tóthovej. Táto kniha zaznamenáva jej osud i osudy iných ľudí, ktoré by nemali upadnúť do zabudnutia.', 'RbLCmUTaeAbx71gEH1oqGbEgUCI82wL2smTKfoVR.jpg', 1, '2020-02-10 14:32:28', '2020-02-12 04:44:37');
INSERT INTO `books` (`id`, `name`, `original_name`, `slug`, `publish_year`, `author_id`, `about`, `cover_img`, `user_id`, `created_at`, `updated_at`) VALUES
(152, 'Sapiens - Stručná história ľudstva', NULL, 'yuval-harari-noah-sapiens-strucna-historia-ludstva', NULL, 61, 'V knihe Sapiens: Stručná história ľudstva jej autor, nazývaný aj vizionársky historik, Dr. Yuval Noah Harari opisuje históriu človeka ako biologického druhu od prvých ľudí až po súčasnosť, ktorú výrazne ovplyvnili tri revolúcie - kognitívna, poľnohospodárska a vedecká revolúcia. \r\nAko zvíťazil náš druh v boji o dominanciu? \r\nPrečo sa naši kočovní predkovia usadili a začali zakladať mestá a ríše? \r\nAko sme dospeli k viere v bohov, národy a ľudské práva? \r\nA aký bude náš svet v ďalších tisícročiach?\r\nVychádzajúc z poznatkov z histórie, biológie, antropológie, paleontológie a ekonómie Dr. Harari skúma, ako jednotlivé historické prúdy formovali ľudské spoločnosti - ich nažívanie v rámci spoločnosti, ale aj s prírodou, zvieratami a rastlinami - a dokonca aj ľudskú osobnosť. \r\nSme vďaka tomu šťastnejší? \r\nMôžeme niekedy vôbec oslobodiť naše správanie od dedičstva našich predkov? \r\nA čo môžeme alebo by sme mali urobiť, aby sme ovplyvnili priebeh nasledujúcich storočí? \r\nAutor tak čitateľa núti zamyslieť sa aj nad blízkou či vzdialenejšou budúcnosťou, ktorú ovplyvňuje správanie človeka, vedecký pokrok a jeho snaha pozmeniť zákony prírody len pre svoje blaho. \r\nKniha je vzrušujúcim zhrnutím našej neuveriteľnej histórie - od bezvýznamných opíc až k pánom sveta. Jej obsah je odvážny, obsiahly aj provokatívny. Spochybňuje všetko, čo sme o ľudstve zdanlivo vedeli: našu vieru, činy, moc... aj našu budúcnosť, a pritom sa zamýšľa a ozrejmuje najdôležitejšie otázky histórie a moderného sveta. Nestáva sa často, aby kniha dala čitateľom možnosť prehodnotiť prakticky všetko konanie človeka ako druhu. A presne to sa podarilo Hararimu v jeho zhrňujúcom, ale zrozumiteľnom pohľade na dejiny ľudstva.\r\nHarariho kniha Sapiens: Stručná história ľudstva sa stala medzinárodným bestsellerom a doteraz vyšla v tridsiatich piatich krajinách. Jej obsah je zaujímavý a často aj zábavný, je napísaná živým, prístupným jazykom a vlastný text dopĺňajú fotografie, mapy, schémy a ilustrácie.\r\nThe Washington Post napísal: „Jedna z najlepších interpretácií nevídaného príbehu nášho divokého a ctižiadostivého druhu od samotného predstaviteľa Homo sapiens... Čertovsky dobrý príbeh. A len sotva ho niekto vyrozprával lepšie.... Nepustíte ho z rúk, kým ho nedočítate.“ \r\nBill Gates: “Knihu odporúčam každému, kto sa zaujíma o históriu a budúcnosť nášho druhu.\"', 'G1sHcK5769mdZt7AUDe1KebXsZ1d1mUyEw9ybycI.jpg', 2, '2020-02-12 04:51:25', '2020-02-12 04:51:25'),
(153, 'Odyseus. Prisaha', NULL, 'manfredi-massimo-odyseus-prisaha', NULL, 62, NULL, 'h6w8gqKbGvyRyhWQ5p880PZgqXDQmh5BE8Mf53tO.jpg', 2, '2020-07-03 03:27:19', '2020-07-03 03:27:19'),
(154, 'Alexander Veľký 1. Dedič ríše', NULL, 'manfredi-massimo-alexander-velky-1-dedic-rise', NULL, 62, NULL, '01zE9dg5eu0rDSBuRQWJnj2dPyUTNbyvCWPrJji0.jpg', 2, '2020-07-03 03:29:16', '2020-07-03 03:29:16'),
(155, 'Alexander Veľký 2. Veštba Amonova', NULL, 'manfredi-massimo-alexander-velky-2-vestba-amonova', 2019, 62, NULL, 'NqnQCO9K7LSEKyoErLYT4QLFH88tuthN334EIbIw.jpg', 2, '2020-07-03 03:29:41', '2020-07-03 03:29:41'),
(156, 'Alexander Veľký 3. Dobyvateľ', NULL, 'manfredi-massimo-alexander-velky-3-dobyvatel', 2019, 62, NULL, 'SUdesfHI2mqV9UTHIYWwSshiaTOe6AK7rk4ZwWSL.jpg', 2, '2020-07-03 03:30:03', '2020-07-03 03:30:03'),
(157, 'Príbeh včiel', NULL, 'maja-lunde-pribeh-vciel', 2018, 63, 'Nórska spisovateľka Maja Lunde vo svojom mimoriadne úspešnom románe sleduje osudy troch generácií včelárov a na pozadí celosvetovej ekologickej krízy spriada pútavý príbeh o ich vzťahu nielen ku včelám a k prírode, ale aj k rodine. William je melancholický biológ a obchodník s osivom v Anglicku v roku 1852. Sníva o tom, že zhotoví úplne nový typ včelieho úľa, ktorý prinesie slávu a rešpekt jemu i jeho deťom. George chová včely na americkom Stredozápade v čase, keď mnohí včelári v Spojených štátoch zaznamenávajú nevídaný úhyn včelstiev. Záchranu vidí v synovi Tomovi, ten má však celkom iné plány, ako pokračovať v otcových šľapajach. Číňanka Tao je mladá matka, ktorá na úsvite dystopického 22. storočia ručne opeľuje ovocné stromy. Spočiatku sú vzťahy medzi týmito tromi hrdinami nejasné, no napokon sa ukáže, že ich osudy navzájom úzko súvisia.', 'JtTv4P2zZWPJsSF8z8eVbP5HwwbDodRAWoUfFCbm.jpg', 2, '2020-07-03 03:34:45', '2020-07-03 03:34:45');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `book_categories`
--

CREATE TABLE `book_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `book_categories`
--

INSERT INTO `book_categories` (`id`, `nazov`, `slug`) VALUES
(1, 'Bibliografie, životopisy', 'bibliografie-zivotopisy'),
(2, 'Pre deti a mládež', 'pre-deti-a-mladez'),
(3, 'Domov, hobby', 'domov-hobby'),
(4, 'Ekonomika, právo', 'ekonomika-pravo'),
(5, 'Mystika, ezoterika', 'mystika-ezoterika'),
(6, 'Cestovanie', 'cestovanie'),
(7, 'História', 'historia'),
(8, 'Manažment, podnikanie', 'manazment-podnikanie'),
(9, 'Medicína, zdravie', 'medicina-zdravie'),
(10, 'Motivačná literatúra', 'motivacna-literatura'),
(11, 'Náboženstvo', 'nabozenstvo'),
(12, 'Počítače, internet', 'pocitace-internet'),
(13, 'Poézia', 'poezia'),
(14, 'Potraviny, stravovanie', 'potraviny-stravovanie'),
(15, 'Prírodné vedy', 'prirodne-vedy'),
(16, 'Spoločenské vedy', 'spolocenske-vedy'),
(17, 'Próza', 'proza'),
(18, 'Šport', 'sport'),
(19, 'Technika', 'technika'),
(20, 'Umenie', 'umenie'),
(21, 'Zvieratá', 'zvierata'),
(22, 'Vojna', 'vojna'),
(23, 'Scifi', 'scifi'),
(24, 'Romány', 'romany'),
(25, 'Komédie', 'komedie'),
(26, 'Tragédia', 'tragedia'),
(27, 'Fantasy', 'fantasy');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `book_comments`
--

CREATE TABLE `book_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `book_comments`
--

INSERT INTO `book_comments` (`id`, `book_id`, `user_id`, `rating`, `text`, `created_at`, `updated_at`) VALUES
(1, 83, 1, 2, NULL, '2018-06-12 13:50:26', '2018-06-12 13:50:26'),
(2, 69, 1, 5, NULL, '2018-06-12 13:50:44', '2018-06-12 13:50:44'),
(3, 72, 1, 5, NULL, '2018-06-19 11:06:50', '2018-06-19 11:06:50'),
(4, 68, 1, 5, NULL, '2018-06-19 11:06:58', '2018-06-19 11:06:58'),
(5, 58, 2, 5, NULL, '2018-06-23 10:02:30', '2018-06-23 10:02:30'),
(6, 85, 2, 4, NULL, '2018-06-29 15:08:11', '2018-06-29 15:08:11'),
(7, 88, 2, 4, 'Takúto knihu som od slovenského autora nečakal. Je zaujímavá, miestami som sa ťažšie orientoval v čase a realite ale aj tak určite stojí za prečítanie. V niečom mi to pripomínalo film Fontána(Hugh Jackman, Rachel Weisz). Samotná kniha má krásne ilustrácie od starého otca autora knihy.', '2018-07-03 11:05:01', '2018-07-03 11:25:17'),
(8, 89, 2, 3, 'V knihe ide o objasnenie príchodu Orkov do Azerothu, hlavne klanu Forstwolf. Nerozpráva žiadny strhujúci príbeh, dôležité bolo vysvetliť prečo orkovia opustili svoj svet a to kniha splnila. Oproti iným knihám zo sveta Warcraftu je ale slabšia.', '2018-07-17 15:56:33', '2018-07-24 09:54:53'),
(9, 105, 2, 4, 'Popis toho ako sa Murakami stal spisovateľom, čo je podľa neho dôležité a ako by mal autor pristupovať k písaniu ale aj k pozorovaniu života. Niektoré pasáže sú viac mimo témy, napríklad pár odsekov o správnosti využívania/nevyužívania atómových elektrární. Na konci je objasnené že kapitoly vznikali počas dlhšieho obdobia ako eseje. Určite odporúčam pre niekoho kto by sa chcel zaoberať písaním.', '2018-08-03 18:38:38', '2018-10-25 17:28:55'),
(10, 98, 2, 3, NULL, '2018-08-08 16:24:55', '2018-08-08 16:24:55'),
(11, 106, 2, 4, NULL, '2018-08-27 03:46:20', '2018-08-27 03:46:20'),
(12, 118, 2, 3, NULL, '2018-09-16 14:44:36', '2018-09-16 14:44:36'),
(13, 124, 1, 5, NULL, '2018-10-01 11:05:24', '2018-10-01 11:05:24'),
(14, 13, 2, 5, NULL, '2018-10-07 16:11:44', '2018-10-07 16:11:44'),
(15, 1, 2, 5, NULL, '2018-10-24 12:45:25', '2018-10-24 12:45:25'),
(18, 119, 2, 3, NULL, '2018-11-04 11:02:54', '2018-11-04 11:02:54'),
(19, 126, 2, 5, NULL, '2018-12-05 19:15:18', '2018-12-05 19:15:18'),
(20, 131, 2, 4, NULL, '2018-12-11 17:39:55', '2018-12-11 17:39:55'),
(21, 53, 2, 4, NULL, '2018-12-16 20:33:00', '2018-12-16 20:33:00'),
(22, 132, 2, 5, NULL, '2018-12-17 05:07:24', '2018-12-17 05:07:24'),
(24, 139, 2, 4, NULL, '2019-02-24 06:48:26', '2019-02-24 06:48:26'),
(25, 141, 2, 5, NULL, '2019-03-25 06:40:07', '2019-03-25 06:40:07'),
(26, 138, 2, 4, NULL, '2019-05-27 15:29:11', '2019-05-27 15:29:11'),
(27, 142, 2, 4, NULL, '2019-07-08 05:56:57', '2019-07-08 05:56:57'),
(28, 147, 2, 3, NULL, '2019-07-20 14:13:05', '2019-07-20 14:13:05'),
(29, 149, 2, 5, 'Knihu som zatiaľ nedočítal, je písaná zvláštnym spôsobom. Akoby ste sami počúvali emotívne spomienky ľudí, ktorých táto katastrofa zasiahla. Veľmi pekné, tak umelecké, precítené a smutné...', '2019-09-23 05:27:14', '2019-09-23 05:27:14'),
(30, 150, 2, 5, NULL, '2020-02-05 11:28:55', '2020-02-05 11:28:55'),
(31, 151, 2, 5, 'Veľmi dobrá kniha, aj keď slovo dobrá mi k hrôzam ktoré sa v nej opisujú nehodí. Slovenských autorov väčšinou nečítam, ale a možno aj preto je toto pre mňa jedna z najlepších.\r\nMali by ju zaradiť k povinému čítaniu... (ak už nie je)', '2020-02-12 04:43:24', '2020-02-12 04:56:14'),
(32, 152, 2, 5, NULL, '2020-07-03 03:22:13', '2020-07-03 03:22:13');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `book_join_categories`
--

CREATE TABLE `book_join_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `book_category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `book_join_categories`
--

INSERT INTO `book_join_categories` (`id`, `book_id`, `book_category_id`, `created_at`, `updated_at`) VALUES
(1, 81, 15, NULL, NULL),
(2, 89, 27, NULL, NULL),
(3, 88, 5, NULL, NULL),
(4, 101, 13, NULL, NULL),
(5, 98, 5, NULL, NULL),
(9, 86, 2, NULL, NULL),
(10, 106, 7, NULL, NULL),
(11, 106, 26, NULL, NULL),
(12, 106, 22, NULL, NULL),
(16, 109, 27, NULL, NULL),
(17, 110, 27, NULL, NULL),
(18, 111, 27, NULL, NULL),
(19, 112, 27, NULL, NULL),
(20, 108, 27, NULL, NULL),
(22, 107, 27, NULL, NULL),
(23, 107, 2, NULL, NULL),
(25, 114, 13, NULL, NULL),
(26, 113, 13, NULL, NULL),
(27, 115, 27, NULL, NULL),
(28, 115, 2, NULL, NULL),
(30, 122, 10, NULL, NULL),
(31, 121, 10, NULL, NULL),
(32, 68, 10, NULL, NULL),
(33, 68, 24, NULL, NULL),
(34, 68, 16, NULL, NULL),
(35, 1, 10, NULL, NULL),
(36, 1, 24, NULL, NULL),
(37, 1, 16, NULL, NULL),
(38, 128, 24, NULL, NULL),
(39, 129, 24, NULL, NULL),
(40, 130, 22, NULL, NULL),
(42, 133, 10, NULL, NULL),
(43, 133, 5, NULL, NULL),
(44, 132, 8, NULL, NULL),
(46, 135, 25, NULL, NULL),
(47, 136, 25, NULL, NULL),
(48, 137, 25, NULL, NULL),
(49, 134, 25, NULL, NULL),
(51, 139, 16, NULL, NULL),
(52, 140, 10, NULL, NULL),
(53, 140, 5, NULL, NULL),
(54, 142, 16, NULL, NULL),
(55, 144, 10, NULL, NULL),
(56, 148, 1, NULL, NULL),
(57, 149, 7, NULL, NULL),
(68, 151, 26, NULL, NULL),
(69, 151, 22, NULL, NULL),
(70, 152, 11, NULL, NULL),
(71, 152, 15, NULL, NULL),
(72, 152, 16, NULL, NULL),
(73, 153, 7, NULL, NULL),
(74, 154, 7, NULL, NULL),
(75, 155, 7, NULL, NULL),
(76, 157, 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `book_statuses`
--

CREATE TABLE `book_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `on_page` int(11) DEFAULT '0',
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `book_statuses`
--

INSERT INTO `book_statuses` (`id`, `book_id`, `user_id`, `on_page`, `status`, `created_at`, `updated_at`) VALUES
(5, 58, 2, 0, 1, '2018-06-03 05:58:10', '2018-06-23 10:02:27'),
(7, 85, 2, 0, 1, '2018-06-23 10:02:34', '2018-06-29 15:08:08'),
(8, 88, 2, 0, 1, '2018-06-25 04:32:45', '2018-07-03 11:04:57'),
(9, 89, 2, 0, 1, '2018-07-03 11:09:52', '2018-07-17 15:56:30'),
(10, 95, 2, 0, 1, '2018-07-09 05:12:55', '2018-07-09 05:12:56'),
(11, 96, 2, 0, 1, '2018-07-09 05:21:56', '2018-07-09 05:21:57'),
(12, 68, 2, 0, 1, '2018-07-09 05:22:10', '2018-07-09 05:22:11'),
(13, 97, 2, 0, 1, '2018-07-09 05:27:36', '2018-07-09 05:27:37'),
(14, 98, 2, 0, 1, '2018-07-09 05:29:02', '2018-07-09 05:29:03'),
(15, 99, 2, 0, 1, '2018-07-09 05:30:37', '2018-07-09 05:30:38'),
(16, 100, 2, 0, 1, '2018-07-09 05:40:51', '2018-07-09 05:40:51'),
(17, 101, 2, 0, 1, '2018-07-09 05:40:53', '2018-07-09 05:40:54'),
(18, 102, 2, 0, 1, '2018-07-09 05:41:00', '2018-07-09 05:41:01'),
(19, 103, 2, 0, 1, '2018-07-09 05:41:04', '2018-07-09 05:41:05'),
(21, 105, 2, 0, 1, '2018-07-24 04:00:46', '2018-08-10 03:59:33'),
(22, 106, 2, 0, 1, '2018-08-10 03:59:29', '2018-08-27 03:46:04'),
(23, 86, 2, 0, 1, '2018-08-27 03:46:38', '2018-08-29 15:21:34'),
(24, 107, 2, 0, 1, '2018-08-31 05:39:06', '2018-09-09 09:28:11'),
(25, 118, 2, 0, 1, '2018-09-09 09:28:33', '2018-09-16 14:44:30'),
(26, 119, 2, 0, 1, '2018-09-16 14:44:58', '2018-11-04 11:02:50'),
(30, 126, 2, 0, 1, '2018-11-04 11:03:01', '2018-12-05 19:15:16'),
(31, 130, 2, 0, 1, '2018-12-07 14:55:52', '2018-12-07 14:55:53'),
(32, 131, 2, 0, 1, '2018-12-07 15:00:01', '2018-12-11 17:39:52'),
(33, 53, 2, 0, 1, '2018-12-11 17:40:13', '2018-12-16 20:32:38'),
(34, 132, 2, 0, 1, '2018-12-17 05:07:10', '2018-12-17 05:07:13'),
(35, 133, 2, 0, 1, '2018-12-17 05:09:18', '2018-12-21 13:52:56'),
(36, 137, 2, 0, 1, '2018-12-22 11:49:47', '2018-12-26 19:19:41'),
(37, 138, 2, 0, 1, '2018-12-26 19:22:35', '2019-05-27 15:29:09'),
(38, 139, 2, 0, 1, '2019-01-29 20:02:54', '2019-02-24 06:48:17'),
(39, 13, 2, 0, 1, '2019-02-15 04:37:10', '2019-03-02 07:11:21'),
(40, 141, 2, 0, 1, '2019-03-06 15:20:11', '2019-03-25 06:40:04'),
(41, 142, 2, 0, 1, '2019-04-01 08:45:38', '2019-07-08 05:56:54'),
(43, 144, 2, 0, 0, '2019-06-17 04:23:42', '2019-06-17 04:23:42'),
(44, 145, 2, 0, 0, '2019-06-18 11:06:40', '2019-06-18 11:06:40'),
(45, 147, 2, 0, 1, '2019-07-20 14:12:27', '2019-07-20 14:12:29'),
(46, 146, 2, 0, 1, '2019-07-20 14:12:44', '2019-09-06 13:54:19'),
(47, 148, 2, 0, 0, '2019-09-10 04:08:16', '2019-09-10 04:08:16'),
(48, 149, 2, 0, 1, '2019-09-23 05:23:37', '2019-11-11 06:06:35'),
(49, 127, 2, 0, 1, '2019-11-04 06:52:53', '2019-11-11 06:06:47'),
(50, 28, 2, 0, 1, '2019-11-18 11:16:02', '2020-01-09 05:06:35'),
(51, 125, 2, 0, 1, '2020-01-09 05:06:44', '2020-02-05 11:23:14'),
(53, 151, 2, 0, 1, '2020-02-12 04:43:18', '2020-02-12 04:43:20'),
(54, 152, 2, 0, 1, '2020-02-12 04:51:30', '2020-07-03 03:22:01'),
(55, 153, 2, 0, 0, '2020-07-03 03:27:26', '2020-07-03 03:27:26'),
(56, 157, 2, 0, 0, '2020-07-03 03:34:52', '2020-07-03 03:34:52');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `favorit_author`
--

CREATE TABLE `favorit_author` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `favorit_author`
--

INSERT INTO `favorit_author` (`id`, `user_id`, `author_id`, `created_at`, `updated_at`, `rank`) VALUES
(9, 2, 1, '2020-04-26 07:19:44', '2020-04-26 07:19:44', 0),
(10, 2, 4, '2020-04-26 07:19:46', '2020-04-26 07:19:46', 1),
(11, 2, 2, '2020-04-26 07:19:53', '2020-04-26 07:19:53', 2);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `favorit_book`
--

CREATE TABLE `favorit_book` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `favorit_book`
--

INSERT INTO `favorit_book` (`id`, `user_id`, `book_id`, `created_at`, `updated_at`, `rank`) VALUES
(20, 2, 1, NULL, '2019-01-30 05:11:11', 1),
(21, 2, 68, NULL, '2020-04-26 07:13:04', 2),
(25, 2, 13, NULL, '2020-04-26 07:18:22', 3),
(29, 2, 4, '2018-11-09 21:20:33', '2020-04-26 07:18:22', 4);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `groups`
--

INSERT INTO `groups` (`id`, `nazov`, `description`) VALUES
(1, 'Moderátor 1tr.', 'upravovať knihy, autorov, citáty'),
(2, 'Moderátor 2tr.', 'upravovať a vymazávať knihy, autorov, citáty'),
(3, 'Administrátor', 'obyčajný admin');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `group_join_permission`
--

CREATE TABLE `group_join_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `group_join_permission`
--

INSERT INTO `group_join_permission` (`id`, `permission_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 16, 1, NULL, NULL),
(3, 14, 1, NULL, NULL),
(29, 1, 2, NULL, NULL),
(30, 11, 2, NULL, NULL),
(31, 18, 2, NULL, NULL),
(32, 19, 2, NULL, NULL),
(33, 20, 2, NULL, NULL),
(34, 16, 2, NULL, NULL),
(35, 17, 2, NULL, NULL),
(36, 14, 2, NULL, NULL),
(37, 15, 2, NULL, NULL),
(38, 22, 2, NULL, NULL),
(39, 1, 3, NULL, NULL),
(40, 11, 3, NULL, NULL),
(41, 18, 3, NULL, NULL),
(42, 19, 3, NULL, NULL),
(43, 13, 3, NULL, NULL),
(44, 16, 3, NULL, NULL),
(45, 12, 3, NULL, NULL),
(46, 14, 3, NULL, NULL),
(47, 15, 3, NULL, NULL),
(48, 6, 3, NULL, NULL),
(49, 7, 3, NULL, NULL),
(50, 8, 3, NULL, NULL),
(51, 21, 3, NULL, NULL),
(52, 22, 3, NULL, NULL),
(53, 4, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `group_join_user`
--

CREATE TABLE `group_join_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `group_join_user`
--

INSERT INTO `group_join_user` (`id`, `user_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, NULL, NULL),
(2, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_10_133235_create_permission_table', 1),
(4, '2018_05_10_183858_create_nations_table', 1),
(5, '2018_05_11_125220_create_group_tables', 1),
(6, '2018_05_11_164716_create_authors_table', 1),
(7, '2018_05_16_152645_create_books_table', 1),
(8, '2018_05_16_152736_create_book_categories_table', 1),
(9, '2018_05_18_173521_create_quote_categories_table', 1),
(10, '2018_05_18_173615_create_quotes_table', 1),
(11, '2018_06_01_155743_create_book_statuses_table', 2),
(12, '2018_06_02_184215_create_book_comments_table', 2),
(13, '2018_06_20_144232_add_votes_quote_table', 3),
(14, '2018_06_20_175205_create_contacts_table', 4),
(15, '2018_06_23_142138_create_blog_posts_table', 5),
(16, '2018_09_11_172917_create_news_table', 6),
(17, '2018_10_07_074035_create_favorit_author_table', 7),
(18, '2018_10_07_104830_create_favorit_book_table', 7),
(21, '2018_10_08_180821_create_user_profiles_table', 8),
(22, '2018_10_09_145041_add_fav_book_auth_columns', 8),
(23, '2018_10_11_140325_create_relations_table', 9),
(24, '2018_10_18_143128_edit_blog_table', 10),
(25, '2019_05_22_121231_create_bazaar_categories_table', 11),
(26, '2019_05_22_121438_create_bazaar_subcategories_table', 11);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `nations`
--

CREATE TABLE `nations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_nation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skratka_nation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_nation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `nations`
--

INSERT INTO `nations` (`id`, `name_nation`, `skratka_nation`, `flag_nation`, `created_at`, `updated_at`) VALUES
(1, 'Afganistan', '', 'fe3cd0c3-996e-43b9-a0b1-9c4c9db79fd9.png', NULL, NULL),
(2, 'Albánsko', '', '3d9b2450-67e0-44c0-a766-8576cdc45dec.png', NULL, NULL),
(3, 'Alžírsko', '', '10e95c20-62f0-458e-9c86-31f26cf4b042.png', NULL, NULL),
(4, 'Andora', '', '84841401-1ec4-4f65-9a5b-57263d444bed.png', NULL, NULL),
(5, 'Angola', '', 'a7d444d2-fe75-4491-96a4-6be67df15ccd.png', NULL, NULL),
(6, 'Argentína', '', '92f75bbf-de09-40da-bc59-3d1f3cb2c3bf.png', NULL, NULL),
(7, 'Arménsko', '', '7577108d-70e8-4c54-b273-368397890962.png', NULL, NULL),
(8, 'Austrália', '', 'c1e450fe-8d9f-49a3-889f-470f3e5e0038.png', NULL, NULL),
(9, 'Rakúsko', '', 'fbe0af44-1464-4bad-8ad5-3fe2c7f41c5e.png', NULL, NULL),
(10, 'Azerbajdžan', '', '8509eae1-f76d-428a-a6d2-18187a2c8d92.png', NULL, NULL),
(11, 'Bahrain', '', '94910661-73b5-47b7-ab19-773ff3c2deee.png', NULL, NULL),
(12, 'Bielorusko', '', '58635362-4f82-4a27-b539-8aaa34f4a533.png', NULL, NULL),
(13, 'Belgicko', '', 'd0e2d447-7998-4dd3-9250-e0372318920a.png', NULL, NULL),
(14, 'Bolivia', '', 'c33f073f-03cc-4db1-b091-96dc6b05cb7a.png', NULL, NULL),
(15, 'Bosna a Hercegovina', '', '8d3f3b6c-7634-4e11-8c31-a082c7e50bb5.png', NULL, NULL),
(16, 'Botswana', '', 'c38d5944-84f4-48f3-bdbd-77d3c5f9b2e9.png', NULL, NULL),
(17, 'Brazília', '', '10a7d1df-d450-4d0e-b3f5-3152a22d1e1c.png', NULL, NULL),
(18, 'Britské Ostrovy', '', 'ec273913-abd5-4e6b-a3fb-1e3ead06734e.png', NULL, NULL),
(19, 'Bulharsko', '', '00d8449f-20f0-433f-80db-697f49c9ad48.png', NULL, NULL),
(20, 'Burkina Faso', '', '50c615ee-604f-45f9-bb14-124063d67057.png', NULL, NULL),
(21, 'Kambodža', '', 'e4a7096b-f4ae-42c8-b35c-dc9f83dca4a5.png', NULL, NULL),
(22, 'Kamerun', '', '6cdc1119-bac0-42bc-a811-f2057156e64b.png', NULL, NULL),
(23, 'Kanada', '', 'df13b57f-f3f1-4823-8f11-c566ccbd70eb.png', NULL, NULL),
(24, 'Chile', '', '558b4d28-3293-4bc2-a512-d6e67928a9dd.png', NULL, NULL),
(25, 'Čína', '', '2ea97720-3b44-4a3d-a9f7-ffbeda258a6a.png', NULL, NULL),
(26, 'Kolumbia', '', '2c810468-e7e4-4893-b73f-f83193dedf45.png', NULL, NULL),
(27, 'Kostarika', '', '4109f370-f81b-42e2-b310-269a328d165a.png', NULL, NULL),
(28, 'Pobrežie Slonoviny', '', '2887d2f4-a2e0-4ac3-9878-00c44d8fe87d.png', NULL, NULL),
(29, 'Chorvátsko', '', '15a7813f-5dc6-49b8-ab52-774e1fd2112d.png', NULL, NULL),
(30, 'Kuba', '', '2245c438-7f09-4a63-8c2e-96bf73141f66.png', NULL, NULL),
(31, 'Cyprus', '', '1a58d03d-40d4-460b-8bb9-83c90258dd45.png', NULL, NULL),
(32, 'Česká republika', '', 'ad76a9bc-7ac5-4391-a252-b41d5da6094d.png', NULL, NULL),
(33, 'Dánsko', '', '5b71b77b-1e7b-42b1-9d5e-aabb00387390.png', NULL, NULL),
(34, 'Ekvádor', '', 'eb79aff7-bd82-476c-8e42-afa5de3d20ec.png', NULL, NULL),
(35, 'Egypt', '', 'd69a4683-c109-4f6a-a0de-894178a698d3.png', NULL, NULL),
(36, 'Anglicko', '', 'f5242147-6f6f-4a89-9327-a09a33e1e3de.png', NULL, NULL),
(37, 'Fínsko', '', '265fe51a-8049-4d01-8868-dc8924fe0080.png', NULL, NULL),
(38, 'Estónsko', '', '821e973c-b364-497f-b2a8-7f4267bb7e9e.png', NULL, NULL),
(39, 'Francúzsko', '', 'fd6a8cef-32d0-4e26-a67f-e1d58854ef97.png', NULL, NULL),
(40, 'Gruzínsko', '', '8a9122b1-9dbf-42ab-b60b-73fb0e4f966c.png', NULL, NULL),
(41, 'Nemecko', '', '3fec598b-be0c-47d7-98fd-0c42f011f965.png', NULL, NULL),
(42, 'Ghana', '', '63162c07-35a1-45a7-ab2c-ebddb8ef526a.png', NULL, NULL),
(43, 'Gibraltár', '', 'a0acfe48-9976-4dfd-ae81-7086ab973ed2.png', NULL, NULL),
(44, 'Grécko', '', '7a1ad1c0-2405-447e-be76-a2eb3b87fa8c.png', NULL, NULL),
(45, 'Honduras', '', '7b6b8f93-3d5c-45c9-8d41-793154de8e46.png', NULL, NULL),
(46, 'Haiti', '', '412dd01e-ed25-41b5-8aa9-67b586deeae2.png', NULL, NULL),
(47, 'Maďarsko', '', '63a86fcf-7613-4faf-be63-ae6f44a36a0a.png', NULL, NULL),
(48, 'Island', '', '39eaeab8-5887-4ba6-9587-2b7450fbc3c1.png', NULL, NULL),
(49, 'India', '', '1624043f-729b-4434-8aab-767bb725ad3f.png', NULL, NULL),
(50, 'Indonézia', '', 'cbb05b6a-81e4-47fd-8ca3-58e4559dde30.png', NULL, NULL),
(51, 'Irán', '', '3496188b-da7a-4c6b-adec-783c94ec8403.png', NULL, NULL),
(52, 'Iraq', '', 'f0742da6-7381-4c15-9138-52cbe1902f3d.png', NULL, NULL),
(53, 'Írsko', '', '4a167f92-ab07-4983-b594-b4b6102a8e84.png', NULL, NULL),
(54, 'Izrael', '', '5bfffd98-b8b0-45db-b897-d9c15229dbea.png', NULL, NULL),
(55, 'Taliansko', '', '0f887d58-9f16-499a-98cb-1856b6c6280f.png', NULL, NULL),
(56, 'Jamaika', '', 'a7529ec1-bb25-40bf-ae04-cf9ffe22a33a.png', NULL, NULL),
(57, 'Japonsko', '', '59632f65-0409-4f3b-a4dc-b49ff6a826ca.png', NULL, NULL),
(58, 'Jordánsko', '', '1a5e89be-8f2b-4384-9eab-4572f5cb14b8.png', NULL, NULL),
(59, 'Kazachstan', '', 'fcfd5cbb-9915-424c-8c1a-6a1890f50d6e.png', NULL, NULL),
(60, 'Keňa', '', 'e17878a5-edda-4b67-a293-f8ed63dfaedf.png', NULL, NULL),
(61, 'Kuvajt', '', 'c9efe0a8-deb1-4a30-ac7c-a6e9a5f28e54.png', NULL, NULL),
(62, 'Kirgizsko', '', '8bf14d16-e85a-41dd-8077-f3bd43ba936f.png', NULL, NULL),
(63, 'Laos', '', '3cd6412b-73b7-4684-9c17-53e243b2f266.png', NULL, NULL),
(64, 'Lotyšsko', '', 'e79d32ac-0129-4cf0-8308-be7db4cfa5af.png', NULL, NULL),
(65, 'Libanon', '', '27e8ab67-f907-4978-ba81-af1664f0dd1d.png', NULL, NULL),
(66, 'Líbya', '', 'a56e8891-e052-4896-b3a7-7654d3603790.png', NULL, NULL),
(67, 'Lichtenštajnsko', '', '00e98dda-d8d7-4fb4-b091-b6cbb7c4d33d.png', NULL, NULL),
(68, 'Litva', '', '39d08c2d-8083-460f-b588-01e5f7ea1ce0.png', NULL, NULL),
(69, 'Luxembursko', '', '6e6f7943-495b-4de7-9cf9-507732d8c826.png', NULL, NULL),
(70, 'Macedónsko', '', '889bd028-eee3-4f6c-aa95-397364f4896f.png', NULL, NULL),
(71, 'Madagaskar', '', '0af4e917-f864-4e1a-b64e-b37506d73c41.png', NULL, NULL),
(72, 'Malajzia', '', '9d8e4147-ae6d-400a-bcf6-6106fec0f00f.png', NULL, NULL),
(73, 'Mali', '', '29b45f4f-935b-4c80-8c3c-781af55c3d43.png', NULL, NULL),
(74, 'Malta', '', '8a722449-291f-4175-9a69-0ceafdab041c.png', NULL, NULL),
(75, 'Mexiko', '', '50c5d5f7-5c41-46d3-9b78-87998dc9de92.png', NULL, NULL),
(76, 'Mikronézia', '', '31a37ef7-f320-4a54-a57b-61800cd45a29.png', NULL, NULL),
(77, 'Moldavsko', '', 'f4201ae3-ced7-4795-8b1c-fffda1a066a0.png', NULL, NULL),
(78, 'Monako', '', 'f807367f-0c9d-47c0-9203-bf3df5e31396.png', NULL, NULL),
(79, 'Čierna Hora', '', '4d91f9ca-d81d-4cbb-858f-8d11538a74d7.png', NULL, NULL),
(80, 'Maroko', '', 'df03424f-be20-4893-97f4-b2fc09904328.png', NULL, NULL),
(81, 'Nepál', '', 'e7df30c0-bd47-4673-813f-88bc8f623232.png', NULL, NULL),
(82, 'Holandsko', '', '4ea2ad14-5036-430a-9451-510ac755d015.png', NULL, NULL),
(83, 'Nový Zéland', '', 'a444f312-6335-4c05-9d52-90d49b0acaa5.png', NULL, NULL),
(84, 'Nikaragua', '', '5d565315-a041-405a-9b19-97abbac0433c.png', NULL, NULL),
(85, 'Niger', '', 'bc460aae-d8fa-428f-a661-6b7cf6582958.png', NULL, NULL),
(86, 'Nigéria', '', 'dd5028fb-bc6a-47e9-94ca-07665292d433.png', NULL, NULL),
(87, 'Severná Kórea', '', 'c95cb9b6-42fc-4ede-8c66-ebb66faa8c1f.png', NULL, NULL),
(88, 'Nórsko', '', '9e07b158-4de9-465b-9a41-38a1a67a68ed.png', NULL, NULL),
(89, 'Omán', '', '6ab19477-06f4-4b21-9c19-721e8ffb030e.png', NULL, NULL),
(90, 'Pakistan', '', 'db4228aa-e91f-429c-98f9-5da5ebcaa267.png', NULL, NULL),
(91, 'Palestína', '', 'e66146f6-5bde-452b-8856-fa86e25d7c9e.png', NULL, NULL),
(92, 'Paraguaj', '', 'd3d85999-ff53-4d75-ba1b-0434417ed977.png', NULL, NULL),
(93, 'Peru', '', '772f25af-a215-4030-83fe-d832f41b1bb8.png', NULL, NULL),
(94, 'Filipíny', '', '98181903-b45e-4808-a179-7d589d7ec748.png', NULL, NULL),
(95, 'Poľsko', '', 'fa94aeb3-6d95-476d-872d-01de1a746e25.png', NULL, NULL),
(96, 'Portugalsko', '', '5d6087dd-50a2-402e-a883-7ba0dade571d.png', NULL, NULL),
(97, 'Katar', '', 'c6f3d3c2-1740-4e85-94b1-171a46aa5871.png', NULL, NULL),
(98, 'Rumunsko', '', '31a4d7e8-bcee-485f-b140-5698143a6d19.png', NULL, NULL),
(99, 'Rusko', '', '1fc22ea3-3967-48f6-93d2-20fafa32873c.png', NULL, NULL),
(100, 'Saudská Arábia', '', '26063537-d2fd-4de1-b074-27abf45d339c.png', NULL, NULL),
(101, 'Škótsko', '', 'd9bc7909-1b49-436e-9a14-f8cfddc743b6.png', NULL, NULL),
(102, 'Senegal', '', 'b3cfd042-111c-4e44-81b5-1cfa05df1287.png', NULL, NULL),
(103, 'Srbsko', '', '42440347-cca5-4e5c-8a1b-bf718b9fec5a.png', NULL, NULL),
(104, 'Slovensko', '', '0ba4f61c-8fe4-49e0-884c-ba697c03aaef.png', NULL, NULL),
(105, 'Slovinsko', '', '3ac6af80-2bfb-44ec-b686-3c6381466200.png', NULL, NULL),
(106, 'Južná Afrika', '', 'b054a9a1-15cb-4d5a-8bc3-8d11aee30c32.png', NULL, NULL),
(107, 'Južná Kórea', '', 'b00e8274-de15-4134-ab92-efd8eb2ec611.png', NULL, NULL),
(108, 'Južný Sudán', '', '45a9162e-1df2-4e32-b398-f81fbcd9fe54.png', NULL, NULL),
(109, 'Španielsko', '', '05ad025f-09bf-45d4-bf64-30c26a603cb7.png', NULL, NULL),
(110, 'Srí Lanka', '', 'db6e04ac-92a7-4c77-a165-b3575b84d572.png', NULL, NULL),
(111, 'Sudán', '', 'cbdd23ca-f59d-4f1c-b60b-88ede0c5909a.png', NULL, NULL),
(112, 'Švédsko', '', 'b599d211-41c1-4e93-8504-319fb7317b05.png', NULL, NULL),
(113, 'Švajčiarsko', '', '2ef8df8f-e280-4aaf-80db-c704b93755ae.png', NULL, NULL),
(114, 'Sýria', '', 'e3445247-1942-4b06-8dae-e173805a17a5.png', NULL, NULL),
(115, 'Taiwan', '', 'a227635e-48e5-44ee-bbba-12908c1ded5b.png', NULL, NULL),
(116, 'Thajsko', '', 'e5572496-f232-4d9a-a547-6d173b17b044.png', NULL, NULL),
(117, 'Togo', '', 'b7507bf0-5c0d-40b8-9122-0132641a9f1e.png', NULL, NULL),
(118, 'Trinidad a Tobago', '', 'e3010d4d-6db3-41d5-97b0-55ed429240d6.png', NULL, NULL),
(119, 'Tunisko', '', '612ba8b9-d8ec-423c-835e-93712e195f57.png', NULL, NULL),
(120, 'Turecko', '', 'e312f521-ff84-4357-9599-0db33303f249.png', NULL, NULL),
(121, 'Uganda', '', 'c1bc78ee-1ffa-4745-919b-20d1dd717362.png', NULL, NULL),
(122, 'Ukraina', '', '75ecd2ed-674a-4bec-a179-992b4c528500.png', NULL, NULL),
(123, 'Spojené arabské emiráty', '', 'd6b7fec2-17b7-4928-a034-6c753004aa04.png', NULL, NULL),
(124, 'Veľká Británia', '', '43202772-bce7-4a7d-ac57-48d9fd15332e.png', NULL, NULL),
(125, 'USA', '', '6eeff387-ffa0-49e6-a3ef-6e69ef694bc9.png', NULL, NULL),
(126, 'Uruguaj', '', '7817c2a1-93ad-41b9-bb77-f07cf09fceaf.png', NULL, NULL),
(127, 'Uzbekistan', '', '7f561866-6e78-4ad9-b8f3-43df58130545.png', NULL, NULL),
(129, 'Venezuela', '', '1d75b542-08de-4e0b-a610-f8aeefa20803.png', NULL, NULL),
(130, 'Vietnam', '', '1226612d-0dcf-436e-ae46-d00caefe7a1e.png', NULL, NULL),
(131, 'Wales', '', '39b33815-b704-460c-a726-a93888889d7c.png', NULL, NULL),
(132, 'Jemen', '', 'cd94fffb-16d7-41dd-a73d-dc06aa31d5ae.png', NULL, NULL),
(133, 'Zambia', '', '722903cb-aab2-443f-9642-5979b407085c.png', NULL, NULL),
(134, 'Zimbabwe', '', '62fe0ef4-b75d-4b41-acf8-581047830980.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `public_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Doplnené nejaké tie funkcie. Hodnotenie kníh, vyhľadávanie na domovskej stránke, pridávanie kníh medzi prečítané/práve čítané...ešte niečo ale kto by to to rozpisoval.', '2018-05-05 20:30:00', '2018-09-16 12:40:44', '2018-09-16 12:40:44'),
(2, NULL, 'Doplnené nejaké tie funkcie, zase raz. Jednoduché hodnotenie citátov z kníh a možnosť kontaktovať ma cez stránku.', '2018-06-21 18:15:00', '2018-09-16 12:41:02', '2018-09-16 12:41:02'),
(3, 'admin:', 'Už dlhšie nič nepridané, no nie je čas a ani chuť. A aj tak sem nikto nechodí, ani ja.', '2019-06-18 08:34:12', '2019-06-18 06:32:18', '2019-06-18 06:34:12');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `permissions`
--

INSERT INTO `permissions` (`id`, `nazov`, `key`, `description`) VALUES
(1, 'Autori - upraviť', 'author_update', ''),
(2, 'POVOLENIA', 'permissions', ''),
(3, 'SKUPINY', 'groups', ''),
(4, 'UŽÍVATEĽ - SKUPINA', 'group_user', ''),
(5, 'UŽÍVATEĽ - POVOLENIE', 'permission_user', ''),
(6, 'Národnosti', 'nations', ''),
(7, 'Národnosti - pridať', 'nations_add', ''),
(8, 'Národnosti - upraviť', 'nations_update', ''),
(9, 'Národnosti - vymazať', 'nations_delete', ''),
(10, 'ADMIN | UŽÍVATELIA', 'admin_users', ''),
(11, 'Autori - vymazať', 'author_delete', ''),
(12, 'Knihy - Kategórie', 'book_categories', ''),
(13, 'Citáty - Kategórie', 'quote_categories', ''),
(14, 'Knihy - upraviť', 'book_update', ''),
(15, 'Knihy - vymazať', 'book_delete', ''),
(16, 'Citáty - upraviť', 'quote_update', ''),
(17, 'Citáty - vymazať', 'quote_delete', ''),
(18, 'Blog - pridat', 'blog_add', ''),
(19, 'Blog - upravit', 'blog_update', ''),
(20, 'Blog - vymazať', 'blog_delete', ''),
(21, 'News - index, add', 'admin_news', 'admin_news'),
(22, 'News - upraviť', 'admin_news_edit', 'admin_news_edit'),
(23, 'News - delete', 'admin_news_delete', 'admin_news_delete');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `permission_join_user`
--

CREATE TABLE `permission_join_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `permission_join_user`
--

INSERT INTO `permission_join_user` (`id`, `user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(9, 2, 1, NULL, NULL),
(10, 2, 11, NULL, NULL),
(11, 2, 18, NULL, NULL),
(12, 2, 19, NULL, NULL),
(13, 2, 20, NULL, NULL),
(14, 2, 13, NULL, NULL),
(15, 2, 16, NULL, NULL),
(16, 2, 17, NULL, NULL),
(17, 2, 12, NULL, NULL),
(18, 2, 14, NULL, NULL),
(19, 2, 15, NULL, NULL),
(20, 2, 6, NULL, NULL),
(21, 2, 7, NULL, NULL),
(22, 2, 8, NULL, NULL),
(23, 2, 9, NULL, NULL),
(24, 2, 23, NULL, NULL),
(25, 2, 21, NULL, NULL),
(26, 2, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `quotes`
--

CREATE TABLE `quotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `quoteCategory_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `votes` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `quotes`
--

INSERT INTO `quotes` (`id`, `text`, `author_id`, `book_id`, `quoteCategory_id`, `user_id`, `created_at`, `updated_at`, `votes`) VALUES
(1, 'Hľadať lásku? Nezmysel...hovorí rozum. Smiešne...hovorí hrdosť. Riskantne...bráni skúsenosť. \"ale samota ta zabíja\" šepká srdce!', 2, NULL, 24, 1, '2017-07-19 17:35:33', '2019-10-06 00:57:39', 3),
(2, 'Život je choroba a smrť začína narodením. Každé vydýchnutie a každý tep srdca je zároveň tak trochu umieraním - malým krôčikom ku koncu.', 2, NULL, 29, 1, '2017-07-19 17:36:04', '2020-02-27 00:42:58', 5),
(3, 'Vy ste zvláštny ľudia, vy mladí, všetci dohromady. Minulosť nenávidíte, prítomnosťou opovrhujete, budúcnosť je vám ľahostajná.', 2, NULL, 34, 1, '2017-07-19 17:37:48', '2020-02-28 16:16:36', 5),
(4, 'Veď človeka nestvorili na prehry, povedal. Možno ho zahubiť, ale nie poraziť.', 4, 12, 34, 1, '2017-07-20 15:59:54', '2020-02-28 18:26:24', 5),
(5, 'Miluji tě a vím, že v životě nebudu nikoho tak milovat, protože už nikdy nebudu takový, jako v tuto chvíli, jež mizí, zatímco já o ní mluvím a kterou nemohu zadržet ani za cenu svého života.', 2, 8, 24, 1, '2017-07-20 16:50:51', '2020-05-20 07:13:13', 7),
(6, 'Ve vzpomínce mi zazněl jeho smích. Pak jsem si vzpomněl na jednu příhodu ze stanice. Choval se letargicky; Sokrates mě náhle popadl za ramena a zatřásl mnou. „Probuď se! Kdybys s jistotou věděl, že máš smrtelnou nemoc a že ti zbývá už jen krátký čas života, nechtěl bys z toho času promarnit ani minutu.  A já ti říkám že máš smrtelnou nemoc. Jmenuje se narození. Nezbývá ti víc než pár let života. Nikomu nezbývá víc! Tak buď šťastní teď, bezdůvodně – jinak nebudeš šťastní nikdy.', 3, 13, 30, 1, '2017-07-20 16:51:21', '2020-05-16 07:16:00', 6),
(7, 'Iba nešťastný človek pozná šťastie. Šťastný človek je iba manekýnom pocitu života. Predvádza ho, ale nevlastní. Svetlo vo svetle nesvieti; svieti  iba v tme. Nech žije tma! Kto raz zažil búrku, nepotrebuje elektrický induktor. Nech je prekliata búrka. Nech žije tá troška nášho života! A pretože ho milujeme, neukladajme ho na úroky! Radšej ho zničme! Pime, deti! Jestvujú hviezdy, ktoré ešte každú noc svietia, hoci sa rozprskli pred desaťtisícmi svetelnými rokmi! Pite kým je ešte čas! Nech žije nešťastie! Nech žije tma! Nalial si plný pohár koňaku a vypil ho.', 2, 3, 30, 1, '2017-07-20 17:48:19', '2020-05-20 11:02:46', 6),
(8, 'Nezáleží, jaký se narodil, ale co z něho vyroste.', 5, 47, 25, 1, '2017-08-10 10:37:25', '2020-05-18 07:42:22', 7),
(9, ' Pokud chceš vědět, jaký někdo doopravdy je, všimni si, jak se chová ke svým podřízeným, ne k sobě rovným.', 5, 47, 34, 1, '2017-08-10 10:37:57', '2020-05-18 10:06:27', 7),
(10, 'Mládí nemůže vědět, jak přemýšlí stáří, ani jak se cítí. Ale staří lidé se proviní, jestliže zapomenou, jaké to je, být mladý…', 5, 48, 34, 1, '2017-08-10 10:38:57', '2020-02-28 19:23:22', 5),
(11, 'Posledné slová sa vždy ťažšie pamätajú, keď neviete, že sa niekto chystá umrieť.', 11, 61, 29, 1, '2017-08-10 15:29:19', '2020-05-25 16:49:34', 6),
(12, 'Jenomže já, mám pred sebou řekneme  ješte šedesát let života. Většinu toho času strávím prací. Vybral jsem si tedy práci, která mě baví. Kdyby mne nebavila, pak bych se dobrovoľne upsal k šedesáti letum mučení. A práce mě muže bavit jen tehdy, když ji budu dělat, jak nejlépe umím. Ale co je nejlépe, to je věc určitých měřítek, a ta si musím stanovit sám. Nejsem ničí dědic.', 1, 1, 25, 1, '2017-08-10 15:35:38', '2020-05-18 09:31:26', 6),
(13, 'Tak strašne som si chcel ľahnúť vedľa nej, objať ju a zaspať. Nie šukať ako v tých filmoch. Ani sa milovať. Len spolu spať v tom nejnevinejšom zmysle slova. Chýbala mi však odvaha. Ona mala frajera a ja som nemotorný. Ona bola nádherná a ja zúfalo nudný. A bola neskutočne očarujúca. Napokon som šiel do svojej izby, zrútil som sa na posteľ premýšľajúc, že ak by boli ľudia dažďom, ja by som bol mrholenie a ona by bola hurikán.', 11, 61, 24, 1, '2017-08-10 15:41:53', '2020-02-28 22:37:00', 5),
(14, '- Vlastne je hanba, že človek tu behá po zemi a temer nič o nej nevie. \r\n- Netráp sa, oveľa väčšia hanba je, že človek vôbec nevie, prečo tu po zemi behá.', 2, 3, 34, 1, '2017-10-29 17:38:33', '2020-05-20 02:11:43', 6),
(15, 'Oslněnýma očima jsem se zahleděl k nebi, k tomu šedivému, nekonečnému nebi nějakého pomateného boha, který vymyslel život a umírání, aby se pobavil.', 2, 3, 23, 1, '2017-10-29 17:39:31', '2020-01-08 07:40:22', 7),
(16, 'Od každého treba žiadať len to, čo môže dať. – kráľ', 16, 72, 34, 1, '2017-10-29 17:45:44', '2020-02-28 19:49:25', 5),
(17, 'Je oveľa ťažšie súdiť samého seba ako svojich blížnych. Ak sa ti podarí samého seba dobre súdiť, bude to znamenať, že si osvietený mudrc. – kráľ', 16, 72, 34, 1, '2017-10-29 17:46:04', '2020-02-27 02:36:38', 5),
(18, 'Veď človek môže byť verný príkazu a zároveň mať aj možnosť si odpočinúť. – lampár', 16, 72, 34, 1, '2017-10-29 17:46:19', '2020-05-23 23:07:02', 8),
(19, 'Človek je osamelý aj medzi ľuďmi. – had', 16, 72, 34, 1, '2017-10-29 17:46:36', '2020-05-19 04:17:42', 6),
(20, 'Skrotiť znamená vytvoriť si putá. – líška', 16, 72, 24, 1, '2017-10-29 17:46:54', '2019-10-06 00:54:57', 4),
(21, 'Nič nie je dokonalé. – líška', 16, 72, 25, 1, '2017-10-29 17:47:30', '2020-05-18 08:29:06', 6),
(22, 'Ľudia u vás pestujú päťtisíc ruží v jedinej záhrade a nenachádzajú v nej to, čo hľadajú. A predsa by mohli nájsť, čo hľadajú, v jedinej ruži alebo kvapke vody. – malý princ', 16, 72, 34, 1, '2017-10-29 17:48:26', '2020-02-11 22:41:26', 6),
(23, 'Človek sa vystatuje nebezpečenstvu, že bude trošku plakať, keď sa nechá skrotiť. – pilot', 16, 72, 24, 1, '2017-10-29 17:49:14', '2020-01-15 18:05:04', 5),
(24, 'Ale říkám ti, že nezáleží na tom, nakolik si s někým rozumíš, ani na tom, jak hluboce miluješ, dohlédnout až na dno cizí duše nedokážeš. Můžeš se o to snažit, ale skončíš jen tím, že se budeš trápit. My dokážeme vidět jen do své vlastní duše, a i to pouze za předpokladu, že se hodně snažíme. Musíme udělat jediné, najít kompromis a upřímně se smířit sami se sebou. Pokud skutečně toužíš vidět do někoho jiného, pak se musíš podívat přímo a hluboko sám do sebe.', 7, 73, 34, 1, '2017-10-29 17:54:00', '2020-02-11 22:41:49', 8),
(25, 'Ľudské srdce má strach uskutočniť svoje najväčšie sny, pretože si myslí, že si nezaslúži alebo že to nedokáže. Srdce umiera strachom už len pri pomyslení na lásku, ktorá zmizne navždy, na okamih, ktorý nesplní očakávanie, na poklad, ktorý namiesto toho, aby bol nájdený, zostane navždy skrytý v piesku. Pretože keď k tomu dôjde, srdce nakoniec veľmi trpí.', 6, 28, 34, 1, '2017-10-29 17:55:14', '2020-01-05 18:45:23', 3),
(26, 'Keď sa deň čo deň stretávame stále s tými istými ľuďmi, títo ľudia sa napokon stanú súčasťou nášho života. A keď sú už súčasťou nášho života, pomaly začnú chcieť meniť naše životy. A ak sa nesprávame podľa ich očakávaní, nahnevajú sa na nás. Lebo všetci majú presnú predstavu o tom, ako by mali žiť iní. Pritom im však vôbec neprekáža, že nevedia, ako by mali žiť oni sami.', 6, 28, 34, 1, '2017-10-29 17:56:44', '2020-01-06 21:00:33', 6),
(27, 'Je jedno ako koho miluješ, vaše svety sa nikdy nedotknú. Sme odsúdení na večnú osamelosť, uzavretí vo svojom tele, v svojej zložitej a nepochopiteľnej duši. Žijeme každý vo vlastnej ilúzii, ide len o to, či sú tie ilúzie vzájomne kompatibilné...', 17, 74, 24, 1, '2017-10-29 18:39:07', '2020-03-28 12:25:56', 6),
(28, 'Šťastie možno nájsť aj v najväčších dobách temna, ak vieš prikázať svetlu svieť.', 5, 46, 30, 1, '2017-10-31 20:14:16', '2020-04-26 16:52:27', 5),
(29, 'Dříve se lidé báli, že se provalí něco, co druzí netuší. Dnes se bojí, že někdo řekne nahlas něco, co vědí všichni. Ach, vy praktičtí, pragmatičtí lidé, napadlo vás někdy, jak málo by stačilo, aby se celý ten váš ohromný, složitý systém se všemi zákony a zbraněmi zhroutil jako domeček z karet? Že by stačilo, aby jen někdo pojmenoval pravou podstatu vašeho počínaní?', 1, 68, 34, 1, '2017-10-31 20:16:26', '2020-05-18 12:56:24', 7),
(30, 'Že už nepoznáš, co je správné a co ne? Tohle není bitva o materiál či zboží. To je krize morálky, nejvážnější, jakou kdy svět zakusil, a také poslední. Žijeme v době, která je vyvrcholením dlouhých staletí rozmáhajícího se zla. My tomu musíme učinit přítrž, jednou provždy, nebo zahynout - my, lidé intelektu.', 1, 68, 28, 1, '2017-10-31 20:17:15', '2020-05-16 22:52:30', 9),
(31, 'Dobre vidíme iba srdcom, to hlavné je očiam neviditeľné.', 16, 72, 24, 1, '2017-11-05 11:03:21', '2019-11-15 03:40:03', 6),
(32, 'Víte, proč jsou knihy, jako je tato, tak důležité? Protože mají hodnotu. A co znamená slovo hodnota? Pro mě znamená tkáň. Tahle kniha má póry. Má výrazné rysy. Na tuhle knihu se můžeme podívat pod mikroskopem. Pod sklíčkem v ní uvidíte život, který se tam valí nekonečným proudem. Čím víc pórů, čím víc pravdivě zachycených podrobností života dokážete dostat na jeden čtvereční centimetr papíru, tím jste blíž skutečnosti. Ať je to jak chce, tohle je moje definice. Uvádět podrobnosti. Stále nové podrobnosti. Dobří spisovatelé se života dotýkají často. Prostřední po něm jen rychle přejedou rukou. Špatní ho znásilní a dál se o něj nestarají.', 15, 71, 25, 1, '2017-11-05 11:26:53', '2020-01-06 19:44:18', 6),
(33, 'Vy, mladí ľudia ste čudáci, všetci do jedného. Minulosť nenávidíte, prítomnosťou opovrhujete a budúcnosť je vám ľahostajná. Môže mať toto dobrý koniec?', 2, 3, 34, 1, '2017-11-05 11:27:29', '2020-02-27 06:52:21', 6),
(34, 'Člověk si myslí, že umí chodit po vodě, jenže pak se ukáže, že má jen načuráno v botách.', 11, 61, 34, 1, '2017-11-05 11:35:02', '2020-05-25 09:15:22', 9),
(35, 'Tá priepasť, do ktorej sa podľa mňa rútiš, je zvláštna, strašná priepasť. Človek, ktorý do nej padá, nie je schopný pocítiť ani si uvedomiť, že už dopadol na dno. Len padá a padá. To je osud ľudí, ktorí v tom či onom období svojho života hľadali niečo, čo im ich okolie nemohlo poskytnúť. Alebo si mysleli, že im to ich okolie nemôže poskytnúť. A tak prestali hľadať. Prestali skôr, ako vôbec začali...', 27, 87, 34, 2, '2018-06-23 12:20:25', '2020-02-11 22:41:35', 7),
(36, '...s Davidom sme nikdy neviedli siahlodlhé rozhovory, vlastne sme sa na seba ani veľmi nedívali, ale nezáležalo na tom, lebo sme spolu pozorovali tú istú oblohu, čo je možno ešte dôležitejšie ako očný kontakt. Do očí vám môže pozrieť každý, ale len zriadka nájdete niekoho, kto vidí rovnaký svet ako vy.', 11, 86, 34, 1, '2018-08-25 04:48:49', '2020-02-15 01:49:28', 7),
(37, 'Nie je v povahe človeka – ani žiadnej inej živej bytosti – začínať tým, že sa dobrovoľne vzdá, že si napľuje do tváre a zatratí život; na to treba proces mravnej skazy, ktorý je u každého jedinca iný. Niektorí sa vzdávajú pod dotykom tlaku, niektorí sa zapredajú, niektorí padajú pomaly a nepostrehnuteľne, až vyhasnú úplne, bez toho, aby vedeli, kde a ako svoj oheň stratili. Potom sa všetci stratia v nekonečnom bahne svojich starších predchodcov, ktorí im neustále opakujú, že dospelosť znamená netrvať na svojich názoroch, bezpečie znamená netrvať na svojich hodnotách a praktickosť znamená netrvať na svojej hrdosti. A napriek tomu sa niektorí nevzdávajú, idú ďalej a vedia, že sa nedá zradiť vlastní oheň, učia sa, ako mu dať tvar, význam a ako ho uskutočniť. Ale nech už čaká človeka akákoľvek budúcnosť, na sklonku svojho života hľadá každý z nás nejakú ušľachtilú víziu ľudskej povahy a zmyslu života.\r\n(predslov k 25. výročiu prvého vydania)', 1, 1, 34, 2, '2018-09-17 06:59:06', '2020-01-11 16:29:51', 14),
(38, 'Napriek tomu všetkému stále verím, že ľudia sú v jadre skutočne dobrí.', 37, 106, 34, 2, '2018-10-29 05:40:24', '2020-06-25 15:50:19', 6),
(39, 'Neotravuj so svojimi problémami. Si živý tak ži!', 45, 126, 25, 2, '2018-11-16 05:21:21', '2020-02-14 17:09:58', 4),
(40, 'Rozdiel medzi nami a ostatnými je v tom, že oni žijú a my sme prežili. Keď človek prežil, nemá právo sťažovať sa na svoj osud, to by urážal tých, ktorí tam ostali.', 45, 126, 25, 2, '2018-11-16 05:26:20', '2020-01-24 20:16:10', 5),
(41, 'Smrť nie je opakom života. Smrť už je v našom živote ukrytá.', 7, 53, 29, 2, '2018-12-15 20:32:48', '2020-01-24 20:15:22', 6),
(42, 'Šokujúce nie je vykorisťovanie ale naša hlúposť. Tie omedzenia, ktorým podliehame, aby sme získali prepych a zbytočnosti. Najhorší sú hlupáci, ktorí sa idú zodrať za pár drobných. Problém nie je v zamestnávateľoch ale v peniazoch, tie nás zotročujú.V ten deň, keď sa vo vývoji druhov človek oddelil od opice, správnu cestu si nezvolil ten hlupák, čo zliezol zo stromu, aby sa stal sapiens, ale opica ktorá si pokojne ďalej zbierala ovocie a škrabala sa po bruchu. Ľudia z evolúcie nič nepochopili. Ten kto pracuje je nekonečný blázon.', 45, 126, 30, 2, '2018-12-17 05:17:03', '2020-02-14 18:30:40', 6),
(43, 'Dříve než bojovník světla zahájí důležité střetnutí, ptá se sám sebe: „Jsem nyní obratnější?“\r\nVí, že bitvy, jež svedl v minulosti, jej nakonec vždy něčemu naučily. Nicméně mnohá ta ponaučení mu způsobila víc utrpení, než bylo třeba. Nejednou promarnil čas bojem kvůli nějaké lži. A trpěl kvůli lidem, kteří si jeho lásku nezasloužili.\r\nVítěz se stejného omylu podruhé nedopouští. Proto bojovník vystavuje své srdce nebezpečí jen pro něco, co stojí za to.', 6, 140, 24, 2, '2019-02-26 19:10:56', '2020-02-12 16:50:13', 6),
(44, 'Pro bojovníka neexistuje nemožná láska.\r\nNedá se odradit mlčením, lhostejností nebo odmítnutím. Ví, že pod ledovou maskou, kterou si lidé nasazují, je vřelé srdce.\r\nProto bojovník dává v sázku víc než druzí. Neustále vyhledává něčí lásku, i kdyby to znamenalo mnohokrát uslyšet slovo „ne“, vrátit se domů poražen, pocítit odmítnutí tělem i duší.\r\nŽádný bojovník se nenechá zastrašit, když hledá to, co potřebuje. Bez lásky není ničím.', 6, 140, 24, 2, '2019-02-26 19:11:10', '2020-01-26 00:19:09', 6),
(45, 'Jak nemám být stepní vlk a trhan poustevník uprostřed světa, z jehož cílů nesdílím ani jediný, z jehož radostí ke mně žádná nepromlouvá!', 46, 143, 25, 2, '2019-04-18 09:56:21', '2020-02-14 16:24:14', 6),
(46, 'Hruď je vždy jen jedna, tělo jen jedno, duše v nich však nejsou pouze dvě či pět, nýbrž bezpočet; člověk je cibule se stovkami slupek, tkanina z mnoha vláken.', 46, 143, 34, 2, '2019-04-30 02:52:26', '2020-01-11 16:38:49', 6),
(47, 'Človek, ktorý prestane študovať len preto, že ukončil školu, je naveky a beznádejne odsúdený na priemrnosť a je úplne jedno, aké má povolanie. Cesta k úspechu je cestou neustáleho hľadania nových vedomostí.', 55, 144, 33, 2, '2019-06-17 12:11:29', '2020-04-17 04:56:53', 6),
(48, 'Nakoniec som si spisovateľov rozdelil do dvoch kategórií: tých, ktorí vás nechajú prísť načas, a tých, ktorí spôsobujú meškanie.', 45, 126, 35, 2, '2019-06-27 09:03:29', '2020-02-19 14:19:38', 6),
(49, 'Položila lutnu vedľa seba a pobozkala ma a ja som zavrel oči a svet sa vytratil. Nič iné nebolo. Nič, len ona. Bola hviezdami a nebol a oceánmi. Nič len drobný zlomok času a zárodok lásky, ktorý sme doň zasiali. A potom, v jeden okamih, sa bozk skončil a ja som jej pohladil vlasy a v diaľke sa rozozvučali kostolné zvony a všetko na svete bolo v poriadku.', 56, 147, 24, 1, '2019-07-25 03:28:14', '2020-02-15 01:42:15', 5),
(50, 'Co záleží na strachu z odmítnutí, na odkládání nějakého činu na jindy, když nejdůležitější ze všeho je žít naplno a s radostí? Teď jsem zavřený v rakvi a je příliš pozdě vrátit se zpátky a prokazovat odvahu, kterou jsem neměl.', 6, NULL, 25, 1, '2019-07-30 05:06:57', '2020-02-12 16:35:40', 5);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `quote_categories`
--

CREATE TABLE `quote_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `quote_categories`
--

INSERT INTO `quote_categories` (`id`, `nazov`, `slug`) VALUES
(23, 'Boh', 'boh'),
(24, 'Láska', 'laska'),
(25, 'Život', 'zivot'),
(26, 'Chudoba', 'chudoba'),
(27, 'Vojna', 'vojna'),
(28, 'Pravda', 'pravda'),
(29, 'Smrť', 'smrt'),
(30, 'Šťastie', 'stastie'),
(31, 'Viera', 'viera'),
(32, 'Inšpiratívne', 'inspirativne'),
(33, 'Úspech', 'uspech'),
(34, 'Ľudia', 'ludia'),
(35, 'Knihy', 'knihy');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `relations`
--

CREATE TABLE `relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id_f` int(10) UNSIGNED NOT NULL,
  `user_id_s` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `blocked` int(11) NOT NULL DEFAULT '0',
  `blocked_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `relations`
--

INSERT INTO `relations` (`id`, `user_id_f`, `user_id_s`, `status`, `blocked`, `blocked_by`, `created_at`, `updated_at`) VALUES
(3, 2, 1, 1, 0, NULL, '2018-10-17 15:45:53', '2018-10-17 15:45:57');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'martin.puchly@gmail.com', '$2y$10$oI/FHQrWTX.691Mc/wAfF.KjzzIhu.73a.CXxl8AXESufiKHyWhZK', 5, 'dM7BF2JYIKuAPZ5RZpR5KgXGVHjIVnNANIH9B698UJ5EWbigqvDwqgbONGdI', '2018-05-25 06:07:45', '2018-05-25 06:07:45'),
(2, 'serifko', 'serifko88@gmail.com', '$2y$10$hx2rNUKWvvkCFO75/F6r/Om3M.5vTLWQBk.Pan6XIrdRmHHobtsHq', 1, 'SH2YNWDbWUZrSw5ixpROg0suj5EZ1wL3pIkmJZ57yPtNCiW41ADB84G77qDE', '2018-06-03 05:56:27', '2018-06-03 05:56:27'),
(3, 'testik', 'testik@kniharen.sk', '$2y$10$h9BUjnGrq/68b7.n/vY.ouH8I6RbkWtdars0hjGSTZFUn8nOIvZza', 1, 'HDLvGndkuPDtr4wRTesYzzMEtBHMySDn9XAHpTpA6jtq8ro9VpUM3pGOy9Fg', '2018-10-18 05:39:33', '2018-10-18 05:39:33'),
(4, 'XEvilBestdrymn', 'gundosovitchjebrail@yandex.com', '$2y$10$chsA0Mj/9EfpmazSwCjlbOos94F8W4LhNsJCWsi.F6vG/jNRKcDre', 1, NULL, '2018-11-15 15:12:50', '2018-11-15 15:12:50'),
(5, 'Irvinghapse', 'makhmatw9iil@mail.ru', '$2y$10$zWWC/ZA9ecCPhcDcO1kEn.dlhYikYrW0ccO1gSDsQcZVFQOYC/NHa', 1, NULL, '2019-04-16 00:07:01', '2019-04-16 00:07:01'),
(6, 'Xenkaw', '4e7dfdg@yandex.com', '$2y$10$6aIs96NhXn4YhupEpdR2Mu3CECeOtmZClKwAduCl94knj8gB6M0oK', 1, NULL, '2019-04-27 11:25:53', '2019-04-27 11:25:53'),
(7, 'Clamcaseblb', 'support@vdsina.ru', '$2y$10$6CH70dlWfp.9xvn2b3pkzu.I8j5vMRzQg16UJ6ZpgzUsQz5nhcC3K', 1, NULL, '2019-05-26 08:51:06', '2019-05-26 08:51:06'),
(8, 'Sanderbgd', 'director@vdsina.ru', '$2y$10$iwaAiH/dhL4JxOOYSNO2u.6MGB2KNdgwHpUTyBJ4P8xz3oLJnp82e', 1, NULL, '2019-05-30 05:02:19', '2019-05-30 05:02:19'),
(9, 'Dysongpt', 'mbarnett@howard.com', '$2y$10$w.jKlqpFd72I2nMxgNqfgOACEi.rhapZ48sQM4dyC7AUCjR3iAFZi', 1, NULL, '2019-06-03 16:28:55', '2019-06-03 16:28:55'),
(10, 'WILDKATcze', 'fsuadina@hotmail.com', '$2y$10$fWZzCc9Igq9MfvRFiGNBMOfcRSdCPGqWG/wubpvQphvBT8NWz2Mm.', 1, NULL, '2019-06-07 00:42:57', '2019-06-07 00:42:57'),
(11, 'Focuscwl', 'desclacepa@gmail.com', '$2y$10$38QdnsEmwx20OktsIfpwhOEnzQ3/Ny/g5ZIyyC.awmzP2OFgXCeCm', 1, NULL, '2019-06-08 21:37:58', '2019-06-08 21:37:58'),
(12, 'Feederuby', 'melissa.stevens@casdonline.org', '$2y$10$tmR3MnuQx4VcDHh2sKyOxeMyOlG22ieE6egmbsyd2ENcCOJ1qftaO', 1, NULL, '2019-06-09 22:24:09', '2019-06-09 22:24:09'),
(13, 'Speakerjje', 'sgroland17@gmail.com', '$2y$10$Qtfy6ANb4300C5fcwxgfp.W1kkoDAvMmXGa.sDksRJP14mmlXhxLi', 1, NULL, '2019-06-10 02:39:15', '2019-06-10 02:39:15'),
(14, 'Humminbirdmnw', 'bellcoulesoc@mail.com', '$2y$10$RjTaOi1qhRMhhhiEsvZHIeQSrbUD0C3BMYz/0FfJ2h4jN4hHXWe/O', 1, NULL, '2019-06-13 12:15:07', '2019-06-13 12:15:07'),
(15, 'Swnvgrmege', 'lenvikest@mail.ru', '$2y$10$fEk85cKdJc9QtLDcdkFWuelaAAhPWsvUZ84XQuwWIkMDmQkIVKFvq', 1, NULL, '2019-06-30 05:36:47', '2019-06-30 05:36:47'),
(16, 'Superchipswfi', 'tertisymca@yahoo.com', '$2y$10$ebwbPSD9eh3WgFSeqVWIhew18FeFG0BdFTNA85KMzmyJjB0FIK7Ga', 1, NULL, '2019-07-05 19:24:45', '2019-07-05 19:24:45'),
(17, 'Seriesvsf', 'allisha-s@hotmail.com', '$2y$10$JRjYBc4BZnWUMFEsSlHwhuFkkaWLVST0QoNlTd.FJH6/1xOOC4VNu', 1, NULL, '2019-07-17 03:03:47', '2019-07-17 03:03:47'),
(18, 'Seriesjdh', 'matthijsweusink@gmail.com', '$2y$10$jb9b8.xxZ.3WoGsoaUYKqO6uFt7r9r6Gzhm7xfC0YYHG2VHEyaBga', 1, NULL, '2019-07-30 22:43:24', '2019-07-30 22:43:24'),
(19, 'WILDKATxta', 'adriana_zafra@hotmail.com', '$2y$10$jBW5pzHYsAPwMoLHG9h58OU6pzeuNOWF85pOaqJ7Rmy3ZImhftneC', 1, NULL, '2019-08-04 22:27:36', '2019-08-04 22:27:36'),
(20, 'Backlitblz', 'gene@gonzalescpa.net', '$2y$10$0SY5suppRBt3FtPYGK8zjuYVq9WLGtxL.QN2MrEmxc9ualNcsQdrm', 1, NULL, '2019-08-07 16:12:15', '2019-08-07 16:12:15'),
(21, 'Nespressobrq', 'drivhaiskanlis@hotmail.com', '$2y$10$IPfvdvdDJ5Y/psIj9Lof1OT3OxvphUUYAuIP8esvegXy.a1VxQmJi', 1, NULL, '2019-08-16 21:07:13', '2019-08-16 21:07:13'),
(22, 'aurovenk', 'auro96@mail.ru', '$2y$10$syU6XB4XuUJzbv1zEql8Led54xdTLB8BQTV//s8apR1xgzwlPaHtS', 1, NULL, '2019-12-24 03:14:24', '2019-12-24 03:14:24'),
(23, 'GeorgeIrred', 'inbox413@glmux.com', '$2y$10$XqJEMRngp23/aG4/QAOOre9V9hq53IoUqwRwgPEJWblYhuWd2fnmW', 1, NULL, '2020-01-06 20:14:45', '2020-01-06 20:14:45'),
(24, 'Mojavexmj', 'priztiupromin@hotmail.com', '$2y$10$uwnt/6iBqDyHVcECb0IWyusWStj48EPTl1w8uqkgrQblx4PcOX/uS', 1, NULL, '2020-01-18 14:18:43', '2020-01-18 14:18:43'),
(25, 'Haroldboymn', 'marek.andrusiak1@o2.pl', '$2y$10$pyeNFCdgQy2Kyz7/1KsfouNForfFldcWCH4ZBZx5.GZsV9e4d.O/C', 1, NULL, '2020-06-14 12:05:50', '2020-06-14 12:05:50'),
(26, 'EJubXlwGxdhASVMz', 'whiteheadrandolf48@gmail.com', '$2y$10$rUUlK5Tf1QMv3ngM.VwDxOx0xEfRl8WcdH7EroZIR1Xk9OVgf1qBq', 1, NULL, '2020-07-03 16:00:45', '2020-07-03 16:00:45'),
(27, 'Mawikdop', 'davidawant@advairdiskus-247buy.com', '$2y$10$w5xhxKq5zE60D3PIexBisOMyepYUx.Rjzd05OXiTJZZBroq1CADJu', 1, NULL, '2020-07-07 05:11:45', '2020-07-07 05:11:45'),
(28, 'AndroideDit', 'martastuartma@yandex.com', '$2y$10$UWPjgQXtW1iBt15ANoqzdup2uHhp3sFyp6lHf9As3.91u228.UXrG', 1, NULL, '2020-07-07 11:00:25', '2020-07-07 11:00:25'),
(29, 'kKDrTxpbsGnN', 'madlynrodgers90@gmail.com', '$2y$10$3Nc1D4YTzzhdfXb1.QlNQe/8cE1RpmcUnDY4TI4jtg.ltnY7minO.', 1, NULL, '2020-07-22 00:23:04', '2020-07-22 00:23:04');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email_pub` int(11) NOT NULL DEFAULT '0',
  `realname_pub` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthday_pub` int(11) NOT NULL DEFAULT '0',
  `age_pub` int(11) NOT NULL DEFAULT '0',
  `about` text COLLATE utf8mb4_unicode_ci,
  `about_pub` int(11) NOT NULL DEFAULT '0',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_pub` int(11) NOT NULL DEFAULT '0',
  `website_pub` int(11) NOT NULL DEFAULT '0',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_pub` int(11) NOT NULL DEFAULT '0',
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_pub` int(11) NOT NULL DEFAULT '0',
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_pub` int(11) NOT NULL DEFAULT '0',
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tumblr_pub` int(11) NOT NULL DEFAULT '0',
  `tumblr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sťahujem dáta pre tabuľku `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `email_pub`, `realname_pub`, `realname`, `birthday`, `birthday_pub`, `age_pub`, `about`, `about_pub`, `photo`, `photo_pub`, `website_pub`, `website`, `facebook_pub`, `facebook`, `twitter_pub`, `twitter`, `instagram_pub`, `instagram`, `tumblr_pub`, `tumblr`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 2, 'Administrator', NULL, 0, 0, NULL, 0, 'Mikx8r08pkTcD90ykY3XBDL8uiZDQDiPsVhTXtSv.png', 2, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, '2019-02-25 19:18:10'),
(2, 2, 0, 1, 'Martin', '1988-07-06', 0, 1, 'JA=ADMIN. \r\nJednoducho ma bavia kniha a programovanie. Pracujem v inej oblasti ako je IT, takže tvoriť túto stránku je... vlastne to nie je k ničomu, jednoducha zábava.', 2, 'Sc4krJYln3t1Enr12QzmU5jKRr7RE43UsrftsS8z.jpg', 1, 2, 'https://www.kniharen.sk', 0, 'martin.puchly', 1, 'serifko', 0, NULL, 0, NULL, NULL, '2019-02-11 14:05:02'),
(3, 3, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2018-10-18 05:39:33', '2018-10-18 05:39:33'),
(4, 4, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2018-11-15 15:12:50', '2018-11-15 15:12:50'),
(5, 5, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-04-16 00:07:01', '2019-04-16 00:07:01'),
(6, 6, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-04-27 11:25:53', '2019-04-27 11:25:53'),
(7, 7, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-05-26 08:51:06', '2019-05-26 08:51:06'),
(8, 8, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-05-30 05:02:19', '2019-05-30 05:02:19'),
(9, 9, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-03 16:28:55', '2019-06-03 16:28:55'),
(10, 10, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-07 00:42:57', '2019-06-07 00:42:57'),
(11, 11, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-08 21:37:58', '2019-06-08 21:37:58'),
(12, 12, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-09 22:24:09', '2019-06-09 22:24:09'),
(13, 13, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-10 02:39:15', '2019-06-10 02:39:15'),
(14, 14, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-13 12:15:07', '2019-06-13 12:15:07'),
(15, 15, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-06-30 05:36:47', '2019-06-30 05:36:47'),
(16, 16, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-07-05 19:24:45', '2019-07-05 19:24:45'),
(17, 17, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-07-17 03:03:47', '2019-07-17 03:03:47'),
(18, 18, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-07-30 22:43:24', '2019-07-30 22:43:24'),
(19, 19, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-08-04 22:27:36', '2019-08-04 22:27:36'),
(20, 20, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-08-07 16:12:15', '2019-08-07 16:12:15'),
(21, 21, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-08-16 21:07:13', '2019-08-16 21:07:13'),
(22, 22, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2019-12-24 03:14:24', '2019-12-24 03:14:24'),
(23, 23, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-01-06 20:14:45', '2020-01-06 20:14:45'),
(24, 24, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-01-18 14:18:43', '2020-01-18 14:18:43'),
(25, 25, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-06-14 12:05:50', '2020-06-14 12:05:50'),
(26, 26, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-07-03 16:00:45', '2020-07-03 16:00:45'),
(27, 27, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-07-07 05:11:45', '2020-07-07 05:11:45'),
(28, 28, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-07-07 11:00:25', '2020-07-07 11:00:25'),
(29, 29, 0, 0, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, '2020-07-22 00:23:04', '2020-07-22 00:23:04');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authors_user_id_foreign` (`user_id`),
  ADD KEY `authors_nation_id_foreign` (`nation_id`);

--
-- Indexy pre tabuľku `bazaar_categories`
--
ALTER TABLE `bazaar_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `bazaar_subcategories`
--
ALTER TABLE `bazaar_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bazaar_subcategories_bazaar_category_id_foreign` (`bazaar_category_id`);

--
-- Indexy pre tabuľku `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_user_id_foreign` (`user_id`);

--
-- Indexy pre tabuľku `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_user_id_foreign` (`user_id`),
  ADD KEY `books_author_id_foreign` (`author_id`);

--
-- Indexy pre tabuľku `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `book_comments`
--
ALTER TABLE `book_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `book_join_categories`
--
ALTER TABLE `book_join_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_join_categories_book_id_foreign` (`book_id`),
  ADD KEY `book_join_categories_book_category_id_foreign` (`book_category_id`);

--
-- Indexy pre tabuľku `book_statuses`
--
ALTER TABLE `book_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_statuses_book_id_foreign` (`book_id`),
  ADD KEY `book_statuses_user_id_foreign` (`user_id`);

--
-- Indexy pre tabuľku `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `favorit_author`
--
ALTER TABLE `favorit_author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorit_author_user_id_foreign` (`user_id`),
  ADD KEY `favorit_author_author_id_foreign` (`author_id`);

--
-- Indexy pre tabuľku `favorit_book`
--
ALTER TABLE `favorit_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorit_book_user_id_foreign` (`user_id`),
  ADD KEY `favorit_book_book_id_foreign` (`book_id`);

--
-- Indexy pre tabuľku `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_nazov_unique` (`nazov`);

--
-- Indexy pre tabuľku `group_join_permission`
--
ALTER TABLE `group_join_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_join_permission_permission_id_foreign` (`permission_id`),
  ADD KEY `group_join_permission_group_id_foreign` (`group_id`);

--
-- Indexy pre tabuľku `group_join_user`
--
ALTER TABLE `group_join_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_join_user_user_id_foreign` (`user_id`),
  ADD KEY `group_join_user_group_id_foreign` (`group_id`);

--
-- Indexy pre tabuľku `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `nations`
--
ALTER TABLE `nations`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexy pre tabuľku `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_key_unique` (`key`);

--
-- Indexy pre tabuľku `permission_join_user`
--
ALTER TABLE `permission_join_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_join_user_user_id_foreign` (`user_id`),
  ADD KEY `permission_join_user_permission_id_foreign` (`permission_id`);

--
-- Indexy pre tabuľku `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_author_id_foreign` (`author_id`),
  ADD KEY `quotes_book_id_foreign` (`book_id`),
  ADD KEY `quotes_quotecategory_id_foreign` (`quoteCategory_id`),
  ADD KEY `quotes_user_id_foreign` (`user_id`);

--
-- Indexy pre tabuľku `quote_categories`
--
ALTER TABLE `quote_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relations_user_id_f_foreign` (`user_id_f`),
  ADD KEY `relations_user_id_s_foreign` (`user_id_s`),
  ADD KEY `relations_blocked_by_foreign` (`blocked_by`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexy pre tabuľku `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pre tabuľku `bazaar_categories`
--
ALTER TABLE `bazaar_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `bazaar_subcategories`
--
ALTER TABLE `bazaar_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT pre tabuľku `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pre tabuľku `book_comments`
--
ALTER TABLE `book_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pre tabuľku `book_join_categories`
--
ALTER TABLE `book_join_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pre tabuľku `book_statuses`
--
ALTER TABLE `book_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pre tabuľku `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `favorit_author`
--
ALTER TABLE `favorit_author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pre tabuľku `favorit_book`
--
ALTER TABLE `favorit_book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pre tabuľku `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `group_join_permission`
--
ALTER TABLE `group_join_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pre tabuľku `group_join_user`
--
ALTER TABLE `group_join_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pre tabuľku `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pre tabuľku `nations`
--
ALTER TABLE `nations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT pre tabuľku `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pre tabuľku `permission_join_user`
--
ALTER TABLE `permission_join_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pre tabuľku `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pre tabuľku `quote_categories`
--
ALTER TABLE `quote_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pre tabuľku `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pre tabuľku `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_nation_id_foreign` FOREIGN KEY (`nation_id`) REFERENCES `nations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `authors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Obmedzenie pre tabuľku `bazaar_subcategories`
--
ALTER TABLE `bazaar_subcategories`
  ADD CONSTRAINT `bazaar_subcategories_bazaar_category_id_foreign` FOREIGN KEY (`bazaar_category_id`) REFERENCES `bazaar_categories` (`id`) ON DELETE SET NULL;

--
-- Obmedzenie pre tabuľku `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Obmedzenie pre tabuľku `book_join_categories`
--
ALTER TABLE `book_join_categories`
  ADD CONSTRAINT `book_join_categories_book_category_id_foreign` FOREIGN KEY (`book_category_id`) REFERENCES `book_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_join_categories_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `book_statuses`
--
ALTER TABLE `book_statuses`
  ADD CONSTRAINT `book_statuses_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_statuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `favorit_author`
--
ALTER TABLE `favorit_author`
  ADD CONSTRAINT `favorit_author_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorit_author_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `favorit_book`
--
ALTER TABLE `favorit_book`
  ADD CONSTRAINT `favorit_book_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorit_book_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `group_join_permission`
--
ALTER TABLE `group_join_permission`
  ADD CONSTRAINT `group_join_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_join_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `group_join_user`
--
ALTER TABLE `group_join_user`
  ADD CONSTRAINT `group_join_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_join_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `permission_join_user`
--
ALTER TABLE `permission_join_user`
  ADD CONSTRAINT `permission_join_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_join_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotes_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotes_quotecategory_id_foreign` FOREIGN KEY (`quoteCategory_id`) REFERENCES `quote_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Obmedzenie pre tabuľku `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_blocked_by_foreign` FOREIGN KEY (`blocked_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_user_id_f_foreign` FOREIGN KEY (`user_id_f`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_user_id_s_foreign` FOREIGN KEY (`user_id_s`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
