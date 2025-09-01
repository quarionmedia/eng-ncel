-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Eyl 2025, 22:47:01
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `muvixtvdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `tv_show_id` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `rating` tinyint(2) NOT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_spoiler` tinyint(1) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `user_id`, `profile_id`, `movie_id`, `tv_show_id`, `comment`, `rating`, `episode_id`, `comment_text`, `status`, `created_at`, `is_spoiler`, `like_count`) VALUES
(17, NULL, 3, 6, 31, NULL, 'sdfgsdfgsdfg', 10, NULL, '', 'approved', '2025-08-28 23:45:54', 1, 0),
(18, NULL, 3, 6, 31, NULL, 'gffdhdfghdfghdfgh', 10, NULL, '', 'approved', '2025-08-28 23:55:25', 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `user_id`, `comment_id`, `created_at`) VALUES
(1, 3, 2, '2025-08-17 02:45:18'),
(2, 3, 3, '2025-08-17 02:45:20'),
(3, 3, 4, '2025-08-17 02:57:03'),
(4, 3, 5, '2025-08-17 03:15:49'),
(5, 3, 6, '2025-08-17 03:17:38');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `content_networks`
--

CREATE TABLE `content_networks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `subject`, `body`) VALUES
(5, 'subscription_purchase', 'Your Subscription on {{site_name}}', '<h1>Hi {{user_name}},</h1><p>Thank you for your subscription. Your plan is now active.</p>'),
(6, 'report_resolved', 'Update on your Report #[{{report_id}}]', '<!DOCTYPE html>\n<html>\n<head>\n<style>\n  body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px; }\n  .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }\n  h1 { color: #4CAF50; }\n  .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; }\n</style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Report Resolved</h1>\n  <p>Hello, {{username}}!</p>\n  <p>We are writing to inform you that your report (ID: #{{report_id}}) regarding the content \"<strong>{{content_title}}</strong>\" has been reviewed and resolved by our team.</p>\n  <p>Thank you for helping us keep the community safe.</p>\n  <p>Best regards,<br>The {{site_name}} Team</p>\n</div>\n<div class=\"footer\">\n  <p>&copy; {{site_name}}. All rights reserved.</p>\n</div>\n</body>\n</html>'),
(8, 'welcome_email', 'Welcome to {{site_name}}, {{username}}!', '<!DOCTYPE html>\n<html>\n<head>\n<style>\n  body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px; }\n  .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }\n  h1 { color: #42ca1a; }\n  .button { display: inline-block; padding: 12px 25px; background-color: #42ca1a; color: #fff; text-decoration: none; border-radius: 5px; }\n  .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; }\n</style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Welcome Aboard, {{username}}!</h1>\n  <p>Thank you for registering at {{site_name}}. We\'re excited to have you as part of our community.</p>\n  <p>To get started, you can explore our latest content by clicking the button below:</p>\n  <p><a href=\"{{site_url}}\" class=\"button\">Start Watching</a></p>\n  <p>If you have any questions, feel free to contact us at {{site_email}}.</p>\n  <p>Best regards,<br>The {{site_name}} Team</p>\n</div>\n<div class=\"footer\">\n  <p>&copy; {{current_year}} {{site_name}}. All rights reserved.</p>\n</div>\n</body>\n</html>'),
(10, 'account_verification_code', 'Your Verification Code for {{site_name}}', '<!DOCTYPE html>\n<html>\n<head>\n<style>\n  body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px; }\n  .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }\n  h1 { color: #42ca1a; }\n  .code { font-size: 24px; font-weight: bold; letter-spacing: 5px; padding: 10px; background-color: #eee; border-radius: 5px; text-align: center; }\n  .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; }\n</style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Your Verification Code</h1>\n  <p>Hello, {{username}}!</p>\n  <p>Thank you for registering. Please use the following code to activate your account. The code is valid for 1 hour.</p>\n  <div class=\"code\">{{verification_code}}</div>\n  <p>If you did not create an account, no further action is required.</p>\n  <p>Best regards,<br>The {{site_name}} Team</p>\n</div>\n<div class=\"footer\">\n  <p>&copy; {{current_year}} {{site_name}}. All rights reserved.</p>\n</div>\n</body>\n</html>'),
(12, 'password_reset_code', 'Your Password Reset Code for {{site_name}}', '<!DOCTYPE html><html><head><style> body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px; } .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); } h1 { color: #ff4444; } .code { font-size: 24px; font-weight: bold; text-align: center; padding: 15px; background-color: #f0f0f0; border-radius: 5px; letter-spacing: 5px; margin: 20px 0; } .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; } </style></head><body><div class=\"container\"> <h1>Password Reset Code</h1> <p>Hello, {{username}}!</p> <p>We received a request to reset your password. Please use the following code to proceed. The code is valid for 10 minutes.</p> <div class=\"code\">{{verification_code}}</div> <p>If you did not request a password reset, you can safely ignore this email.</p></div><div class=\"footer\"> <p>&copy; {{current_year}} {{site_name}}. All rights reserved.</p></div></body></html>'),
(13, 'login_verification_code', 'Login Attempt to {{site_name}}', '<!DOCTYPE html><html><head><style> body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; padding: 20px; } .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); } h1 { color: #42ca1a; } .code { font-size: 24px; font-weight: bold; letter-spacing: 5px; padding: 10px; background-color: #eee; border-radius: 5px; text-align: center; } .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; } .info { font-size: 14px; color: #555; } </style></head><body><div class=\"container\"> <h1>Your Login Code</h1> <p>Hello!</p> <p>A login attempt was made on your account. Please use the following code to complete your login. The code is valid for 1 minute.</p> <div class=\"code\">{{verification_code}}</div> <br> <div class=\"info\"> <p><b>IP Address:</b> {{login_ip_address}}<br><b>Device:</b> {{login_user_agent}}</p> </div> <p>If you did not attempt to log in, you can safely ignore this email or contact support.</p> <p>Best regards,<br>The {{site_name}} Team</p></div><div class=\"footer\"> <p>&copy; {{current_year}} {{site_name}}. All rights reserved.</p></div></body></html>');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `episodes`
--

CREATE TABLE `episodes` (
  `id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `tmdb_episode_id` int(11) DEFAULT NULL,
  `episode_number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `still_path` varchar(255) DEFAULT NULL,
  `air_date` date DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `is_downloadable` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'free',
  `status` varchar(50) NOT NULL DEFAULT 'publish',
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `episodes`
--

INSERT INTO `episodes` (`id`, `season_id`, `tmdb_episode_id`, `episode_number`, `name`, `overview`, `still_path`, `air_date`, `runtime`, `is_downloadable`, `type`, `status`, `video_url`) VALUES
(3865, 262, 1927355, 1, 'The End\'s Beginning', 'Hostile townsfolk and a cunning mage greet Geralt in the town of Blaviken. Ciri finds her royal world upended when Nilfgaard sets its sights on Cintra.', '/kvnbgfKMSOeq08gWeL7FrzT0mah.jpg', '2019-12-20', 62, 0, 'free', 'publish', NULL),
(3866, 262, 1954612, 2, 'Four Marks', 'Bullied and neglected, Yennefer accidentally finds a means of escape. Geralt\'s hunt for a so-called devil goes to hell. Ciri seeks safety in numbers.', '/7KWyZgiSXSAuagbtzjTZLrkOtNk.jpg', '2019-12-20', 62, 0, 'free', 'publish', NULL),
(3867, 262, 1954613, 3, 'Betrayer Moon', 'Geralt takes on another Witcher\'s unfinished business in a kingdom stalked by a ferocious beast. At a brutal cost, Yennefer forges a magical new future.', '/jiNkIfEOsKQNNc0roNmzZZ0VJVi.jpg', '2019-12-20', 68, 0, 'free', 'publish', NULL),
(3868, 262, 1954614, 4, 'Of Banquets, Bastards and Burials', 'Against his better judgment, Geralt accompanies Jaskier to a royal ball. Ciri wanders into an enchanted forest. Yennefer tries to protect her charges.', '/AfebvAOUQDaIy2TMmzhWk1ddZMJ.jpg', '2019-12-20', 63, 0, 'free', 'publish', NULL),
(3869, 262, 1954615, 5, 'Bottled Appetites', 'Heedless of warnings, Yennefer looks for a cure to restore what she\'s lost. Geralt inadvertently puts Jaskier in peril. The search for Ciri intensifies.', '/10yazSY4hMWfH8M48D7rhHVDvsA.jpg', '2019-12-20', 60, 0, 'free', 'publish', NULL),
(3870, 262, 1954616, 6, 'Rare Species', 'A mysterious man tries to entice Geralt to join a hunt for a rampaging dragon, a quest that attracts a familiar face. Ciri questions who she can trust.', '/1fmFzsVZSi0PPDc3yGvR3pllzPK.jpg', '2019-12-20', 60, 0, 'free', 'publish', NULL),
(3871, 262, 1954617, 7, 'Before a Fall', 'With the Continent at risk from Nilfgaard\'s rising power, Yennefer revisits her past, while Geralt reconsiders his obligation to the Law of Surprise.', '/2HL6kDFLCVtcqRlqf8X4Ir6Huqw.jpg', '2019-12-20', 48, 0, 'free', 'publish', NULL),
(3872, 262, 1954618, 8, 'Much More', 'A terrifying pack of foes lays Geralt low. Yennefer and her fellow mages prepare to fight back. A shaken Ciri depends on the kindness of a stranger.', '/3MqMmcoRShLEylaVlCy97ziGWF0.jpg', '2019-12-20', 60, 0, 'free', 'publish', NULL),
(3873, 263, 3063744, 1, 'A Grain of Truth', 'Geralt sets off with Ciri on a journey that leads him to an old friend. After the Battle of Sodden, Tissaia shows no mercy in her search for information.', '/lRYwDG1Mu576iRJJ3sfzmm9rJTz.jpg', '2021-12-17', 64, 0, 'free', 'publish', NULL),
(3874, 263, 3063820, 2, 'Kaer Morhen', 'Seeking a safe place for Ciri, Geralt heads for home, but danger lurks everywhere — even Kaer Morhen. Yennefer\'s dreams could be the key to her freedom.', '/bD0fkV9hxxxjmQXWfjB1LZQ154s.jpg', '2021-12-17', 59, 0, 'free', 'publish', NULL),
(3875, 263, 3063821, 3, 'What Is Lost', 'Impatient with Geralt\'s methods, Ciri braves major obstacles to prove her mettle. Scheming and suspicion amongst the Brotherhood make Yennefer a target.', '/N7qYLPhDxFdFYga4pDaJw1cCaJ.jpg', '2021-12-17', 60, 0, 'free', 'publish', NULL),
(3876, 263, 3063822, 4, 'Redanian Intelligence', 'A guest at Kaer Morhen extends a guiding hand to Ciri — and an invitation to Geralt. On the run in Redania, Yennefer seeks safety below ground.', '/wF4qk9RimFWr28ZC0nT4c6XuOdw.jpg', '2021-12-17', 56, 0, 'free', 'publish', NULL),
(3877, 263, 3063823, 5, 'Turn Your Back', 'As a powerful mage joins the hunt for Ciri, she cuts a deal with Vesemir over his extraordinary discovery. Geralt explores the mystery of the monoliths.', '/xPytQd9tDAxDoECXbNwbeR3Fi2h.jpg', '2021-12-17', 58, 0, 'free', 'publish', NULL),
(3878, 263, 3063824, 6, 'Dear Friend...', 'A close friend is lost — and another found — as Geralt helps Ciri learn more about her power. Cahir warns Fringilla to focus on their primary mission.', '/p0WVue8TDH4BCkgwUVpk93LKI4z.jpg', '2021-12-17', 58, 0, 'free', 'publish', NULL),
(3879, 263, 3063825, 7, 'Voleth Meir', 'Geralt turns to the bard Jaskier for help, Yennefer realizes just how special Ciri is, and tensions rise on the eve of Emperor Emhyr\'s visit to Cintra.', '/lVnEbnHgFr56xyj4Kpl41UYAzWB.jpg', '2021-12-17', 55, 0, 'free', 'publish', NULL),
(3880, 263, 3063826, 8, 'Family', 'Geralt faces off with a demon targeting his nearest and dearest while the most powerful players on the Continent ramp up their pursuit of Ciri.', '/qEfDFrmsF3L9EfnUkniXmEtXITm.jpg', '2021-12-17', 56, 0, 'free', 'publish', NULL),
(3881, 264, 4390448, 1, 'Shaerrawedd', 'Geralt, Yennefer and Ciri journey to the far reaches of the Continent in search of a safe haven. King Vizimir puts his charming younger brother to use.', '/e2acePDzVFczUGwO6qppdqjjnGu.jpg', '2023-06-29', 63, 0, 'free', 'publish', NULL),
(3882, 264, 4390452, 2, 'Unbound', 'A shocking discovery awaits Geralt after he obtains information on Rience. Ciri\'s sense of justice causes problems. Jaskier performs for a royal fan.', '/iNOfRFMLUab9Xt39U9ffWo5vLYM.jpg', '2023-06-29', 58, 0, 'free', 'publish', NULL),
(3883, 264, 4390453, 3, 'Reunion', 'Geralt seeks magical help from a family friend as Ciri and Yennefer clash over plans for the future. Philippa and Dijkstra scheme to get Vizimir in line.', '/kIymMMvcDSTasaRYPHX5QOrpLiK.jpg', '2023-06-29', 62, 0, 'free', 'publish', NULL),
(3884, 264, 4390454, 4, 'The Invitation', 'Yennefer pitches a bold idea to the Brotherhood, Geralt strikes a dangerous deal with a ferryman, and Triss digs into the mystery of the missing novices.', '/s7qPoBctK678eoGrKLgkUgwTtfb.jpg', '2023-06-29', 56, 0, 'free', 'publish', NULL),
(3885, 264, 4390455, 5, 'The Art of Illusion', 'Yennefer and Geralt step out arm in arm and dressed to kill at a lavish ball, but all is not as it seems during a night of revelry and revelations.', '/ePpQeSYtWPZdyIOPCUTFQQqtsXU.jpg', '2023-06-29', 51, 0, 'free', 'publish', NULL),
(3886, 264, 4390457, 6, 'Everybody Has a Plan \'til They Get Punched in the Face', 'Betrayal and bloodshed rock the conclave when the hunt for Ciri comes to a head. As sides are chosen and enemies unmasked, nothing will ever be the same.', '/jPc4g8j7zv70FQXbMEMsFaGyeLX.jpg', '2023-07-27', 49, 0, 'free', 'publish', NULL),
(3887, 264, 4390458, 7, 'Out of the Fire, Into the Frying Pan', 'Haunted by faces from the past, Ciri endures the ultimate test of survival on a desperate journey under the harshest of conditions.', '/nbTpbjnQ4eZVsaNjDAPFpZ6jzKv.jpg', '2023-07-27', 53, 0, 'free', 'publish', NULL),
(3888, 264, 4390459, 8, 'The Cost of Chaos', 'After the fateful events at Aretuza, Geralt and Yennefer struggle to pick up the pieces and reunite their family as war comes to the Continent.', '/aPPP9UjwgkqOhOOCCCeUqsHgByy.jpg', '2023-07-27', 66, 0, 'free', 'publish', NULL),
(3905, 268, 953083, 1, 'Dexter', 'Dexter Morgan, a Miami Metro Police Department blood spatter analyst, is living a double life.  After his day job with the police department, Dexter moonlights as a serial killer, hunting and killing criminals who slip through the justice system.  Dexter\'s sister, Debra, a vice squad officer, pulls Dexter into her world when another serial killer is killing prostitutes and leaving their bloodless bodies dismembered in various locations around Miami.  Meanwhile, Dexter hunts a man who made snuff videos and killed a mother of two.', '/70rjTrItEJCyr6u8zmAVQrdmcrP.jpg', '2006-10-01', 53, 0, 'free', 'publish', NULL),
(3906, 268, 953084, 2, 'Crocodile', 'As Dexter stalks his next victim, a drunk driver who is about to be acquitted for vehicular homicide that resulted in the death of a teenage boy, the Ice Truck Killer strikes again and later gets in touch with Dexter.  Meanwhile, when a cop is found murdered, Dexter helps Doakes and Debra investigate a crime boss who they believe is responsible.', '/vcx9a4vVzQfKO2IysTKC0wLLJQ0.jpg', '2006-10-08', 55, 0, 'free', 'publish', NULL),
(3907, 268, 953085, 3, 'Popping Cherry', '\"The Ice Truck Killer\" strikes again and new homicide officer Debra is assigned the case, but she gets reprimanded for violating the chain of command; flashbacks offer insight into Dexter\'s homicidal tendencies and take him back to his first time \"taking out the garbage\"; Doakes gets on the bad side of a drug kingpin.', '/pVjoJyTwsUGP7rCLkd7S8V4GgGu.jpg', '2006-10-15', 51, 0, 'free', 'publish', NULL),
(3908, 268, 953086, 4, 'Let\'s Give the Boy a Hand', 'The Ice Truck Killer leaves severed body parts from his victims at locations that are linked to memories from Dexter\'s troubled childhood, which begins to get into Dexter\'s head.', '/e6ZiRNeHCFuXRJdwoQJORA9q9nl.jpg', '2006-10-22', 58, 0, 'free', 'publish', NULL),
(3909, 268, 953087, 5, 'Love American Style', 'The homicide division is handed an unbelievable lead when the Ice Truck Killer\'s latest victim is found alive but mutilated; Dexter is on the trail of a person who traffics in humans.', '/fpLBlBrhOSqUHXDEiiTRh9k7zPj.jpg', '2006-10-29', 56, 0, 'free', 'publish', NULL),
(3910, 268, 953088, 6, 'Return to Sender', 'The Ice Truck Killer leaves a clue at the scene where Dexter has dispatched his latest victim, and Dexter is worried that someone might have witnessed his killing. Rita is trying to deal with her ex-husband.', '/fg5uVRanMihJ184Za4UqwYjumBE.jpg', '2006-11-05', 53, 0, 'free', 'publish', NULL),
(3911, 268, 953089, 7, 'Circle of Friends', 'The squad identifies the Ice Truck Killer; Rita\'s ex-husband, an abusive addict, is paroled.', '/gpqFeUvCSMNWFd4IJbtY2FH6noD.jpg', '2006-11-12', 53, 0, 'free', 'publish', NULL),
(3912, 268, 953090, 8, 'Shrink Wrap', 'Dexter appears to be connected to a psychiatrist suspected of murdering a suicidal patient.', '/lSPPQLhChQTyU8SoVeyBLcNxzhU.jpg', '2006-11-19', 54, 0, 'free', 'publish', NULL),
(3913, 268, 953091, 9, 'Father Knows Best', 'While on a weekend getaway with Rita, his sister and her new beau, Dexter learns that his biological father, thought to be dead for 30 years, has just passed away, and that he\'s willed his son everything he owned.', '/8IUBoErgGbboihLAuPDhN5IsO2s.jpg', '2006-11-26', 56, 0, 'free', 'publish', NULL),
(3914, 268, 953092, 10, 'Seeing Red', 'The Ice Truck Killer prepares a crime scene for Dexter: a hotel room all covered in his previous victim\'s blood. But Dexter does not appreciate this gift, because his childhood memories hunt him.', '/6USM3E9TrAGfUk5mrBqhIFZ8CZ9.jpg', '2006-12-03', 57, 0, 'free', 'publish', NULL),
(3915, 268, 953093, 11, 'Truth Be Told', 'The Ice Truck Killer sets a trap for Dexter by kidnapping someone close to him; Dexter\'s increasingly odd behavior piques Doakes\'s interest.', '/igwp2lTwkn8LoLTLBzPG49hzqbB.jpg', '2006-12-10', 54, 0, 'free', 'publish', NULL),
(3916, 268, 953094, 12, 'Born Free', 'Dexter figures out who the Ice Truck Killer is, along with a dark secret from his troubled past. Meanwhile, La Guerta is replaced with a new boss and Angel figures out a way how to track the killer while he\'s still in hospital.', '/1ObZDLK3f7BucdgtmAlHZRYN3IB.jpg', '2006-12-17', 57, 0, 'free', 'publish', NULL),
(3917, 269, 953234, 1, 'It\'s Alive!', 'Things are really beginning to heat up for Dexter: Doakes\' suspicions about him are growing, his victims are escaping, and his body dump site has been found. Meanwhile Paul is troubling Rita over the missing shoe and Debra is going through trauma over the Ice Truck killer incident.', '/2jtzefZ7yIcaZoJxcOkuM4YEBHU.jpg', '2007-09-30', 54, 0, 'free', 'publish', NULL),
(3918, 269, 953225, 2, 'Waiting to Exhale', 'Dexter is finding it hard to have closure on killing his brother. There is a new FBI agent to head the \"Bay Harbor Butcher\" case. Debra is finding it tough to put the past behind her.', '/ha7i2p27VVdWY9wN9bkpQvmPmFv.jpg', '2007-10-07', 56, 0, 'free', 'publish', NULL),
(3919, 269, 953226, 3, 'An Inconvenient Lie', 'Dexter\'s inability to deceive has him pursuing a slick liar as his next victim, while Rita believes he\'s concealing a drug problem and forces him into a 12-step program where he meets Lila, a seductive new woman.', '/nhddI1zisRZtGUxJIZwKGFhDqoz.jpg', '2007-10-14', 53, 0, 'free', 'publish', NULL),
(3920, 269, 953297, 4, 'See-Through', 'Rita\'s estranged mother visits and senses something is wrong with Dexter. Masuka thinks he\'s developed a lead in the Bay Harbor Butcher case, which has Dexter concerned. Angel\'s interrogation of a witness crosses a line.', '/omBmf4Gxu8HPpnciDs6dUTYAiN3.jpg', '2007-10-21', 53, 0, 'free', 'publish', NULL),
(3921, 269, 953298, 5, 'The Dark Defender', 'Dexter discovers that the man who murdered his mother in front of him as a boy is still alive and confronts the killer as part of his recovery from addiction - but he also discovers that old impulses die hard.', '/nEWrXNNIhOCx5AGy7PZonRXjtCN.jpg', '2007-10-28', 56, 0, 'free', 'publish', NULL),
(3922, 269, 953227, 6, 'Dex, Lies, and Videotape', 'A copy-cat killer follows the lead of the \"Bay Harbor Butcher.\" Dexter must destroy an incriminating surveillance video.', '/tB4fuDRHzQTRlfszvMAoNxgoKz6.jpg', '2007-11-04', 54, 0, 'free', 'publish', NULL),
(3923, 269, 953228, 7, 'That Night, a Forest Grew', 'Dexter manages to get Doakes off his back. He devises a plan to get the police in another direction. Lila and Dex\'s relationship intensifies, and he has some interaction with Rita and the kids.', '/nwgxVpwiReDOtnBg0dMA9L4rcI8.jpg', '2007-11-11', 56, 0, 'free', 'publish', NULL),
(3924, 269, 953229, 8, 'Morning Comes', 'Dexter is attacked by the man who murdered his mother. Meanwhile, Lila wants to get closer to Dex, and Debra and Lundy close in on the Bay Harbor Butcher.', '/15WfX35RWngveAdYNCsruo12tpa.jpg', '2007-11-18', 50, 0, 'free', 'publish', NULL),
(3925, 269, 953230, 9, 'Resistance Is Futile', 'Dexter realizes it won\'t be easy to end things completely with Lila. Dexter tries to stay ahead of the investigations as the manhunt for the Bay Harbor Butcher intensifies. An enemy of Dexter figures out his secret.', '/gL34Xku1eO413hIcqWrnb69yw0r.jpg', '2007-11-25', 51, 0, 'free', 'publish', NULL),
(3926, 269, 953231, 10, 'There\'s Something About Harry', 'Doakes follows Dexter to his next crime scene and shocks him with a revelation about Harry. The Bay Harbor Butcher task force feels they are zeroing in on their man.', '/8PMgRRi6NysXyXSypwdaJiomiCM.jpg', '2007-12-02', 56, 0, 'free', 'publish', NULL),
(3927, 269, 953232, 11, 'Left Turn Ahead', 'Dexter must make a massive decision that will have an effect on all those he holds close. Lila meanwhile is back with a secret to blackmail Dexter.', '/echl9nui9uAPgjX8sqU0vfNYmvh.jpg', '2007-12-09', 52, 0, 'free', 'publish', NULL),
(3928, 269, 953233, 12, 'The British Invasion', 'Special Agent Lundy and the FBI finally settle the case of the Bay Harbor Butcher, but the heat\'s not entirely off Dexter as the flames literally close in.', '/4uOSnM1yV7azULevXV29lcCNXAt.jpg', '2007-12-16', 52, 0, 'free', 'publish', NULL),
(3929, 270, 953235, 1, 'Our Father', 'Dexter has put his life back together but things may fall apart soon. His new victim is also being targeted by Assistant District Attorney Miguel Prado. Deb has to decide how to handle Internal Affairs, as they want her to turn on her new partner.', '/97VmyFgGYJECb76lxvbARLU17kk.jpg', '2008-09-28', 58, 0, 'free', 'publish', NULL),
(3930, 270, 953236, 2, 'Finding Freebo', 'Debra and the homicide unit, Dexter and ADA Miguel Prado are all searching for the same serial killer, who is responsible for the death of Prado\'s younger brother. Meanwhile at home, Dexter is faced with a decision to make concerning Rita and her kid', '/gaKRlCQcuiSRjJwst4HPoUvrGWv.jpg', '2008-10-05', 50, 0, 'free', 'publish', NULL),
(3931, 270, 953299, 3, 'The Lion Sleeps Tonight', 'Dexter and a pedophile have a run-in; Dexter is unable to restore Freebo\'s good name after he is accused of a murder he didn\'t commit. Also, Dexter\'s friendship with Miguel weighs on his mind.', '/a9rXiVNSe5y2hOvq5BtaVkFmgCb.jpg', '2008-10-12', 50, 0, 'free', 'publish', NULL),
(3932, 270, 953237, 4, 'All in the Family', 'Dexter scrambles to convince Rita that his marriage proposal is sincere and romantic. Miguel\'s vengeful brother Ramon searches desperately for their sibling\'s murderer, who was secretly killed by Dexter.', '/2WszcqVwyn9MU8uSAD9CWR9pXZy.jpg', '2008-10-19', 55, 0, 'free', 'publish', NULL),
(3933, 270, 953238, 5, 'Turning Biminese', 'Dexter hears the story of a husband who has gotten away with murdering two wives for financial gain and tracks the man to Bimini, but Rita has a medical emergency while Dexter has disappeared.', '/xzg0wTQNR1IjlqeCLPC8teyJwQ3.jpg', '2008-10-26', 49, 0, 'free', 'publish', NULL),
(3934, 270, 953239, 6, 'Sí Se Puede', 'Dexter tests Miguel to see if he is on his dark-side job. Rita questions her career path after being fired from her job. Debra believes she in some way caused another homicide while working on her current case.', '/nRxCveqjRzd1L7tMnmlaKKUmxXO.jpg', '2008-11-02', 55, 0, 'free', 'publish', NULL),
(3935, 270, 953300, 7, 'Easy as Pie', 'Dexter begins working with Miguel but they quickly have differences in selecting a potential new victim; Rita discovers that Miguel\'s wife suspects him of an affair; an old friend of Dexter\'s asks for help in ending her life.', '/bb4eTOgQoiukJWMQ92yoykjqtc6.jpg', '2008-11-09', 58, 0, 'free', 'publish', NULL),
(3936, 270, 953240, 8, 'The Damage a Man Can Do', 'Dexter undertakes to teach Miguel the Code, but doesn\'t realize he\'s whetting his partner\'s thirst for blood. Meanwhile, Debra is one step closer to finding the Skinner but a secret revealed about Anton sends him packing.', '/quhTwhj7QFCHV7FsHVZM4Q9aXRp.jpg', '2008-11-16', 55, 0, 'free', 'publish', NULL),
(3937, 270, 953241, 9, 'About Last Night', 'Miguel and Dexter\'s friendship is impacted when Rita confronts Miguel about his alleged infidelity. Believing Skinner has abducted Anton, Debra pulls out all the stops to find him', '/sK9IKd3lxhasGG2kurO89wzDNkr.jpg', '2008-11-23', 52, 0, 'free', 'publish', NULL),
(3938, 270, 953301, 10, 'Go Your Own Way', 'A series of chess-like moves ensues when Dexter and Miguel vie for the upper hand, with Miguel winning Rita\'s affection by presenting her with a lavish wedding gift. Elsewhere, Debra wonders if her relationship with Anton is worth the trouble.', '/jeEK4lpw0KtnqReqfihnctu5TvD.jpg', '2008-11-30', 51, 0, 'free', 'publish', NULL),
(3939, 270, 953242, 11, 'I Had a Dream', 'While preparing for his big wedding day, Dexter has to figure out a way to remove Miguel from his life for good. In the meantime, Rita has troubles of her own, when Syl reveals that Miguel has been seeing one of his old flames. Debra finds a new clue that brings her even closer to catching the Skinner.', '/AscduWJM3dUtWg3TTPt0nQDA3Om.jpg', '2008-12-07', 51, 0, 'free', 'publish', NULL),
(3940, 270, 953302, 12, 'Do You Take Dexter Morgan?', 'It is the day before Dexter\'s wedding and Dexter must deal with two people targeting him, while preparing for his special occasion. Meanwhile, Angel tells Deb he\'s put her in for a promotion, but after he finds out some information her shield may be gone before she gets it.', '/eA7iCZXyED1D7GSiJHwzc2iTj4l.jpg', '2008-12-14', 52, 0, 'free', 'publish', NULL),
(3941, 271, 953243, 1, 'Living the Dream', 'Dexter sleeplessly struggles to balance his new family life with his dark, murderous drive for a fresh victim, and his busier-than-ever forensic career pursuing a new target, \"The Trinity Killer.\"', '/4dJnt4To4wrM9QX0cMA7EQ0ZSM3.jpg', '2009-09-27', 54, 0, 'free', 'publish', NULL),
(3942, 271, 953303, 2, 'Remains to Be Seen', 'Suffering from amnesia following his car crash, Dexter begins searching for Benny Gomez\' lost body, with a helping hand from Harry. Meanwhile, Debra struggles with the return of her former lover while Quinn tries to juggle his personal and work life. Meanwhile, Trinity begins stalking his next chosen victim.', '/wLVHnCNEcAc4c7OTwxBX4Or567k.jpg', '2009-10-04', 50, 0, 'free', 'publish', NULL),
(3943, 271, 953244, 3, 'Blinded by the Light', 'Dexter is hampered by his neighborhood\'s increased vigilance due to vandalism, his temporary inability to drive himself anywhere, and his admiration for the killing technique of the artful Trinity Killer.', '/fyUv2iXYpKSpWqq8psrV8dT7p5y.jpg', '2009-10-11', 52, 0, 'free', 'publish', NULL),
(3944, 271, 953304, 4, 'Dex Takes a Holiday', 'Dexter gets some much-needed R&R time with Rita and the kids out of town, leading to his stalking of a new victim until he unexpectedly begins to empathize with his target, a cop that murdered her family.', '/1pBP6NIWBlbbSppmePj08aAkepS.jpg', '2009-10-18', 55, 0, 'free', 'publish', NULL),
(3945, 271, 953245, 5, 'Dirty Harry', 'Dexter is inspired to investigate the Trinity Killer on his own, while Debra blames herself for an event that was out of her control, and Rita realizes how little she knows her husband after discovering one of his secrets.', '/zEqtcsrAPjGwPpXphXmXzs3s0Qr.jpg', '2009-10-25', 50, 0, 'free', 'publish', NULL),
(3946, 271, 953246, 6, 'If I Had a Hammer', 'Dexter doubles his efforts to stay ahead of the official Trinity investigation, and receives relationship advice about the friction between himself and Rita from a most unexpected source.', '/o7QS9elByQgYGRAimw2TI8vdKP3.jpg', '2009-11-01', 56, 0, 'free', 'publish', NULL),
(3947, 271, 953305, 7, 'Slack Tide', 'Dexter finally strikes a balance between family, career and his secret life, but is thwarted in his pursuit of his next victim, while Debra expresses a renewed and unwelcome interest in their father\'s checkered past.', '/cCUipEG71f7dVwCb6vnpPrx8fge.jpg', '2009-11-08', 53, 0, 'free', 'publish', NULL),
(3948, 271, 953247, 8, 'Road Kill', 'Dexter wonders if his father\'s Code is truly the right path, and hopes to get answers by accompanying Trinity on an out-of-town road trip, while Debra discovers that her single-minded pursuit of Trinity has blinded her to the truth.', '/9B2ykyALH7ZaUMGQQlYbvYc8pw9.jpg', '2009-11-15', 55, 0, 'free', 'publish', NULL),
(3949, 271, 953248, 9, 'Hungry Man', 'For most people, Thanksgiving is a time for traditions and family. But for Dexter, it’s an opportunity to get closer to his most dangerous adversary yet. As Dexter gains insight into Arthur’s psychology by studying those closest to him, he finds himself drawn into a bizarre and twisted world.', '/c0MAgpJXH5TkNxShkPjDHz5WXf9.jpg', '2009-11-22', 52, 0, 'free', 'publish', NULL),
(3950, 271, 953306, 10, 'Lost Boys', 'Dexter finally believes he understands the beast known as Trinity. But when a ten-year old boy goes missing, Dexter is forced to question everything he’s learned up to this point.', '/8zYOWNOB76BeTgsZYEhyjDCDLFS.jpg', '2009-11-29', 57, 0, 'free', 'publish', NULL),
(3951, 271, 953249, 11, 'Hello, Dexter Morgan', 'Dexter must buy time to protect himself when Debra\'s investigation brings the department one step away from identifying Arthur as the Trinity Killer; Rita confides in Dexter, but is disappointed in the result.', '/wDLYbem5WVkncXCOmmzTMPa1o8A.jpg', '2009-12-06', 52, 0, 'free', 'publish', NULL),
(3952, 271, 953250, 12, 'The Getaway', 'Dexter and Arthur find themselves on a collision course, as Debra unearths a shocking long-hidden truth, Rita admits her marriage to Dexter is troubled, and Batista and LaGuerta face the consequences of an ethics breach.', '/4ikoyXM8YIwLJFkiZdmwsx7yGc5.jpg', '2009-12-13', 52, 0, 'free', 'publish', NULL),
(3953, 272, 953257, 1, 'My Bad', 'Dexter must make a choice; Quinn stirs up trouble for Dexter but supports Deb.', '/lNMSOuA1LTp71hSFsb25G6w9Gxq.jpg', '2010-09-26', 55, 0, 'free', 'publish', NULL),
(3954, 272, 953308, 2, 'Hello, Bandit', 'Dexter tries to focus on the children and fight his dark urges; Debra ends up on Quinn\'s doorstep.', '/yqTBpVchb5WndUMXkbRlYKpSg1A.jpg', '2010-10-03', 50, 0, 'free', 'publish', NULL),
(3955, 272, 953258, 3, 'Practically Perfect', 'Dexter hires a nanny; Debra is annoyed with her new partner; Quinn continues to investigate Rita\'s murder.', '/p1lle5gWz29k8YF9Prj96C2UFDP.jpg', '2010-10-10', 49, 0, 'free', 'publish', NULL),
(3956, 272, 953251, 4, 'Beauty and the Beast', 'Dexter must save a life; Deb has a confrontation with a key suspect; Quinn follows up on the similarities between Dexter and Kyle Butler.', '/82SPJjIJP7xvViWD0xOgDLezdOs.jpg', '2010-10-17', 51, 0, 'free', 'publish', NULL),
(3957, 272, 953309, 5, 'First Blood', 'Dexter is saddled with an unwanted conspirator; Dexter worries about how Rita\'s death will affect Harrison; Deb works alone; Quinn enlists an old friend\'s help.', '/eR3jzZ6WKD09ocsxq5fRGHuGqMX.jpg', '2010-10-24', 51, 0, 'free', 'publish', NULL),
(3958, 272, 953252, 6, 'Everything Is Illumenated', 'Dexter is drawn into a precarious situation; Batista discovers an interesting lead; Quinn gets information about Dexter from a questionable source.', '/kpa3E6ynZdFORmEJzvjzMnEukOM.jpg', '2010-10-31', 51, 0, 'free', 'publish', NULL),
(3959, 272, 953310, 7, 'Circle Us', 'Dexter is called to investigate a horrifying crime scene; the Santa Muerte case leads to a violent standoff between Debra and the Santa Muerte killers.', '/yWmgJkvzS1zx7YhqCfgVf1r1Ovq.jpg', '2010-11-07', 49, 0, 'free', 'publish', NULL),
(3960, 272, 953253, 8, 'Take It!', 'Dexter and Lumen vet and stalk a violent killer; Debra gets into some unexpected trouble from the fallout of the Santa Muerte case', '/sxQcDzAseVJkiUXqIXfWaTiRYYw.jpg', '2010-11-14', 53, 0, 'free', 'publish', NULL),
(3961, 272, 953254, 9, 'Teenage Wasteland', 'Dexter and Lumen hunt for their next victim; Debra uncovers new evidence in the Barrel Girl case', '/eoxBiNdnAxI1mTcIdHXcn6jSoN0.jpg', '2010-11-21', 55, 0, 'free', 'publish', NULL),
(3962, 272, 953307, 10, 'In the Beginning', 'Homicide uncovers some key evidence linked to one of Dexter\'s and Lumen\'s prior victims; Debra identifies two more suspects in the case.', '/s9xVM0xayQbGaGD6ttARrSVsySm.jpg', '2010-11-28', 54, 0, 'free', 'publish', NULL),
(3963, 272, 953255, 11, 'Hop a Freighter', 'Dexter must do damage control; Debra\'s speculation begins to take shape; Quinn becomes involved in a homicide.', '/xJw2WiS3uHpMaFmwv90oY7Mq6qC.jpg', '2010-12-05', 48, 0, 'free', 'publish', NULL),
(3964, 272, 953256, 12, 'The Big One', 'Dexter realizes that he and Lumen are being lured into a trap and risks everything to escape; Quinn needs help that only Dexter can provide.', '/fbAGakIEtwPpqi573MsseIDXE9s.jpg', '2010-12-12', 56, 0, 'free', 'publish', NULL),
(3965, 273, 953311, 1, 'Those Kinds of Things', 'Dexter shows up at his 20th high-school reunion with the intention of confronting the former prom king. Elsewhere, an investigation into a heinous murder with religious overtones leads Dexter to ponder spiritual matters and wonder about his son\'s legacy. And an unexpected situation results in Debra becoming a hero.', '/3J0Swm0EUVur5vL8NddP2iYlZRS.jpg', '2011-10-02', 54, 0, 'free', 'publish', NULL),
(3966, 273, 953259, 2, 'Once Upon a Time...', 'Brother Sam, a minister with a criminal history, is brought in by the homicide department to help solve a macabre murder, but Dexter sees him for what he really is, and it\'s definitely not a man of God. Elsewhere, Debra\'s sudden hero status elicits a pair of surprising proposals.', '/5jm0bu5yAOEDpUuwGYmyvEeaO0.jpg', '2011-10-09', 54, 0, 'free', 'publish', NULL),
(3967, 273, 953313, 3, 'Smokey and the Bandit', 'Dexter is confronted with a sobering glimpse of his own potential future when a serial killer from his past makes a startling reappearance; Debra is uncomfortable in her new job; Travis struggles to keep his mentor happy, as he and Gellar prepare a new twisted tableau, ensuring Debra\'s next task will be a daunting one.', '/zEYmKykAr8cjTuzvNJS7O8Qzb1u.jpg', '2011-10-16', 51, 0, 'free', 'publish', NULL),
(3968, 273, 953312, 4, 'A Horse of a Different Color', 'Much to his own surprise, an emergency with Harrison and a new tableau from Gellar and Travis has Dexter leaning on Brother Sam and an unexpected winged messenger for support as he questions the idea of faith; with proof of a religiously motivated killer, Homicide hunts for a zealot, with Debra giving her first official press conference.', '/s4RtEYi17L5Q1ltZo2GJVhtniKZ.jpg', '2011-10-23', 53, 0, 'free', 'publish', NULL),
(3969, 273, 953262, 5, 'The Angel of Death', 'With the help of his newfound friend Brother Sam, Dexter wonders if there is light within him to counter the darkness, while the search for the Doomsday Killers takes him in a new direction; Batista and Quinn pay a visit to the university where Professor Gellar taught; due to departmental regulations following the shooting, Debra is forced to begin therapy.', '/nqEs9ZNXzwDpTJyGqQ4DLEERuUT.jpg', '2011-10-30', 52, 0, 'free', 'publish', NULL),
(3970, 273, 953263, 6, 'Just Let Go', 'Dexter is caught up in a very personal case that awakens the needs of his Dark Passenger; Debra feels overwhelmed by her new Lieutenant duties, made all the more complicated when she finds out Quinn slept with a witness in the Doomsday case.', '/xkagSIG0cWXfzwI1QO1B4d8YrLy.jpg', '2011-11-06', 55, 0, 'free', 'publish', NULL),
(3971, 273, 953314, 7, 'Nebraska', 'Dexter finds himself teamed up with a fellow Dark Passenger when he takes a road trip to Nebraska to tie up some loose ends from the past; Debra deals with the complications of her promotion as she leads the Doomsday investigation.', '/1QSX0cANrmBaSh33vW5BElbfuE2.jpg', '2011-11-13', 52, 0, 'free', 'publish', NULL),
(3972, 273, 953260, 8, 'Sin of Omission', 'Dexter uses lessons he learned from Brother Sam to follow up on some new leads in the Doomsday investigation; Debra butts heads with Captain LaGuerta over the case of a dead call girl.', '/bqNoJcR57Of84oXnrUO9ljzjnpJ.jpg', '2011-11-20', 53, 0, 'free', 'publish', NULL),
(3973, 273, 953264, 9, 'Get Gellar', 'Dexter receives help from an unexpected source while hunting the Doomsday Killers and staying one step ahead of Homicide; Debra discovers something new about herself in therapy.', '/6PwAsx7Lkn8qngruabjK0zl9Wlr.jpg', '2011-11-27', 51, 0, 'free', 'publish', NULL),
(3974, 273, 953266, 10, 'Ricochet Rabbit', 'Dexter tries to figure out the Doomsday Killers\' next victim before it\'s too late; Debra has a strong reaction to a crime scene, which leads her to the realization that she leans too heavily on her brother.', '/vMNxVlrjnNDvdangm2w3ZS8o8NM.jpg', '2011-12-04', 50, 0, 'free', 'publish', NULL),
(3975, 273, 953265, 11, 'Talk to the Hand', 'Dexter finds that in order to catch the Doomsday Killers, he must create a macabre tableau of his own; Debra\'s battle with LaGuerta over the case of the dead call girl boils over, and her therapist makes an unnerving suggestion.', '/cTvPiVOaxZ6IQFOUZr0elDHqpW8.jpg', '2011-12-11', 48, 0, 'free', 'publish', NULL),
(3976, 273, 953315, 12, 'This Is the Way the World Ends', 'Dexter and Homicide race against a lunar eclipse to catch the Doomsday Killers before their final gruesome act; Debra struggles with a new emotional reality.', '/j2L0qniodfmIV3KcT0Wnll5yMII.jpg', '2011-12-18', 52, 0, 'free', 'publish', NULL),
(3977, 274, 953316, 1, 'Are You...?', 'After witnessing her brother kill, Debra attempts to reconcile with Dexter while struggling to cover up their involvement with the murder.', '/6I9tGOb5dLVBOBPEv39ipwtYwNs.jpg', '2012-09-30', 56, 0, 'free', 'publish', NULL),
(3978, 274, 953318, 2, 'Sunshine and Frosty Swirl', 'Miami Metro sets out to unearth new evidence on a claim from a local convict that he has new information regarding a 15-year-old crime spree; Debra tries to cure Dexter of his killer tendencies.', '/jduaZpGaX9px1truLCy7FJrHdob.jpg', '2012-10-07', 59, 0, 'free', 'publish', NULL),
(3979, 274, 953317, 3, 'Buck the System', 'Dexter tries to bring Debra on board with his new target. While the Ukrainian mob seeks revenge for the killing of one of their own, Quinn grows close to a dancer at their strip club.', '/lggXg0Kj79ULd9D2vPmSm90KqIA.jpg', '2012-10-14', 57, 0, 'free', 'publish', NULL),
(3980, 274, 953268, 4, 'Run', 'After capturing a deadly killer, things go awry for Miami Metro, sending Debra into a tailspin. In an effort to help his sister, Dexter enters into a dangerous game of cat and mouse, while the Ukrainian mob continues to seek revenge.', '/zB3LE61qzBC1e7WhZ5E0MJcDZxY.jpg', '2012-10-21', 54, 0, 'free', 'publish', NULL),
(3981, 274, 953319, 5, 'Swim Deep', 'While trying to uncover why someone was killed on his boat, Dexter must out-maneuver a vengeful Isaak. New leads are brought to light on the Wayne Randall case by Hannah McKay, Randall\'s alluring former accomplice who Dexter discovers has a secret.', '/bInn82KQiRP8toc30EQyexzuKm0.jpg', '2012-10-28', 58, 0, 'free', 'publish', NULL),
(3982, 274, 953269, 6, 'Do the Wrong Thing', 'Debra gets to know a local crime writer who\'s dug up some incriminating dirt on Hannah McKay (Dexter\'s newest obsession). Quinn gets an offer he tries to refuse and Batista is drawn to a new business opportunity. LaGuerta keeps digging into the Bay Harbor Butcher case.', '/rzPaHebEgx3tRIRdB2ZnhuAfivR.jpg', '2012-11-04', 55, 0, 'free', 'publish', NULL),
(3983, 274, 953270, 7, 'Chemistry', 'Quinn falls back into his old ways as he makes some questionable choices to protect Nadia. Things heat up as Dexter and Hannah grow closer, but when Sal Price discovers the two are involved, he wants the exclusive story.', '/GrtPrmlX1ltTpvES66baLLWjlj.jpg', '2012-11-11', 54, 0, 'free', 'publish', NULL),
(3984, 274, 953271, 8, 'Argentina', 'Fresh out of jail, Isaak renews his pursuit of Dexter while Quinn continues his power struggle with the Koshkas. Dexter tries to keep Debra in the dark about his relationship with Hannah, but a surprise visit from Astor, Cody and Harrison throws a wrench into his plans.', '/94fPHDTzIa6nNZ3ZMfFVad4TZKS.jpg', '2012-11-18', 58, 0, 'free', 'publish', NULL),
(3985, 274, 953272, 9, 'Helter Skelter', 'As Dexter scrambles to track down Isaak, a power struggle erupts among the Koshka Brotherhood, which could prove to Dexter\'s advantage. Meanwhile, Miami Dade tries to smoke out the Phantom Arsonist.', '/y79hTt1bhkYFQcjkXXiQmbPSioN.jpg', '2012-11-25', 57, 0, 'free', 'publish', NULL),
(3986, 274, 953273, 10, 'The Dark... Whatever', 'Dexter is unnerved when Hannah\'s father pays him a surprise visit; the Phantom Arsonist\'s crimes become more vicious; and Quinn defends Nadia\'s honor and finds himself in a volatile situation. Meanwhile; LaGuerta asks a former superior for help on the Bay Harbor Butcher case.', '/xKol1I04dpSJRn5CajDGES2GpSl.jpg', '2012-12-02', 54, 0, 'free', 'publish', NULL),
(3987, 274, 953274, 11, 'Do You See What I See?', 'As Christmas approaches, Dexter tries to balance his life with Hannah and his relationship with Debra. Dexter learns the man responsible for ordering his mother\'s death has been released from jail.', '/qKxIRwbaKsxNyGSOmTecBWXdKVt.jpg', '2012-12-09', 58, 0, 'free', 'publish', NULL),
(3988, 274, 953275, 12, 'Surprise, Motherfucker!', 'Dexter must protect himself when LaGuerta closes in on his secret.', '/Arx36RnxTeUZT1lRhdHviLXOhll.jpg', '2012-12-16', 56, 0, 'free', 'publish', NULL),
(3989, 275, 953320, 1, 'A Beautiful Day', 'It’s been 6 months since LaGuerta’s murder – and Dexter is still managing life as a dad, brother, and serial killer. Debra now works as a PI for a private firm and Batista has replaced her as Lieutenant. Meanwhile, Miami Metro investigates the murder of a man who has had pieces of his brain removed.', '/sMIbqOhRemiQnAZS03uZEAsMKwE.jpg', '2013-06-30', 53, 0, 'free', 'publish', NULL),
(3990, 275, 953276, 2, 'Every Silver Lining...', 'Miami Metro continues their hunt for the Brain Surgeon, while Dr. Vogel enlists Dexter to do her bidding based on her own personal experience with her previous patients. Debra continues to track down her PI case and has to take matters into her own hands.', '/zlwGYHQLOtyrcuQNFA826uHDsjb.jpg', '2013-07-07', 58, 0, 'free', 'publish', NULL),
(3991, 275, 953277, 3, 'What\'s Eating Dexter Morgan?', 'Dexter continues his manhunt for the Brain Surgeon. Dr. Vogel tries to prove to Dexter that he’s perfect as a psychopath. Debra’s PTSD kicks in and she makes a desperate plea to confess to LaGuerta’s murder.', '/tDR2GuKsD51sCG4NsRugIxF40IG.jpg', '2013-07-14', 49, 0, 'free', 'publish', NULL),
(3992, 275, 953279, 4, 'Scar Tissue', 'Dexter tracks down another potential serial killer from Dr. Vogel’s list. Quinn celebrates his passing of the Sergeant’s exam by defending Debra’s honor in a fight. Dr. Vogel begins treating Debra for her PTSD.', '/vUhpyOERYLVC49P450zmDeGWMtx.jpg', '2013-07-21', 50, 0, 'free', 'publish', NULL),
(3993, 275, 953261, 5, 'This Little Piggy', 'Dr. Vogel gets abducted by the Brain Surgeon, while Dexter and Debra try and rescue her. Masuka finds out he has a daughter.', '/1R1HZZRbw5giGm9YCJhnYngheQ2.jpg', '2013-07-28', 48, 0, 'free', 'publish', NULL),
(3994, 275, 953278, 6, 'A Little Reflection', 'Dexter monitors a young psychopath to see if he is suited for his table. Dexter and Debra finally get back to normal, but are surprised by his ex, Hannah.', '/enjTk2EdDnLfbN23qL74WDIQ9Fs.jpg', '2013-08-04', 56, 0, 'free', 'publish', NULL),
(3995, 275, 953267, 7, 'Dress Code', 'Dexter hunts down Hannah to figure out why she’s back in Miami. Dexter also takes on a protégé and starts teaching him the Code.', '/5q68Iy9MB0l1osSi404MePZ1xEx.jpg', '2013-08-11', 53, 0, 'free', 'publish', NULL),
(3996, 275, 953281, 8, 'Are We There Yet?', 'Dexter tracks down his protégé in the belief that he murdered his neighbor. Meanwhile, Dexter tries to help Hannah escape the country.', '/zzJy8KWJqQPhjMA3uG2h8SbjO81.jpg', '2013-08-18', 53, 0, 'free', 'publish', NULL),
(3997, 275, 953283, 9, 'Make Your Own Kind of Music', 'Dexter investigates a murder that hits close to home. Meanwhile, Dr. Vogel gets the surprise of her life when someone from her past returns.', '/9yRjrK62A8nyzJCNICt19k4LKXL.jpg', '2013-08-25', 56, 0, 'free', 'publish', NULL),
(3998, 275, 953322, 10, 'Goodbye Miami', 'Dexter enlists Dr. Vogel\'s help to lure the Brain Surgeon to a location in order to get him on the table. Later, an important person in Dexter\'s life is murdered before his eyes.', '/7rtNUEydPUGyoUu4AM2hpJW3S5W.jpg', '2013-09-08', 53, 0, 'free', 'publish', NULL),
(3999, 275, 953284, 11, 'Monkey in a Box', 'Dexter is torn between fleeing the country with Hannah and Harrison, and taking Saxon out once and for all.', '/3MefgmO0eYWlXUFSic7Dn45UUur.jpg', '2013-09-15', 53, 0, 'free', 'publish', NULL),
(4000, 275, 953321, 12, 'Remember the Monsters?', 'Dexter is faced with impossible odds as a brewing hurricane makes its way towards Miami.', '/eej5sOpA2A73O6SudZxFsw2oB5n.jpg', '2013-09-22', 57, 0, 'free', 'publish', NULL),
(4001, 276, 1639849, 1, 'Episode 1', 'Despite the ministrations of sex therapist mom Jean and encouragement from pal Eric, Otis worries that he can\'t get it on. He\'s not the only one.', '/4m4Dt8sZJpoZ0hIfTxiNefq0rhT.jpg', '2019-01-11', 52, 0, 'free', 'publish', NULL),
(4002, 276, 1666360, 2, 'Episode 2', 'Egged on by Maeve—and finding that dispensing sex tips is tougher than he thought—Otis tries offering free advice at a classmate\'s house party.', '/uCFl2rMgA0h7zkqMuSRdJKzhxOm.jpg', '2019-01-11', 50, 0, 'free', 'publish', NULL),
(4003, 276, 1666361, 3, 'Episode 3', 'Otis\' clinic achieves liftoff, as does his attraction to Maeve, who unexpectedly asks him for help. Eric swings off on his own and fields a come-on.', '/1eG2PslaSsfPlVnLyA6FbjAUsio.jpg', '2019-01-11', 50, 0, 'free', 'publish', NULL),
(4004, 276, 1666362, 4, 'Episode 4', 'Eric realizes Otis has fallen for Maeve. But the young sex therapist finds himself torn when hot guy Jackson seeks help with his secret crush.', '/lzDSSWhqUrwMAb6Dlki8cnj7GTO.jpg', '2019-01-11', 47, 0, 'free', 'publish', NULL),
(4005, 276, 1666363, 5, 'Episode 5', 'An explicit pic puts a mean girl on the spot. Maeve wants to track down the shaming culprit, forcing Otis to make a tough choice on an important day.', '/wd9xLkImxfQyIx3JQtMPYkrfhvC.jpg', '2019-01-11', 47, 0, 'free', 'publish', NULL),
(4006, 276, 1666365, 6, 'Episode 6', 'Eric\'s trauma isolates him, and Maeve\'s essay wins a prize. Otis tries to hook up with Lily, but his deep-seated issues get in the way.', '/pzWhca23Vz1ERIas8hEOKeHyWAL.jpg', '2019-01-11', 49, 0, 'free', 'publish', NULL),
(4007, 276, 1666366, 7, 'Episode 7', 'The big dance brings out the best, and the drama, in Moordale\'s student body. Otis finds a date, Maeve gets her dress, and Eric returns with style.', '/s6vOtDfOa0LHMFzdzTrKOmirzZJ.jpg', '2019-01-11', 51, 0, 'free', 'publish', NULL),
(4008, 276, 1666367, 8, 'Episode 8', 'Otis feels violated by Jean\'s new book, and Maeve takes the fall for her brother. Eric serves detention with an old foe, while Lily\'s body betrays her.', '/uQBpwYS0RMEQb3Etu2YAiS26IJB.jpg', '2019-01-11', 53, 0, 'free', 'publish', NULL),
(4009, 277, 1988423, 1, 'Episode 1', 'Masturbation turns out to be Otis\' secret talent, but can he master his unruly desires for Ola? A chlamydia outbreak distracts the student body.', '/zLUTt5SzgvvpYokTwL9nq2QEEZt.jpg', '2020-01-17', 51, 0, 'free', 'publish', NULL),
(4010, 277, 1994667, 2, 'Episode 2', 'After Jean makes a cringey appearance at school, Otis tries his hand at pleasing Ola—and advising a hapless teacher. Fearless Maeve buckles.', '/aoTUp1kKCUeaw8jAyu2ZJXJq4gD.jpg', '2020-01-17', 50, 0, 'free', 'publish', NULL),
(4011, 277, 1994668, 3, 'Episode 3', 'On her way to surprise Maeve, Aimee gets a horrible shock on the bus. Rahim connects with Eric as a Milburn family dinner gets seriously awkward.', '/oO3Rxb9662jv1NprN5VnrQFJH9z.jpg', '2020-01-17', 49, 0, 'free', 'publish', NULL),
(4012, 277, 1997014, 4, 'Episode 4', 'Ola wants to go all the way, but Otis is on edge. Jean and Maeve need their space. Jackson has performance worries, and star-crossed lovers reconnect.', '/n0FmFaY5WkF87nV01y7dU1BZczD.jpg', '2020-01-17', 51, 0, 'free', 'publish', NULL),
(4013, 277, 1997015, 5, 'Episode 5', 'Otis and Eric get away from romance and retreat to the woods with Remi. But parents aren’t perfect, as Maeve knows. Later, Ola follows her heart.', '/9th5kDCTc5nYjz9aE5SI395XnRC.jpg', '2020-01-17', 53, 0, 'free', 'publish', NULL),
(4014, 277, 1997016, 6, 'Episode 6', 'Bouncing back is the only option, so Otis throws a small gathering that turns rowdy, and Jackson deals with the healing. Who can handle the truth?', '/fZbrT3LgfvehTMdNg0ti92OT7Wt.jpg', '2020-01-17', 54, 0, 'free', 'publish', NULL),
(4015, 277, 1997017, 7, 'Episode 7', 'Welcome to the morning after. \"Sex kid\" has made a huge mess—and just can\'t stop barfing. Chaos comes to class, and in detention, the girls bond.', '/2b0Qw7MLXCBW8558zHIVll5EUgN.jpg', '2020-01-17', 50, 0, 'free', 'publish', NULL),
(4016, 277, 1997018, 8, 'Episode 8', 'The talking cure may be failing Otis and Jean as they sort out their issues. A wary Maeve makes the finals. Sexy Shakespeare never goes out of style.', '/5AvJbMdjERWUTv8AeXzLyssxTWs.jpg', '2020-01-17', 59, 0, 'free', 'publish', NULL),
(4017, 278, 3042769, 1, 'Episode 1', 'Moordale\'s friskiest come together again — in more ways than one. Otis sports a \'stache but hides a secret. Jean comes clean. A head teacher arrives.', '/dYvqyupHvIKIHHg9u4jut1rAVwx.jpg', '2021-09-17', 54, 0, 'free', 'publish', NULL),
(4018, 278, 3042829, 2, 'Episode 2', 'Makeovers take over when Ruby gives Otis a magnetic revamp and Hope tones the school down. Way down. Elsewhere, Eric and Adam look to level up.', '/nTJ3Odh4J5geDIFgJSWrEzQjAcE.jpg', '2021-09-17', 61, 0, 'free', 'publish', NULL),
(4019, 278, 3042830, 3, 'Episode 3', 'Self-expression is out as uniforms sweep the student body. Aimee opens up about the assault while Jackson bonds with cool nonbinary student Cal.', '/8KUoW618yVL13qkBc7ogFf6f2LP.jpg', '2021-09-17', 53, 0, 'free', 'publish', NULL),
(4020, 278, 3099439, 4, 'Episode 4', 'In the cold light of day, can sex turn into intimacy, and vice versa? Ruby recoils from Otis. Maeve connects with Isaac. Abstinence roils Moordale.', '/ywhZRiD8BgXoKM0kHgM89OitoLz.jpg', '2021-09-17', 53, 0, 'free', 'publish', NULL),
(4021, 278, 3099440, 5, 'Episode 5', 'Vivid history collides with real awkwardness in France as the poo hits a windshield and friends slam on the brakes. A spark reignites. Jean explodes.', '/jehLpkTLWfnnyZyKSeVSgooUQf4.jpg', '2021-09-17', 54, 0, 'free', 'publish', NULL),
(4022, 278, 3099441, 6, 'Episode 6', 'The truth is out there: Maeve gets the news, Aimee reveals her vulva cupcakes and more, and Eric navigates Nigerian life. Hope goes to new extremes.', '/oCIqUWkdNr0GQZ3BA3SgxHcqWH8.jpg', '2021-09-17', 59, 0, 'free', 'publish', NULL),
(4023, 278, 3099442, 7, 'Episode 7', 'Home is where the heat is. Jean contends with a hot mess and a cold shoulder. Maeve deals with a mum on the run. The \"sex school\" finally goes public.', '/gsmHo06nkGvk39WY62XCNmj8iXz.jpg', '2021-09-17', 58, 0, 'free', 'publish', NULL),
(4024, 278, 3099443, 8, 'Episode 8', 'As a new day dawns, Moordale\'s fate hangs in the balance. Aimee spills. Eric confesses. Otis haunts the hospital. Honesty matters now, more than ever.', '/gPUI3MGqdiaFuBjJ3YVBrF70bjD.jpg', '2021-09-17', 60, 0, 'free', 'publish', NULL),
(4025, 279, 4564754, 1, 'Episode 1', 'Maeve butts heads with a prickly professor. Oceans apart, will her connection with Otis sizzle or fizzle? An attempted nude leads to a hairy situation.', '/lKw8GIfelnlBzKm5JuTvBumAORz.jpg', '2023-09-21', 55, 0, 'free', 'publish', NULL),
(4026, 279, 4564755, 2, 'Episode 2', 'When a popular couple is on the rocks, Otis eyes an opportunity. Eric finds community. Surprises in the bedroom leave Jackson questioning his sexuality.', '/wTVVSQv89kDR1QppMX4IZ6wT22.jpg', '2023-09-21', 52, 0, 'free', 'publish', NULL),
(4027, 279, 4564756, 3, 'Episode 3', 'A scathing review rattles Maeve\'s resolve. Adam and Michael bond over life as a bachelor. Ruby helps Otis with his campaign — and his loneliness.', '/vc7U94KVu9PwjznEiKWWM4CTEOr.jpg', '2023-09-21', 56, 0, 'free', 'publish', NULL),
(4028, 279, 4564757, 4, 'Episode 4', 'Tragedy brings a familiar face back to Moordale. Jean\'s saving grace is Otis\' worst nightmare. Ruby does recon. Aisha asks out Cal — but there\'s a twist.', '/7SBroxsZzGiCnzi8oWxdqy2SRoz.jpg', '2023-09-21', 56, 0, 'free', 'publish', NULL),
(4029, 279, 4564758, 5, 'Episode 5', 'Jean struggles to find joy in motherhood. Between heated debates and a hot date with a grieving Maeve, can Otis perform? Jackson has an identity crisis.', '/yKNwRANLvti8ucdO1OfQA6guM9f.jpg', '2023-09-21', 55, 0, 'free', 'publish', NULL),
(4030, 279, 4564759, 6, 'Episode 6', 'Goodbyes are never easy, but this one\'s a mess. With emotions firing on all cylinders, Maeve finds the right words. Aimee gets inspired; Eric gets real.', '/iVXpPuNdGBxwm65QTosYZ0F1ZuE.jpg', '2023-09-21', 66, 0, 'free', 'publish', NULL),
(4031, 279, 4564760, 7, 'Episode 7', 'Elevator inaction sparks collective action. A sisterly argument years in the making finally boils over. Maeve makes things right — and makes a choice.', '/i7UsyXtcnpu9qngUrBR8AJf7bxF.jpg', '2023-09-21', 60, 0, 'free', 'publish', NULL),
(4032, 279, 4564761, 8, 'Episode 8', 'Cavendish rallies to search for Cal. As Eric finds his calling, Jackson discovers his roots. Much like love, truth takes many forms — and it will out.', '/78R3Wsv9sGTFcvEbOwbIIYjTwPe.jpg', '2023-09-21', 85, 0, 'free', 'publish', NULL),
(4111, 287, 168222, 1, 'Pilot', 'Michael Scofield, a structural engineer, attempts to rob a bank in order to get incarcerated at Fox River State Penitentiary, where his brother Lincoln Burrows, accused of murdering the Vice President\'s brother, is scheduled to be executed. At Fox River, Michael approaches a number of inmates, all of whom play an important role in his plan to free his brother from the inside. Meanwhile, agents Kellerman and Hale are determined to make sure the execution goes through as planned. Lincoln\'s son LJ gets into trouble.', '/zQbhElwkCKV4QG6OtXmN7wResE.jpg', '2005-08-29', 45, 0, 'free', 'publish', NULL),
(4112, 287, 168227, 2, 'Allen', 'Michael seeks help of his fellow prison inhabitants to execute his escape plans.', '/cng0p8lg3dskrktVA2W9cJZePY4.jpg', '2005-08-29', 45, 0, 'free', 'publish', NULL),
(4113, 287, 168228, 3, 'Cell Test', 'When Michael reveals his escape plan to Sucre, Sucre chooses to be no part of it, and requests a cell transfer. Michael gets a new cellmate called Haywire.', '/uVNfXPHVJV2KKzBXmeaboPv59LO.jpg', '2005-09-05', 45, 0, 'free', 'publish', NULL),
(4114, 287, 168232, 4, 'Cute Poison', 'Veronica keeps uncovering new information regarding Lincoln\'s case and decides she wants to work on the case full-time.  When no one wants to help her on the case, Nick Savrinn (an attorney) offers his assistance and the two of them visit Lincoln.', '/qdpqBpJnryXJ85WbU9ZXx8VTeTb.jpg', '2005-09-12', 45, 0, 'free', 'publish', NULL),
(4115, 287, 168235, 5, 'English, Fitz or Percy', 'Kellerman and Hale blackmail Warden Pope. Michael finds out he might get out earlier than anticipated. Veronica becomes uncertain of her allies.', '/Aw4MpQ2nRpzI2nDordPL4arhRsM.jpg', '2005-09-19', 45, 0, 'free', 'publish', NULL),
(4116, 287, 168265, 6, 'Riots, Drills and the Devil (1)', 'Michael creates a lockdown by sabotaging the air conditioning in order to execute his breakout plan properly, and unintentionally causes a riot that gets Sara into huge trouble. Meanwhile, an ex-con is blackmailed into seeing to that Lincoln is killed.', '/qARzKfInwDxBusANmznpAJe6ZOC.jpg', '2005-09-26', 45, 0, 'free', 'publish', NULL),
(4117, 287, 168262, 7, 'Riots, Drills and the Devil (2)', 'While the riot intensifies, Abruzzi and Sucre join forces. Michael must decide whether or not to save the life of Dr. Tancredi.', '/Av2ph7a1y7Xo6ppHHL73WnHfQGf.jpg', '2005-10-03', 44, 0, 'free', 'publish', NULL);
INSERT INTO `episodes` (`id`, `season_id`, `tmdb_episode_id`, `episode_number`, `name`, `overview`, `still_path`, `air_date`, `runtime`, `is_downloadable`, `type`, `status`, `video_url`) VALUES
(4118, 287, 168237, 8, 'The Old Head', 'Michael finds out a storeroom fundamental to his escape plans has been converted into a break room. Veronica and Nick are being threatened.', '/9acTia2cVK4Z0xMnoJJxmk2gGWa.jpg', '2005-10-24', 45, 0, 'free', 'publish', NULL),
(4119, 287, 168240, 9, 'Tweener', 'Abruzzi\'s demotion in the prison hierachy puts the entire escape plan at risk. Michael finds himself in the uneviable position of trying to protect T-Bag\'s new \"fish\" and facing the threat of T-Bag exposing the plan to the guards. The inmates dig themselves into a hole.', '/rZvyjYfqaTrYX4zVQf4c8vmcP15.jpg', '2005-10-31', 45, 0, 'free', 'publish', NULL),
(4120, 287, 168241, 10, 'Sleight of Hand', 'Michael is forced to give up Fibonacci\'s location to Philly Falzone, and Kellerman and Hale get a little unwanted help to track down LJ who has gone missing. Veronica and Nick uncover evidence against the man Lincoln was convicted of murdering.', '/P0CjFHhBPFLF6dMWpb3ariMUb3.jpg', '2005-11-07', 45, 0, 'free', 'publish', NULL),
(4121, 287, 168242, 11, 'And Then There Were 7', 'The escapees and Dr. Tancredi are shocked when they learn the identity of Michael\'s visitor, who brings with her a very important piece of the escape plan.', '/8gpItMKN4stiHoBNjzQy25qQ7kT.jpg', '2005-11-14', 45, 0, 'free', 'publish', NULL),
(4122, 287, 168243, 12, 'Odd Man Out', 'Michael sees proof his plan is working, so he begins to overcome the last obstacle. As the escape draws near, the group tries to reduce its number by one and targets T-Bag.', '/d2pIN5OtdCBqUPsOGEtGkMJ7hxW.jpg', '2005-11-21', 44, 0, 'free', 'publish', NULL),
(4123, 287, 168244, 13, 'End of the Tunnel', 'With Lincoln\'s execution scheduled for the following day, Veronica comes out of hiding to contact him and gains an ally. Kellerman makes the ultimate sacrifice to preserve the conspiracy. Michael looks for a way to get Lincoln out of solitary confinement in time for the escape that evening. The inmates risk everything as they attempt their escape.', '/mGvj5UD2BQklKIRPMiXRdkT33MJ.jpg', '2005-11-28', 45, 0, 'free', 'publish', NULL),
(4124, 287, 168247, 14, 'The Rat', 'Veronica and Nick request a judge to postpone Lincoln\'s execution. A C.O. becomes suspicious about a broken door.', '/vOOMloi6UP8KuWZG7rcp5TC6T7i.jpg', '2006-03-20', 45, 0, 'free', 'publish', NULL),
(4125, 287, 168249, 15, 'By the Skin and the Teeth', 'As Lincoln is about to be executed, he briefly sees his father in the viewing room. A phone call from judge Kessler delays the execution. After reviewing the newly surfaced evidence, the judge orders the exhumation of Steadman\'s body.\n\nMichael creates a new, more dangerous, break-out plan, involving going through the prison yard. An accident puts Michael\'s new plan in danger.', '/lGRsHESkKH7iCyoPgeKVsfANieB.jpg', '2006-03-27', 45, 0, 'free', 'publish', NULL),
(4126, 287, 168251, 16, 'Brother\'s Keeper', 'Flashbacks shed light on the past actions that led to the incarceration of Lincoln, Sucre, T-Bag and C-Note. Basis of Michael\'s ingenious break-out plan are revealed. Dr. Tancredi memorizes how she ended up in Fox River State Penitentiary.', '/p1pofGSIemdioXJv2AXCq65bJUl.jpg', '2006-04-03', 45, 0, 'free', 'publish', NULL),
(4127, 287, 168252, 17, 'J-Cat', 'Lincoln is worried about Michael\'s sanity while Michael has trouble remembering some parts of the prison schematics. Sucre has to conceal the hole in the guard\'s break room. Warden Pope transfers Michael to solitary after he declines his request.', '/3e4yHirYArcvRncNcTMrsKsiU4R.jpg', '2006-04-10', 45, 0, 'free', 'publish', NULL),
(4128, 287, 168253, 18, 'Bluff', 'In an effort to recreate the missing piece of the tattoo, Michael gets transferred to the psych ward, seeking the help of Haywire. T-Bag and C-Note have to join forces.', '/fmHL1u0qdKkhplMVlYUDSpBQvBb.jpg', '2006-04-17', 45, 0, 'free', 'publish', NULL),
(4129, 287, 168254, 19, 'The Key', 'Michael must get the key to the infirmary and enlist the help of an old face, while Lincoln learns the identity of his kidnapper and another inmate learns of the escape.', '/mGwMC5LY5pHjEG0Mo6lJE1ap9pj.jpg', '2006-04-24', 45, 0, 'free', 'publish', NULL),
(4130, 287, 168257, 20, 'Tonight', 'Westmoreland wants Michael to speed up the planned escape, and gets Bellick one step closer to unraveling it. Michael has to decide whether to involve Sara in the breakout plan. Tweener\'s devotion is put to a test. Veronica finds out that her ally unexpectedly has a connection to an inmate serving time at Fox River.', '/k3CCu1lYCIVgK7UWv1Ufa16ztlj.jpg', '2006-05-01', 44, 0, 'free', 'publish', NULL),
(4131, 287, 168259, 21, 'Go', 'Everyone\'s ready to make their escapes across the high wire. Veronica and Nick realize they may be in over their heads. And Agent Kellerman helps Vice President Reynolds calm down before her debate.', '/g5VBX1QD7tN0sfvGR6qd53frefG.jpg', '2006-05-08', 45, 0, 'free', 'publish', NULL),
(4132, 287, 168260, 22, 'Flight', 'As the escape is in progress, Warden Pope and Captain Bellick begin a search to detain the escapees. Michael and co. have to reach the aircraft fast as the police is hot on their heels. Veronica discovers a major piece of evidence that could prove Lincoln\'s innocence. The Vice President is worried about losing her authority.', '/1JuljrTTKCwp9Ayyq0MbzmpsYR2.jpg', '2006-05-15', 44, 0, 'free', 'publish', NULL),
(4133, 288, 168269, 1, 'Manhunt', 'As eight hours has passed since the escape, Michael, Lincoln, Sucre, C-Note and Abruzzi attempt to evade their seekers. Bellick is forced to relinquish the command of the search party to FBI Special Agent Alexander Mahone whose ingenious approach makes Michael\'s life as a fugitive harder. As a result from her overdose, Dr. Tancredi is in critical condition. A short-handed T-Bag faces the ultimate challenge.', '/3gksayUgMiPsBGxYkmMmJcumJSI.jpg', '2006-08-21', 45, 0, 'free', 'publish', NULL),
(4134, 288, 168275, 2, 'Otis', 'Mahone tries to lure the escapees by targeting an imprisoned LJ. Michael and Lincoln come up with a plan to free LJ from jail. Sucre, Abruzzi and C-Note have a plan of their own, but only to break free of their pursuers.Meanwhile, Bellick and Warden Pope feel the heat following their unsuccessful attempts to capture the escapees.Tweener infiltrates a bunch of college students on their way to spring break.', '/4MQOW5Z4EFSELwWjwbyXD2xqP5.jpg', '2006-08-28', 45, 0, 'free', 'publish', NULL),
(4135, 288, 168276, 3, 'Scan', 'Michael and a wounded Lincoln try to outmaneuver Mahone, who is hot on their trail. Sara gets a surprise visit to her bedside.Following his suspension, Bellick recruits a resolute partner to aid in his quest to get the escapees behind the bars.Sucre and C-Note head out for their family reunions-regardless of being observed by the authorities.', '/rOUd8Jr2LNM2adZFGa3UhbXaeNG.jpg', '2006-09-04', 45, 0, 'free', 'publish', NULL),
(4136, 288, 168277, 4, 'First Down', 'Bellick, now teamed up with Michael, Lincoln and Nika, sets out to find the money stolen by Westmoreland during the 1971 skyjacking. Kellerman targets Sara, who receives a long-awaited phone call. T-Bag gets a ride from an unsuspecting family. Abruzzi resumes the search for Fibonacci to settle the scores once and for all.', '/veErpP2mQZrISTjmYOdKUrGNDiW.jpg', '2006-09-11', 45, 0, 'free', 'publish', NULL),
(4137, 288, 168278, 5, 'Map 1213', 'Michael and Lincoln are eager to locate the Double K ranch where Westmoreland hid his millions. Sucre goes to Las Vegas to prevent Maricruz from marrying his cousin Hector. C-Note gets on a train. Mahone is given an important package.', '/bjMUEiU1whaDRvqOG0jEvrlLzRX.jpg', '2006-09-18', 45, 0, 'free', 'publish', NULL),
(4138, 288, 168279, 6, 'Subdivision', 'Mahone takes an interest in the story of DB Cooper.In their quest to find Westmoreland\'s treasure, Michael and Lincoln travel house-to-house in Utah. Haywire\'s journey outside the prison walls continues. Sucre bumps into an acquaintance.', '/ygLyVSxKgz4tJ06EN95i2FxCZd3.jpg', '2006-09-25', 45, 0, 'free', 'publish', NULL),
(4139, 288, 168281, 7, 'Buried', 'Michael, Sucre, T-Bag and C-Note claim the hidden treasure.An anxious Lincoln risks everything to get to LJ. LJ grows wary about the easy getaway. Kellerman rethinks where his loyalties lie after Sara gets to The Company\'s hit list. Mahone results to deadly force to get the truth out of Tweener.', '/dW7OXLEeBVf8ob35E7mhrsaaEcm.jpg', '2006-10-02', 45, 0, 'free', 'publish', NULL),
(4140, 288, 168282, 8, 'Dead Fall', 'In his efforts to try to get hold of all of the money Sucre runs into some unexpected difficulties. And Captain Bellick and his partner have not given up on finding their old inmates.', '/vPTbbMkvfRw8oaOovWvxydPb3ZM.jpg', '2006-10-23', 45, 0, 'free', 'publish', NULL),
(4141, 288, 168283, 9, 'Unearthed', 'In an effort to learn more about his pursuer Michael cozies up to Mahone\'s wife. L.J. and Lincoln have a bumpy road-trip. T-Bag receives a surprise, and C-Note\'s wife must choose between her daughter and husband.', '/i8cw2Ry9MBYXdkkNsLAPV8Ypuvo.jpg', '2006-10-30', 45, 0, 'free', 'publish', NULL),
(4142, 288, 168284, 10, 'Rendezvous', 'As Michael reunites with Sara, Mahone and Kellerman strive to make sure they stay apart.On the road with LJ, Lincoln meets his father. Sucre tries to contact Maricruz. T-Bag has a reunion of his own.', '/qWjdbkRYeWFQChTplq31gvJ3Ut6.jpg', '2006-11-06', 45, 0, 'free', 'publish', NULL),
(4143, 288, 168286, 11, 'Bolshoi Booze', 'As Lincoln tries to reunite with Michael, he has to say goodbye to another loved one. Michael attempts to obtain a getaway plane. T-Bag gets revenge. Sara and Kellerman face-off.', '/5P71xN6KvoMBm6Y1VnxSC0t0r8P.jpg', '2006-11-13', 45, 0, 'free', 'publish', NULL),
(4144, 288, 168287, 12, 'Disconnect', 'With Mahone on their trail, Michael, Lincoln, their father, and Sucre make a run for the getaway plane. Michael\'s reunion with his father sheds light on his difficult childhood.The women in Bellick and Kellerman\'s lives coerce their men to confess their sins.A medical emergency forces C-Note to risk it all.', '/f8KF5Bp9l8xOTMNPMAsO9zXtSQC.jpg', '2006-11-20', 45, 0, 'free', 'publish', NULL),
(4145, 288, 168288, 13, 'The Killing Box', 'Bellick is anything but happy about his sudden homecoming-to Fox River.Elsewhere, Michael and Lincoln might face a homecoming of their own. Mahone and Kellerman use everything they got to make certain that Michael and Lincoln do not get through their road trip alive.Sucre\'s getaway plane encounters some difficulties. T-Bag closes on Mrs. Hollander.', '/1nfdYK2Xt4ORlLb887KcUDAyT2q.jpg', '2006-11-27', 45, 0, 'free', 'publish', NULL),
(4146, 288, 168292, 14, 'John Doe', 'Bellick gets a taste of the medicine he gave out when he was the Captain and Agent Mahone\'s ex-wife makes another appearance.', '/7nZHTGOls6mMM7MLbYC2Hh9UphH.jpg', '2007-01-22', 45, 0, 'free', 'publish', NULL),
(4147, 288, 168293, 15, 'The Message', 'In Mexico, Sucre gets a car but gets in trouble by the police. Bellick has more trouble as the new inmate as prisoners who suffered with him want revenge.', '/tNVqdyl1jSoxAgs7NNTrgt73tkL.jpg', '2007-01-29', 45, 0, 'free', 'publish', NULL),
(4148, 288, 168294, 16, 'Chicago', 'C-Note gets into a tricky situation when a robber holds up the diner he is in and demands everyone go into the storage room until the police arrive. Michael, Lincoln and Kellerman get closer to revealing the conspiracy with the help of Sara. Mahone finds a new ally in Bellick.', '/ArlG8hFg6rm4FmImPZKHUnvuEWT.jpg', '2007-02-05', 45, 0, 'free', 'publish', NULL),
(4149, 288, 168295, 17, 'Bad Blood', 'Michael and Sara request Henry Pope\'s help to retrieve the information that will topple The Company.Mahone pins down an escapee. Sucre discovers a new threat while hitchhiking to reunite with Maricruz. T-Bag brings the Hollander family to his home.', '/2FxTDM5XoLP0qKHR4s3UFrncPXu.jpg', '2007-02-19', 45, 0, 'free', 'publish', NULL),
(4150, 288, 168299, 18, 'Wash', 'T-Bag digs deep and finds his \'nice-side\' with the help of a psychiatrist. Michael, Lincoln, and Sara get their hands on evidence needed to bring down The Company, while Kellerman is close to finding the President.', '/sGpJDO4Oa4JFE2LmyqG8x83PkfI.jpg', '2007-02-26', 45, 0, 'free', 'publish', NULL),
(4151, 288, 168300, 19, 'Sweet Caroline', 'An unlikely alliance forms between Bellick and Sucre while Michael is determined to face the president. T-Bag gets into some trouble when he loses his luggage and C-Note faces major consequences after some of his actions.', '/vPl86rZOlluSHFlbsrpoFddtie3.jpg', '2007-03-05', 45, 0, 'free', 'publish', NULL),
(4152, 288, 168301, 20, 'Panama', 'Sara sacrifices herself for the safety of Michael so the brothers can get on with their final plan to attain freedom, but their plan gets \'shipwrecked\'. Meanwhile, Bellick blackmails Sucre to partner up as T-Bag\'s streak of murder continues to the south of the border.', '/9ouE9ZAQmcRCLVdcRgMkKs6cT1G.jpg', '2007-03-19', 45, 0, 'free', 'publish', NULL),
(4153, 288, 168302, 21, 'Fin Del Camino', 'The day has finally come for Sara\'s trial while critical information that will exonerate her is being debunked. Meanwhile, Michael is determined to get his hands on the 5 million and to stop T-Bag\'s reign of terror. Bellick is also money hungry and will do whatever it takes to hunt down T-Bag. Kellerman decides his fate while Lincoln and Mahone square off.', '/ziUmRwm7lFSWbruvIXloJaQsyMW.jpg', '2007-03-26', 45, 0, 'free', 'publish', NULL),
(4154, 288, 168303, 22, 'Sona', 'Michael tries to save his brother and himself from the unstoppable Mahone. Kellerman\'s testimony at Sara\'s trial proves different from what was expected, could this be the end for Sara? Sucre puts everything on the line to save his Maricruz. Just like old times, T-Bag and Bellick are at it again but this time there will be a winner.', '/5eJCsOgHxB5uFmAGmjfH41SjhnB.jpg', '2007-04-02', 45, 0, 'free', 'publish', NULL),
(4155, 289, 168310, 1, 'Orientación', 'Now locked up in a Panamanian prison known as Sona, Michael, T-Bag, Bellick, and Mahone try to find a way out. Much to their devastation, they soon find out that the prison has been abandoned by the authorities because of the immense threat from the vile inmates. Michael seeks for an inmate named Whistler in the prison sewers. As Lincoln is puzzled by Sara\'s sudden disappearance, he learns that LJ has gotten into some trouble. He also tries to recover the 5 million dollars.', '/mFHaINf2kx4XHU5WsPcKZNqn6GC.jpg', '2007-09-17', 41, 0, 'free', 'publish', NULL),
(4156, 289, 168306, 2, 'Fire/Water', 'Michael and Mahone try to lure Whistler out of his hiding place. T-Bag gains some upward momentum in the prison hierarchy as the water supply is running low. Lincoln meets familiar and not so familiar faces on his quest to free Michael.', '/ipzUA2QptEhC7MgxN79IDwefqTd.jpg', '2007-09-24', 45, 0, 'free', 'publish', NULL),
(4157, 289, 168316, 3, 'Call Waiting', 'Whistler tells the truth to Michael. Michael tries to get in touch with Sara but the only phone is in Lechero\'s quarters, so he has to rely on T-Bag\'s help. Mahone battles his addiction. Bellick steps on some toes.', '/pUw7paRMQjIBPyXdwGQfJY0DnHK.jpg', '2007-10-01', 45, 0, 'free', 'publish', NULL),
(4158, 289, 168311, 4, 'Good Fences', 'After taking delivery of a package from The Company, Lincoln realizes that they are deadly serious. Michael\'s new break out plan relies on electricity. Haywire is back from the dead, haunting disoriented Mahone. Bellick and T-Bag get special attention from Lechero.', '/6c8YBJMbixQPR7QLswBFkOFFvS8.jpg', '2007-10-08', 42, 0, 'free', 'publish', NULL),
(4159, 289, 168308, 5, 'Interference', 'A new inmate named Tyge is brought to Sona. After he seemingly recognizes Whistler, Michael\'s doubts arise. T-Bag enters a new area of commerce.Lincoln goes to the seaside with Sofia. Sucre takes over the side-business of his predecessor.', '/2yTVajaBaHj5xsAoB0rkhkEKtzo.jpg', '2007-10-22', 45, 0, 'free', 'publish', NULL),
(4160, 289, 168307, 6, 'Photo Finish', 'Michael threatens to cancel the escape plan unless he sees a proof that Sara is still alive. Whistler is accused of murdering an inmate and it is up to Michael to prove his innocence and save his life. Lincoln and Sofia help in monitoring the morning guards. Mahone may have another way to get out of Sona.', '/raCjfYnAOj45XBoV089uKiQI7g6.jpg', '2007-11-05', 45, 0, 'free', 'publish', NULL),
(4161, 289, 168305, 7, 'Vamonos', 'Everything goes wrong for Michael as he tries to create a diversion.\n\nLincoln tries to outsmart Susan who has his son. Sucre offers his assistance to Lincoln.', '/qLsDX0YuHR5h78B9QKsXu6BqAlt.jpg', '2007-11-05', 45, 0, 'free', 'publish', NULL),
(4162, 289, 168304, 8, 'Bang and Burn', 'Susan jeopardizes Michael\'s life as she puts her own escape plan into motion. Whistler\'s past catches up to his girlfriend.The Company goes after Lincoln and Sucre. Justice prevails for Mahone. And Lechero sheds light into an empty tunnel.', '/dbeCcjNUIwvbrGc91foOoRpkzet.jpg', '2007-11-12', 45, 0, 'free', 'publish', NULL),
(4163, 289, 168314, 9, 'Boxed In', 'The Panamanian Army arranges Michael to get a taste of solitary. T-Bag reserves a spot in the escape. Bellick\'s life turns into an uphill battle. Susan traps Sucre.', '/mbZVk5IqsaovhSQEdaYVmH2bTn9.jpg', '2008-01-14', 45, 0, 'free', 'publish', NULL),
(4164, 289, 168313, 10, 'Dirt Nap', 'Lechero\'s demotion devastates Michael\'s breakout plan as Sammy takes reigns at Sona. T-Bag forces Bellick to fight in a fight where the odds are stacked heavily against him. Lincoln and Sucre have some surprise fireworks set for Susan.', '/aNkeel2FbIxoiEKRuzOTmRtMGYA.jpg', '2008-01-21', 45, 0, 'free', 'publish', NULL),
(4165, 289, 168309, 11, 'Under and Out', 'Michael\'s escape may be in jeopardy because of heavy rain. T-Bag and Lechero join forces, while Bellick hopes to do the same with Mahone.', '/qRP1lzyy7BEh9wfJXwomEIRlcqO.jpg', '2008-02-04', 45, 0, 'free', 'publish', NULL),
(4166, 289, 168315, 12, 'Hell or High Water', 'Michael, Whistler, and Mahone make their break from Sona. But Mahone seems like the odd man out along the way.', '/jX4wSVMGrRd13iV6oYw82L9MkNb.jpg', '2008-02-11', 45, 0, 'free', 'publish', NULL),
(4167, 289, 168312, 13, 'The Art of the Deal', 'Michael and Lincoln are left with no choice but to hand Whistler over in exchange to save LJ and Sofia. A familiar face enters Sona while another inmate leaves.', '/o7ctRRBBxVmhb4uDzbfTTsgDBz6.jpg', '2008-02-18', 45, 0, 'free', 'publish', NULL),
(4168, 290, 168345, 1, 'Scylla', 'Michael has trailed Gretchen/Susan, Whistler and Mahone to L.A. Chaos reigns in SONA while T-Bag, Bellick and Sucre go missing. Lincoln and L.J. continue to stay with Sofia.', '/2gQemktoi0xe61MRDbmr5dsIbVQ.jpg', '2008-09-01', 45, 0, 'free', 'publish', NULL),
(4169, 290, 168343, 2, 'Breaking And Entering', '\"Breaking & Entering\" is the 59th episode of the American television series Prison Break and was shown together with the first episode of its fourth season as a two-hour episode with \"Scylla\". It was broadcast on September 1, 2008 in the United States on the Fox Network.', '/9zttFOeA4pIXAVirfOT0EuJpSzQ.jpg', '2008-09-01', 45, 0, 'free', 'publish', NULL),
(4170, 290, 168348, 3, 'Shut Down', 'Michael attempts to track the cardholder and avoid going back to prison. Wyatt finds new information regarding Sara\'s whereabouts. Elsewhere, T-Bag uses a new identity to make a new life for himself.', '/5iSrw2c3KdkmoVgb0B8KFNYHMMH.jpg', '2008-09-08', 45, 0, 'free', 'publish', NULL),
(4171, 290, 168342, 4, 'Eagles and Angels', 'Michael, Lincoln and Sucre must crash a police benefit to obtain the next card key. Reeling from another death, Sara falls back into an old habit. T-Bag arouses suspicion and runs into some old “friends” his first day on the job.', '/plz3KtCQuqC6FH5iQGsfAT08MwH.jpg', '2008-09-15', 45, 0, 'free', 'publish', NULL),
(4172, 290, 168336, 5, 'Safe and Sound', 'Self locates another card hidden in a safe within a secure federal building, as Mahone continues his quest for revenge. Meanwhile, T-Bag\'s new life may be in jeopardy.', '/gstdihLPhDfZw0lpTAIR8b2vtf7.jpg', '2008-09-22', 45, 0, 'free', 'publish', NULL),
(4173, 290, 168349, 6, 'Blow Out', 'The entire operation may be in jeopardy when Mahone gets into trouble with the law. Gretchen\'s sister receives a surprise visitor. The Company may be onto Self. T-Bag continues to raise suspicions at Gate.', '/k8EKiKnGeo5uwS6KYli3KWVlCeM.jpg', '2008-09-29', 45, 0, 'free', 'publish', NULL),
(4174, 290, 168329, 7, 'Five the Hard Way', 'Lincoln takes members of the team to Las Vegas where Sucre gets an indecent proposal. Sara learns about Michael’s condition, and Roland pushes his luck too far. Gretchen teams up with T-Bag who makes an offer to Michael he cannot refuse. Meanwhile, the secrets in Whistler’s bird book are finally revealed.', '/9a014iJTTqOviaKVI69sfZYewqx.jpg', '2008-10-06', 45, 0, 'free', 'publish', NULL),
(4175, 290, 168332, 8, 'The Price', 'Lincoln works to retrieve the final card, which is being held by the General. Michael and Self are forced to work with Gretchen. Meanwhile, Roland continues to be berated for losing the transcribing device in Las Vegas.', '/nHrnrefoZff6xfqO5msZA0l2bip.jpg', '2008-10-20', 45, 0, 'free', 'publish', NULL),
(4176, 290, 168346, 9, 'Greatness Achieved', 'Wyatt gets a taste of his own medicine, and Mahone finds some resolution. T-Bag scrambles when the police investigate his missing co-worker while Gretchen gets cozy with a Company man. Meanwhile, Michael’s condition continues to worsen, and a team member makes the ultimate sacrifice while planning the underground break-in for Scylla.', '/xM3KghdXynfy3FaIr40QnVHWPyL.jpg', '2008-11-03', 45, 0, 'free', 'publish', NULL),
(4177, 290, 168338, 10, 'The Legend', 'Sara is left with no choice but to take Michael to the hospital as his condtion rapidly worsens. Sucre and Lincoln are faced with unknown territory as they are left in charge of the operation. Elsewhere, agent Self makes a surprising ally.', '/dXRO7sgEPXASjjixjD2RQQj99jv.jpg', '2008-11-10', 45, 0, 'free', 'publish', NULL),
(4178, 290, 168335, 11, 'Quiet Riot', 'Michael races against time and his ailing health to break into the Company headquarters to steal Scylla, but the break-in’s success lies with Sucre. Gretchen dresses up for a meeting with the General and one final attempt to get the last card key. T-Bag must make a decision to leave his criminal ways for good.', '/xIqJe6AOCa7ZJaucQSkV0oUdZvv.jpg', '2008-11-17', 45, 0, 'free', 'publish', NULL),
(4179, 290, 168339, 12, 'Selfless', 'Sara takes a hostage in a bid to secure Scylla. In the meantime, Michael and Lincoln finally meet the General while one of their members switches allegiance.', '/osccmKlIIf10OV7aLpv2IMyXaqz.jpg', '2008-11-24', 45, 0, 'free', 'publish', NULL),
(4180, 290, 168331, 13, 'Deal Or No Deal', 'It\'s up to Michael to hold the gang together after they find out they were betrayed by one of their own. Meanwhile, Gretchen is blackmailed by T-Bag\'s new partner.', '/cn42lg5v8utJVhh5fbBcYL9UOtk.jpg', '2008-12-01', 45, 0, 'free', 'publish', NULL),
(4181, 290, 168347, 14, 'Just Business', 'Michael, whose condition is deteriorating, winds up in the hands of The Company who promise Lincoln that they can save Michael\'s life in exchange for a favor. Elsewhere, Gretchen and Self wind up with Scylla and a buyer.', '/vaEdPgZlSXmIvwYyxAPVhLvHW3l.jpg', '2008-12-08', 45, 0, 'free', 'publish', NULL),
(4182, 290, 168334, 15, 'Going Under', 'Michael gets medical attention from the most unlikely of places, and Charles Westmoreland returns to help uncover the true meaning of Scylla. Meanwhile, Lincoln and Sucre race to stop Gretchen before Scylla is lost forever.', '/hF5iHTTKCEiyncgPQEM2MdbCPR5.jpg', '2008-12-15', 45, 0, 'free', 'publish', NULL),
(4183, 290, 168337, 16, 'The Sunshine State', 'Lincoln and his new partners arrive in Miami to recover Scylla from its shocking new owner, and Sara searches for a missing Michael who learns some surprising information about his past. Meanwhile, a double-crossing leads to a death and an arrest in \"The Sunshine State.\"', '/7emb043VAUizQO4HulIHBkknkzF.jpg', '2008-12-22', 45, 0, 'free', 'publish', NULL),
(4184, 290, 168353, 17, 'The Mother Lode', 'Michael and Sara journey to Miami while Lincoln meets with his mother. T-Bag and Self\'s mission to locate Scylla takes a dramatic turn. The General comes under pressure.', '/vRObokwsH4R49NE2AYvjtrD7wiN.jpg', '2009-04-17', 45, 0, 'free', 'publish', NULL),
(4185, 290, 168352, 18, 'VS.', 'Michael and Lincoln come to blows over Scylla as Christina sets the wheels in motion for her plan. Meanwhile, Sara receives life-changing news. T-Bag arrives at the Indian Embassy. The General becomes increasingly paranoid.', '/7Qi2FDKKaX2hfAkaSWkuajXJqCk.jpg', '2009-04-24', 45, 0, 'free', 'publish', NULL),
(4186, 290, 168354, 19, 'S.O.B.', 'Michael\'s reunion with Christina is soured when she drops a bombshell regarding Lincoln, and T-Bag grows determined to prove he is worthy of being a member of the Company.', '/gEjpGUXrkEvV8L6l2R7WPHvmNLq.jpg', '2009-05-01', 45, 0, 'free', 'publish', NULL),
(4187, 290, 168350, 20, 'Cowboys and Indians', 'Pandemonium erupts at the hotel following the assassination, and Christina puts the final pieces of her plan together. Meanwhile, the General makes good on his threat, and Michael is forced to choose between saving either Lincoln or Sara.', '/fTha4ieHNSwadoNEdPxONrnLTQQ.jpg', '2009-05-08', 45, 0, 'free', 'publish', NULL),
(4188, 290, 168351, 21, 'Rate of Exchange', 'Familiar faces return to help Michael end his quest to bring down The Company once and for all.', '/7K9UkaFBoOsipOcrD3W1jvomYoZ.jpg', '2009-05-15', 45, 0, 'free', 'publish', NULL),
(4189, 290, 168355, 22, 'Killing Your Number', 'Michael tries to bring down the Company once and for all.', '/1fCNWm6Pqp4iZkqUG3AZeA2AmWZ.jpg', '2009-05-15', 45, 0, 'free', 'publish', NULL),
(4190, 291, 1256904, 1, 'Ogygia', 'It\'s been seven years since Michael was presumed dead, but when clues suggest that he might still be alive, Lincoln reunites with Sara to help track down the truth.', '/5JfwxILzI6Kb9zqSnothjZKmqS0.jpg', '2017-04-04', 45, 0, 'free', 'publish', NULL),
(4191, 291, 1299588, 2, 'Kaniel Outis', 'As Lincoln and C-Note search for the \"Sheik of Light,\" Michael and his cellmate, Whip, attempt an escape from Ogygia. Meanwhile, Sara\'s investigation into Michael\'s reappearance leads her to the state department and an uneasy reunion with Paul Kellerman.', '/iIWt0XSI5lf8JzfZovyEd9EOdep.jpg', '2017-04-11', 45, 0, 'free', 'publish', NULL),
(4192, 291, 1299589, 3, 'The Liar', 'When T-Bag ambushes Sara, he warns her that two of Poseidon\'s henchmen, Van Gogh and A&W, may be following her. Meanwhile, Lincoln attempts to retrieve his confiscated passport to escape Yemen, and Michael plans his next move.', '/y8YPPydBfZeVG4Lk9wHyKC8NTAi.jpg', '2017-04-18', 45, 0, 'free', 'publish', NULL),
(4193, 291, 1303876, 4, 'The Prisoner\'s Dilemma', 'Michael, Whip and Ja make their last attempt to break from Ogygia, but must make a deal with the devil to do so. Lincoln races against the clock to help with the escape, as T-Bag meets with Kellerman to gather more info on Michael\'s resurrection.', '/wDCQJ8AFqHFmSmytw3zwQb6Yzrk.jpg', '2017-04-25', 45, 0, 'free', 'publish', NULL),
(4194, 291, 1303877, 5, 'Contingency', 'Lincoln becomes frustrated as he tries to understand what really happened to Michael. C-Note has a new escape plan, but fears it will not be executed quickly enough, as Cyclops is trailing closely behind. Meanwhile, Sara struggles with the idea that Michael may be alive.', '/mmn4lNsoelI97AJpJpPBaTss3M8.jpg', '2017-05-02', 45, 0, 'free', 'publish', NULL),
(4195, 291, 1303878, 6, 'Phaecia', 'As Michael, Lincoln and the remaining Ogygia gang try to escape Yemen, they find themselves racing though the desert from a vengeful Cyclops. Meanwhile, A&W and Van Gogh question their roles as their pursuit of the escapees leads them to...Graceland.', '/kbYBABw81gnyTPpBAl4MRnCwFUA.jpg', '2017-05-09', 45, 0, 'free', 'publish', NULL),
(4196, 291, 1303879, 7, 'Wine Dark Sea', 'Sara becomes fearful of her family\'s safety when she discovers the real reason that Michael faked his own death. In the meantime, Michael and Lincoln continue to try find a way home with the help of Sucre, and the real identity of Poseidon is revealed.', '/zeKnUr0NXeLlb8NrC0UJSa8Alsb.jpg', '2017-05-16', 45, 0, 'free', 'publish', NULL),
(4197, 291, 1303880, 8, 'Progeny', 'When Sara and her son\'s safety is threatened, Michael and Lincoln recruit the help of Sheba and C-Note to try and catch Poseidon. Meanwhile, Whip goes on a separate mission and T-Bag reveals a secret.', '/rJjw5noJPUdZ3XiNaIqbnDoT8eA.jpg', '2017-05-23', 45, 0, 'free', 'publish', NULL),
(4198, 291, 1303881, 9, 'Behind the Eyes', 'Dangerous threats keep Michael and Lincoln fighting to protect Sara and Mike. Meanwhile, Poseidon continues to try and outsmart Michael and the rest of the gang, which leads them to the ultimate showdown, and not everyone makes it out alive.', '/d21YkZrWDPGXzqvM4PVqWwU0vJN.jpg', '2017-05-30', 45, 0, 'free', 'publish', NULL),
(4199, 292, 63056, 1, 'Winter Is Coming', 'Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon\'s place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.', '/9hGF3WUkBf7cSjMg0cdMDHJkByd.jpg', '2011-04-17', 62, 0, 'free', 'publish', NULL),
(4200, 292, 63057, 2, 'The Kingsroad', 'While Bran recovers from his fall, Ned takes only his daughters to Kings Landing. Jon Snow goes with his uncle Benjen to The Wall. Tyrion joins them.', '/l0GJx3IR8YasbztTJi5uK0XqkEo.jpg', '2011-04-24', 56, 0, 'free', 'publish', NULL),
(4201, 292, 63058, 3, 'Lord Snow', 'Lord Stark and his daughters arrive at King\'s Landing to discover the intrigues of the king\'s realm.', '/8HjOlb4slc1xusMgOtoNpxuTgSI.jpg', '2011-05-01', 58, 0, 'free', 'publish', NULL),
(4202, 292, 63059, 4, 'Cripples, Bastards, and Broken Things', 'Eddard investigates Jon Arryn\'s murder. Jon befriends Samwell Tarly, a coward who has come to join the Night\'s Watch.', '/Ai2UPMWv38xGjOgNBuA1o8w8dUI.jpg', '2011-05-08', 56, 0, 'free', 'publish', NULL),
(4203, 292, 63060, 5, 'The Wolf and the Lion', 'Catelyn has captured Tyrion and plans to bring him to her sister, Lysa Arryn, at The Vale, to be tried for his, supposed, crimes against Bran. Robert plans to have Daenerys killed, but Eddard refuses to be a part of it and quits.', '/u7e1qSWE6v8jfY9vGNrckX47DGN.jpg', '2011-05-15', 55, 0, 'free', 'publish', NULL),
(4204, 292, 63061, 6, 'A Golden Crown', 'While recovering from his battle with Jamie, Eddard is forced to run the kingdom while Robert goes hunting. Tyrion demands a trial by combat for his freedom. Viserys is losing his patience with Drogo.', '/AdhvrJxyYpINwYnGkBIf2krQKg.jpg', '2011-05-22', 53, 0, 'free', 'publish', NULL),
(4205, 292, 63062, 7, 'You Win or You Die', 'Robert has been injured while hunting and is dying. Jon and the others finally take their vows to the Night\'s Watch. A man, sent by Robert, is captured for trying to poison Daenerys. Furious, Drogo vows to attack the Seven Kingdoms.', '/o6ldSDhIINGNKZR62mHf2m64dD.jpg', '2011-05-29', 58, 0, 'free', 'publish', NULL),
(4206, 292, 63063, 8, 'The Pointy End', 'Eddard and his men are betrayed and captured by the Lannisters. When word reaches Robb, he plans to go to war to rescue them. The White Walkers attack The Wall. Tyrion returns to his father with some new friends.', '/9ZvT1IZPcC11eiCByOzqQvC3CCR.jpg', '2011-06-05', 59, 0, 'free', 'publish', NULL),
(4207, 292, 63064, 9, 'Baelor', 'Robb goes to war against the Lannisters. Jon finds himself struggling on deciding if his place is with Robb or the Night\'s Watch. Drogo has fallen ill from a fresh battle wound. Daenerys is desperate to save him.', '/fAmBhmw1pQc6fucrdmnRM5FOpXD.jpg', '2011-06-12', 57, 0, 'free', 'publish', NULL),
(4208, 292, 63065, 10, 'Fire and Blood', 'With Ned dead, Robb vows to get revenge on the Lannisters. Jon must officially decide if his place is with Robb or the Night\'s Watch. Daenerys says her final goodbye to Drogo.', '/y1BXkhEqBQS3ewQeqqdHpjhTts0.jpg', '2011-06-19', 53, 0, 'free', 'publish', NULL),
(4209, 293, 63066, 1, 'The North Remembers', 'As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.', '/gGHtlTvHpSGZ8DIrxMyK3Ewkc1Y.jpg', '2012-04-01', 53, 0, 'free', 'publish', NULL),
(4210, 293, 974430, 2, 'The Night Lands', 'In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.', '/3EW7wYNXUVaHT4XRuIoNFrqhZh5.jpg', '2012-04-08', 54, 0, 'free', 'publish', NULL),
(4211, 293, 63068, 3, 'What is Dead May Never Die', 'At the Red Keep, Tyrion plots three alliances through the promise of marriage.  Catelyn arrives in the Stormlands to forge an alliance of her own, but King Renly, his new wife Margaery, and her brother Loras Tyrell have other plans.  At Winterfell, Luwin tries to decipher Bran’s dreams.', '/neKkHgfX7dgi4E47GKT7bYciq93.jpg', '2012-04-15', 53, 0, 'free', 'publish', NULL),
(4212, 293, 63069, 4, 'Garden of Bones', 'Joffrey punishes Sansa for Robb’s victories, and Tyrion scrambles to temper the king’s cruelty. Catelyn entreats Stannis and Renly to unite against the Lannisters. Dany and her khalasar arrive at the prosperous city of Qarth. Tyrion coerces a relative into being his eyes and ears. Arya and Gendry are taken to Harrenhal, where their lives are in the hands of Ser Gregor Clegane. Stannis orders Davos to smuggle Melisandre into a secret cove.', '/4j2j97GFao2NX4uAtMbr0Qhx2K2.jpg', '2012-04-22', 51, 0, 'free', 'publish', NULL),
(4213, 293, 63070, 5, 'The Ghost of Harrenhal', 'The Baratheon rivalry ends, driving Catelyn to flee and Littlefinger to act. At King’s Landing, Tyrion’s source alerts him to Joffrey’s defense plan - and a mysterious secret weapon. Theon sails to the Stony Shore to prove he’s worthy to be called Ironborn. At Harrenhal, Arya receives a promise from Jaqen H’ghar, one of the prisoners she saved from the Gold Cloaks. The Night’s Watch arrive at the Fist of the First Men, an ancient ringfort where they hope to stem the wildings\' advance.', '/h7HHSQtEyf7cNBYR2G9DjQ78EgV.jpg', '2012-04-29', 55, 0, 'free', 'publish', NULL),
(4214, 293, 63071, 6, 'The Old Gods and the New', 'Theon seizes control of Winterfell. Jon captures a wildling, named Ygritte and is given a chance to prove himself. At King\'s Landing, after the Lannisters send Myrcella off to be married, the people begin to turn against King Joffrey. Arya comes face to face with a surprise visitor. Daenerys looks to buy ships to sail for the Seven Kingdoms.', '/bxToPOtlk77Wkxsas0mMgtjvzXS.jpg', '2012-05-06', 54, 0, 'free', 'publish', NULL),
(4215, 293, 63073, 7, 'A Man Without Honor', 'Jamie meets a distant relative. Daenerys receives an invitation to the House of the Undying. Theon leads a search party. Jon loses his way in the wilderness. Cersei counsels Sansa.', '/bCDklRxVetx1COP4zXLLnXMS2S0.jpg', '2012-05-13', 56, 0, 'free', 'publish', NULL),
(4216, 293, 63074, 8, 'The Prince of Winterfell', 'Betrayal befalls Robb. Jon and Qhorin are taken prisoner by the wildlings. Theon receives a visitor at Winterfell and must make an important decision. Meanwhile, Stannis is just days away from reaching King\'s Landing and Tyrion prepares for his arrival. At Harrenhal, Arya, Gendry and Hot Pie plan their escape.', '/4W90HbZcVG54m8HoxaZmXc8rzjy.jpg', '2012-05-20', 54, 0, 'free', 'publish', NULL),
(4217, 293, 63072, 9, 'Blackwater', 'Tyrion and the Lannisters fight for their lives as Stannis’ fleet assaults King’s Landing.', '/rX44Vfd0iiZDIJWHYZg9j4yLSP9.jpg', '2012-05-27', 55, 0, 'free', 'publish', NULL),
(4218, 293, 63075, 10, 'Valar Morghulis', 'Tyrion awakens to a changed situation. King Joffrey doles out rewards to his subjects. As Theon stirs his men to action, Luwin offers some final advice. Brienne silences Jaime. Arya receives a gift from Jaqen. Dany goes to a strange place. Jon proves himself to Qhorin.', '/u46jn12qEyaCOe1oqJBwPvL5d7R.jpg', '2012-06-03', 64, 0, 'free', 'publish', NULL),
(4219, 294, 63077, 1, 'Valar Dohaeris', 'Jon meets the King-Beyond-the-Wall while his Night Watch Brothers flee south. In King\'s Landing, Tyrion wants a reward, Margaery shows her charitable nature, Cersei arranges a dinner party, and Littlefinger offers to help Sansa. Across the Narrow Sea, Daenerys starts her journey west.', '/3pyS7xz9mprX4OuOCfV261CnGfR.jpg', '2013-03-31', 55, 0, 'free', 'publish', NULL),
(4220, 294, 63076, 2, 'Dark Wings, Dark Words', 'Sansa says too much. Shae asks Tyrion for a favor. Jaime finds a way to pass the time, while Arya encounters the Brotherhood Without Banners.', '/ydrupjqBj6M68pUwJNJ5rbGmm1O.jpg', '2013-04-07', 58, 0, 'free', 'publish', NULL),
(4221, 294, 63078, 3, 'Walk of Punishment', 'Tyrion shoulders new responsibilities. Jon is taken to the Fist of the First Men. Daenerys meets with the slavers. Jaime strikes a deal with his captors.', '/i39Itkd76DOXxek0blIO6rI6zsa.jpg', '2013-04-14', 53, 0, 'free', 'publish', NULL),
(4222, 294, 63082, 4, 'And Now His Watch Is Ended', 'Trouble brews among the Night\'s Watch at Craster\'s. Margaery takes Joffrey out of his comfort zone. Arya meets the leader of the Brotherhood. Varys plots revenge on an old foe. Theon mournfully recalls his missteps. Daenerys deftly orchestrates her exit from Astapor.', '/veYx7AoKhxC8Pz8EThNpoOxeSGX.jpg', '2013-04-21', 54, 0, 'free', 'publish', NULL),
(4223, 294, 63083, 5, 'Kissed by Fire', 'The Hound is judged by the gods. Jaime is judged by men. Jon proves himself. Robb is betrayed. Tyrion learns the cost of weddings.', '/d2b1CWsWCKMt5IpNXKgJfE4fjxj.jpg', '2013-04-28', 58, 0, 'free', 'publish', NULL),
(4224, 294, 63084, 6, 'The Climb', 'Tywin plans strategic unions for the Lannisters. Melisandre pays a visit to the Riverlands. Robb weighs a compromise to repair his alliance with House Frey. Roose Bolton decides what to do with Jaime Lannister. Jon, Ygritte, and the Wildlings face a daunting climb.', '/eJQ5vnNrlM28fpInn6uGM0xUZRX.jpg', '2013-05-05', 54, 0, 'free', 'publish', NULL),
(4225, 294, 63081, 7, 'The Bear and the Maiden Fair', 'Daenerys exchanges gifts with a slave lord outside of Yunkai. As Sansa frets about her prospects, Shae chafes at Tyrion’s new situation. Tywin counsels the king, and Melisandre reveals a secret to Gendry. Brienne faces a formidable foe in Harrenhal.', '/2RVD5pIIiv7ZH0qnazwVrsPEFpP.jpg', '2013-05-12', 58, 0, 'free', 'publish', NULL),
(4226, 294, 63085, 8, 'Second Sons', 'King’s Landing hosts a wedding, and Tyrion and Sansa spend the night together. Daenerys tries to persuade the Second Sons to join her against Yunkai. Stannis releases Davos from the dungeons. Sam and Gilly meet an older gentleman.', '/x3sJ9URXLn9hb6WAqqNhVJQGPut.jpg', '2013-05-19', 57, 0, 'free', 'publish', NULL),
(4227, 294, 63080, 9, 'The Rains of Castamere', 'Robb presents himself to Walder Frey, and Edmure meets his bride. Jon faces his harshest test yet. Bran discovers a new gift. Daario and Jorah debate how to take Yunkai. House Frey joins with House Tully.', '/8Cvg7NkvDPckIwPKWcyS25YcoSh.jpg', '2013-06-02', 51, 0, 'free', 'publish', NULL),
(4228, 294, 63079, 10, 'Mhysa', 'Bran and company travel beyond the Wall. Sam returns to Castle Black. Jon says goodbye to Ygritte. Jaime returns to King\'s Landing. The Night\'s Watch asks for help from Stannis. Daenerys waits to see if she is a conqueror or a liberator.', '/wJbEFBLyogHR1GoxfDXNIoP4k1w.jpg', '2013-06-09', 63, 0, 'free', 'publish', NULL),
(4229, 295, 973190, 1, 'Two Swords', 'Tyrion welcomes a guest to King’s Landing. At Castle Black, Jon Snow finds himself unwelcome. Dany is pointed to Meereen, the mother of all slave cities. Arya runs into an old friend.', '/gtGrhEOURApsKhbf6tm6leJJmmp.jpg', '2014-04-06', 59, 0, 'free', 'publish', NULL),
(4230, 295, 973219, 2, 'The Lion and the Rose', 'Tyrion lends Jaime a hand. Joffrey and Margaery host a breakfast. At Dragonstone, Stannis loses patience with Davos. Ramsay finds a purpose for his pet. North of the Wall, Bran sees where they must go.', '/zOeaRpAKbrATuVe8Z5MtVJfair9.jpg', '2014-04-13', 53, 0, 'free', 'publish', NULL),
(4231, 295, 63096, 3, 'Breaker of Chains', 'Tyrion ponders his options. Tywin extends an olive branch. Sam realizes Castle Black isn’t safe, and Jon proposes a bold plan. The Hound teaches Arya the way things are. Dany chooses her champion.', '/pgwGxEDIv1XyB5TcJcJM7EMLWiX.jpg', '2014-04-20', 57, 0, 'free', 'publish', NULL),
(4232, 295, 63097, 4, 'Oathkeeper', 'Dany balances justice and mercy. Jaime tasks Brienne with his honor. Jon secures volunteers while Bran, Jojen, Meera and Hodor stumble on shelter.', '/fbo6BnHrgr2wTc0m2gYPeylls8z.jpg', '2014-04-27', 56, 0, 'free', 'publish', NULL),
(4233, 295, 63098, 5, 'First of His Name', 'After Tommen is crowned the King of the Seven Kingdoms, Cersei and Tywin plan the Crown\'s next move. Meanwhile, Dany weighs her future plans regarding Westeros and Slaver\'s Bay. Sansa and Lord Baelish arrive at the Eyrie and Jon Snow along with men from the Night\'s Watch attacks Craster\'s Keep.', '/bf0Z9votO2jqQLI0Y66TqfTjlyq.jpg', '2014-05-04', 54, 0, 'free', 'publish', NULL),
(4234, 295, 63099, 6, 'The Laws of Gods and Men', 'Stannis makes a deal with the Iron Bank of Braavos. Yara and her troops storm the Dreadfort to free Theon. Meanwhile, Daenerys meets Hizdar zo Loraq and her other supplicants. And the day of Tyrion\'s trial has come where Tyrion faces his father.', '/vKt9b7HNYhwM91C7S53zPsAWfT3.jpg', '2014-05-11', 51, 0, 'free', 'publish', NULL),
(4235, 295, 63100, 7, 'Mockingbird', 'Tyrion gains an unlikely ally; Daario asks Dany to allow him to do what he does best; Jon\'s warnings about the vulnerability of the Wall are ignored; Brienne follows a new lead. ', '/qYW8m10r5T80SoNyyinZT0r20wi.jpg', '2014-05-18', 52, 0, 'free', 'publish', NULL),
(4236, 295, 63101, 8, 'The Mountain and the Viper', 'Unexpected visitors arrive in Mole\'s Town. With assistance from Theon, Ramsay proves himself to his father, Lord Bolton. Littlefinger\'s motives are questioned when Sansa reveals the fate of Lysa Arryn to other lords of the Vale. Daenerys finds out a secret about Jorah Mormont. Tyrion\'s fate is decided.', '/cOcGpQmBvwuScHJjwQYlCreVl4x.jpg', '2014-06-01', 53, 0, 'free', 'publish', NULL),
(4237, 295, 63102, 9, 'The Watchers on the Wall', 'Jon Snow and the Night\'s Watch face a big challenge.', '/vn4ECYuCaV43MEwpyjTdkXg7NPB.jpg', '2014-06-08', 51, 0, 'free', 'publish', NULL),
(4238, 295, 63103, 10, 'The Children', 'Circumstances change after an unexpected arrival from north of the Wall. Dany must face harsh realities. Bran learns more about his destiny. Tyrion sees the truth about his situation.', '/dEvyoz6NrUGH3nyphu43hAzT1VE.jpg', '2014-06-15', 66, 0, 'free', 'publish', NULL),
(4239, 296, 1043618, 1, 'The Wars to Come', 'Cersei and Jaime adjust to a world without Tywin. Varys reveals a conspiracy to Tyrion. Dany faces a new threat to her rule. Jon is caught between two kings.', '/shIFxmFySt9CtGXMTXWBipsNOIs.jpg', '2015-04-12', 53, 0, 'free', 'publish', NULL),
(4240, 296, 1045551, 2, 'The House of Black and White', 'Arya arrives in Braavos. Podrick and Brienne run into trouble on the road. Cersei fears for her daughter\'s safety in Dorne as Ellaria Sand seeks revenge for Oberyn\'s death. Stannis tempts Jon. An adviser tempts Daenerys.', '/uCJpE0pfjn78uhr2TjvIrhyTcR8.jpg', '2015-04-19', 56, 0, 'free', 'publish', NULL),
(4241, 296, 1045552, 3, 'High Sparrow', 'In Braavos, Arya sees the Many-Faced God. In King\'s Landing, Queen Margaery enjoys her new husband. Tyrion and Varys walk the Long Bridge of Volantis.', '/5b6eUi2w12ao24ug8cL5QqJFKig.jpg', '2015-04-26', 60, 0, 'free', 'publish', NULL),
(4242, 296, 1045553, 4, 'Sons of the Harpy', 'The Faith Militant grow increasingly aggressive. Jaime and Bronn head south. Ellaria and the Sand Snakes vow vengeance.', '/xJK24ELjz04a05saADPXkYafa21.jpg', '2015-05-03', 51, 0, 'free', 'publish', NULL),
(4243, 296, 1051286, 5, 'Kill the Boy', 'Dany makes a difficult decision in Meereen. Jon recruits the help of an unexpected ally. Brienne searches for Sansa. Theon remains under Ramsay\'s control.', '/25HHLKWpNKiy6e7zBhaoysK9hzv.jpg', '2015-05-10', 57, 0, 'free', 'publish', NULL),
(4244, 296, 1051287, 6, 'Unbowed, Unbent, Unbroken', 'Arya trains. Jorah and Tyrion run into slavers. Trystane and Myrcella make plans. Jaime and Bronn reach their destination. The Sand Snakes attack.', '/ihngOB9FfBZvmTy01D836QMFybe.jpg', '2015-05-17', 54, 0, 'free', 'publish', NULL),
(4245, 296, 1051288, 7, 'The Gift', 'Jon prepares for conflict. Sansa tries to talk to Theon. Brienne waits for a sign. Stannis remains stubborn. Jaime attempts to reconnect with family.', '/n4BFZfiqOX1l5l6uYtpDS4m19WX.jpg', '2015-05-24', 59, 0, 'free', 'publish', NULL),
(4246, 296, 1070282, 8, 'Hardhome', 'Arya makes progress in her training. Sansa confronts an old friend. Cersei struggles. Jon travels.', '/58PgfiE8eIOdQ1iDvFnJG471RFB.jpg', '2015-05-31', 60, 0, 'free', 'publish', NULL),
(4247, 296, 1054979, 9, 'The Dance of Dragons', 'Stannis confronts a troubling decision. Jon returns to The Wall. Mace visits the Iron Bank. Arya encounters someone from her past. Dany reluctantly oversees a traditional celebration of athleticism.', '/ymI7V3wsZRcRqLWgjJ59CTTGvh5.jpg', '2015-06-07', 53, 0, 'free', 'publish', NULL),
(4248, 296, 1159054, 10, 'Mother\'s Mercy', 'Stannis marches. Dany is surrounded by strangers. Cersei seeks forgiveness. Jon is challenged.', '/b5dIepsIO3robQSe18fWmsQe37R.jpg', '2015-06-14', 61, 0, 'free', 'publish', NULL),
(4249, 297, 1156503, 1, 'The Red Woman', 'The fate of Jon Snow is revealed. Daenerys meets a strong man. Cersei sees her daughter once again.', '/qEu20NFIbwxtyABtFvsyyPaCNDM.jpg', '2016-04-24', 51, 0, 'free', 'publish', NULL),
(4250, 297, 1187406, 2, 'Home', 'Bran trains with the Three-Eyed Raven. In King’s Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night’s Watch stands behind Thorne. Ramsay Bolton proposes a plan, and Balon Greyjoy entertains other proposals.', '/9JlZ6sOXf4nodwWYvoM5zCJIGm9.jpg', '2016-05-01', 54, 0, 'free', 'publish', NULL),
(4251, 297, 1186952, 3, 'Oathbreaker', 'Daenerys meets her future. Bran meets the past. Tommen confronts the High Sparrow. Arya trains to be No One. Varys finds an answer. Ramsay gets a gift.', '/dNp7HBQbwKlgX76fwqM6SWUo5tU.jpg', '2016-05-08', 53, 0, 'free', 'publish', NULL),
(4252, 297, 1186953, 4, 'Book of the Stranger', 'Tyrion strikes a deal. Jorah and Daario undertake a difficult task. Jaime and Cersei try to improve their situation.', '/dY2DbzgIjIatJJCVRgk1gKTJWez.jpg', '2016-05-15', 59, 0, 'free', 'publish', NULL),
(4253, 297, 1186954, 5, 'The Door', 'Tyrion seeks a strange ally. Bran learns a great deal. Brienne goes on a mission. Arya is given a chance to prove herself.', '/96u7HuryCkPEIN3JkZP336KTSq3.jpg', '2016-05-22', 57, 0, 'free', 'publish', NULL),
(4254, 297, 1186955, 6, 'Blood of My Blood', 'An old foe comes back into the picture. Gilly meets Sam’s family. Arya faces a difficult choice. Jaime faces off against the High Sparrow.', '/k01MUth8Xm2y79nvsQ3UF25SN9w.jpg', '2016-05-29', 52, 0, 'free', 'publish', NULL),
(4255, 297, 1186956, 7, 'The Broken Man', 'The High Sparrow eyes another target. Jaime confronts a hero. Arya makes a plan. The North is reminded.', '/ymjvIqw8GClvQpurBYMeyaYXTck.jpg', '2016-06-05', 51, 0, 'free', 'publish', NULL),
(4256, 297, 1187403, 8, 'No One', 'While Jaime weighs his options, Cersei answers a request. Tyrion\'s plans bear fruit. Arya faces a new test.', '/xl2l1a3kXGxWwZqGDgjowBk4x46.jpg', '2016-06-12', 59, 0, 'free', 'publish', NULL),
(4257, 297, 1187404, 9, 'Battle of the Bastards', 'As the Starks prepare to fight, Davos loses something dear. Ramsay plays a game. Daenerys faces a choice.', '/j2znyjFSe1ol26DeQWMB1yE5EDQ.jpg', '2016-06-19', 60, 0, 'free', 'publish', NULL),
(4258, 297, 1187405, 10, 'The Winds of Winter', 'Tyrion counsels Daenerys on the upcoming campaign. Jon and Sansa discuss their future. Trials begin in King\'s Landing.', '/8qgIcKTOKeAHlJMjGyPHl3IHjcU.jpg', '2016-06-26', 68, 0, 'free', 'publish', NULL),
(4259, 298, 1233022, 1, 'Dragonstone', 'Jon organizes the defense of the North. Cersei tries to even the odds. Daenerys comes home.', '/3SB4PUzZAnY6HnZbVbktIZoopGs.jpg', '2017-07-16', 59, 0, 'free', 'publish', NULL),
(4260, 298, 1336114, 2, 'Stormborn', 'Daenerys receives an unexpected visitor. Jon faces a revolt. Tyrion plans the conquest of Westeros.', '/6ZLuB2YZeXTCEETnbPe5MNKCsio.jpg', '2017-07-23', 59, 0, 'free', 'publish', NULL);
INSERT INTO `episodes` (`id`, `season_id`, `tmdb_episode_id`, `episode_number`, `name`, `overview`, `still_path`, `air_date`, `runtime`, `is_downloadable`, `type`, `status`, `video_url`) VALUES
(4261, 298, 1336115, 3, 'The Queen\'s Justice', 'Daenerys holds court. Tyrion backchannels. Cersei returns a gift. Jaime learns from his mistakes.', '/xSqdpR6qADmjsdlcJLX5LXRToQP.jpg', '2017-07-30', 63, 0, 'free', 'publish', NULL),
(4262, 298, 1340524, 4, 'The Spoils of War', 'Daenerys fights back. Jaime faces an unexpected situation. Arya comes home.', '/hH9gSHcisHqoux734Q2SdLPLmsL.jpg', '2017-08-06', 50, 0, 'free', 'publish', NULL),
(4263, 298, 1340526, 5, 'Eastwatch', 'Tyrion tries to find a way to make Daenerys listen to reason while Jon plans a dangerous new mission.', '/3iaJDPtj75z1YpLDMKR17JRXQdP.jpg', '2017-08-13', 59, 0, 'free', 'publish', NULL),
(4264, 298, 1340527, 6, 'Beyond the Wall', 'Jon and his team go beyond the wall to capture a wight. Daenerys has to make a tough decision.', '/jDMCK1E4iqH8ZJeZnv3ftpei0nm.jpg', '2017-08-20', 70, 0, 'free', 'publish', NULL),
(4265, 298, 1340528, 7, 'The Dragon and the Wolf', 'A meeting is held in King\'s Landing. Problems arise in the North.', '/w4N4xxFrfjUyk7wE5hgcoAy0tDc.jpg', '2017-08-27', 80, 0, 'free', 'publish', NULL),
(4266, 299, 1551825, 1, 'Winterfell', 'Arriving at Winterfell, Jon and Daenerys struggle to unite a divided North. Jon Snow gets some big news.', '/o65qwX1aHJclJ36VDhD3VYzz5em.jpg', '2019-04-14', 55, 0, 'free', 'publish', NULL),
(4267, 299, 1551826, 2, 'A Knight of the Seven Kingdoms', 'The battle at Winterfell is approaching. Jaime is confronted with the consequences of the past. A tense interaction between Sansa and Daenerys follows.', '/vJ8H9WtzbJGfArfdycc4nagQVRU.jpg', '2019-04-21', 59, 0, 'free', 'publish', NULL),
(4268, 299, 1551827, 3, 'The Long Night', 'The Night King and his army have arrived at Winterfell and the great battle begins. Arya looks to prove her worth as a fighter.', '/mFtHbZenI5rRPqC5OFafoVmjEjq.jpg', '2019-04-28', 82, 0, 'free', 'publish', NULL),
(4269, 299, 1551828, 4, 'The Last of the Starks', 'In the wake of a costly victory, Jon and Daenerys look to the south as Tyrion eyes a compromise that could save countless lives.', '/9jgeANvHuZFVnTIkkKSU3PkGJZA.jpg', '2019-05-05', 79, 0, 'free', 'publish', NULL),
(4270, 299, 1551829, 5, 'The Bells', 'Daenerys brings her forces to King\'s Landing.', '/xF9hOs5h9sc37oWdtF4RPHq8dXA.jpg', '2019-05-12', 80, 0, 'free', 'publish', NULL),
(4271, 299, 1551830, 6, 'The Iron Throne', 'In the aftermath of the devastating attack on King\'s Landing, Daenerys must face the survivors.', '/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg', '2019-05-19', 80, 0, 'free', 'publish', NULL),
(4272, 300, 892432, 1, 'Rites of Passage', 'Farmer, family man and rebel Ragnar Lothbrok is determined to sail west to discover new lands and riches despite an intimidating warning from his village\'s tyrannical leader, Lord Haraldson, who makes it clear in no uncertain terms that doing so could result in severe consequences.', '/7cuiE0fvDXnCyVbQ5EXHtIz2sAr.jpg', '2013-03-03', 47, 0, 'free', 'publish', NULL),
(4273, 300, 892434, 2, 'Wrath of the Northmen', 'The journey west begins as Ragnar gathers a crew willing to risk their lives to travel into the unknown. Earl Haraldson\'s paranoia reaches new heights as his fear of Ragnar\'s success grows.', '/5IN9TOLnqt9dpIC3h6xnmGNqZuz.jpg', '2013-03-10', 47, 0, 'free', 'publish', NULL),
(4274, 300, 892433, 3, 'Dispossessed', 'Ragnar and his crew return from their trip with treasure, and Earl Haraldson has no choice but to sanction another raid. The west is open for the taking, and the Vikings\' world will never be the same.', '/srvPbivGYPH0hpFA9rqsmDXnO2Z.jpg', '2013-03-17', 45, 0, 'free', 'publish', NULL),
(4275, 300, 892435, 4, 'Trial', 'Ragnar and his crew sail out with Earl Haraldson\'s permission.', '/lmGxHLz8EExTSrN4e44g6wCnvyE.jpg', '2013-03-24', 45, 0, 'free', 'publish', NULL),
(4276, 300, 892436, 5, 'Raid', 'A seer reads Earl Haraldson\'s future and tells him that Ragnar searches for his death.', '/yKgFdIa1D4X4koiNFzfxv4G5T4b.jpg', '2013-03-31', 44, 0, 'free', 'publish', NULL),
(4277, 300, 892437, 6, 'Burial of the Dead', 'Ragnar, weak and still hurt, must meet the Earl head-on after it comes to light that Rollo has been tortured on Haraldson’s orders. The two men will come together face to face with a single outcome possible: Only one man will leave this fight alive.', '/kbcaeoP4vz6ggqFHKGPAtTBWCgr.jpg', '2013-04-07', 44, 0, 'free', 'publish', NULL),
(4278, 300, 892438, 7, 'A King\'s Ransom', 'Three Viking ships sail toward the Royal Villa of King Aelle in eastern England. Ragnar wants ransom in exchange for peace, but the king has a very different plan in mind.', '/tJFeOQIcK7BCBbMmGTqO9FF9noi.jpg', '2013-04-14', 44, 0, 'free', 'publish', NULL),
(4279, 300, 892439, 8, 'Sacrifice', 'The traditional pilgrimage to Uppsala to thank the gods brings a torrent of emotions for Ragnar, Lagertha, and Athelstan. Ragnar, pulling farther away from his wife goes to make peace with the death of his unborn son. Lagertha, still reeling from her miscarriage, wants to find out from the gods if more sons are in her future. As the Vikings come together to sacrifice and give thanks to their gods, Athelstan discovers just how strong his Christian faith still is.', '/z8sDwBSk48Al52CdA9u4vnPvWJQ.jpg', '2013-04-21', 47, 0, 'free', 'publish', NULL),
(4280, 300, 892440, 9, 'All Change', 'Ragnar travels to Götaland to help King Horik resolve a land dispute with the area\'s leader, Jarl Borg. Meanwhile, sickness infects the village of Kattegat, and the people look to Lagertha to help them appease the gods.', '/oyNW4u6DhkaF9m44RXo3Lwwc0WC.jpg', '2013-04-28', 45, 0, 'free', 'publish', NULL),
(4281, 301, 970845, 1, 'Brother\'s War', 'The battle begins between Ragnar and King Horik\'s forces against Jarl Borg; Princess Aslaug makes her way to Kattegat.', '/new6dK6yNOcXysMvm8KDp7pKqod.jpg', '2014-02-27', 48, 0, 'free', 'publish', NULL),
(4282, 301, 972579, 2, 'Invasion', 'The time has come for an unlikely alliance to band together for a new raid on England; a storm pushes the Viking fleet to a new destination; Ragnar and his men may have met their match.', '/2DWsKFy51lt1gYlcn2zy4DlqCGV.jpg', '2014-03-06', 46, 0, 'free', 'publish', NULL),
(4283, 301, 972833, 3, 'Treachery', 'King Ecbert finds himself facing an entirely new kind of foe; Ragnar races to dominate in the west; Jarl Borg has his own plans in store for the future of Kattegat.', '/a7v9k61yKmqRnRvr20cw4lzckJq.jpg', '2014-03-13', 46, 0, 'free', 'publish', NULL),
(4284, 301, 973162, 4, 'Eye for an Eye', 'Ragnar and Ecbert come face to face; Jarl Borg rules Kattegat with an iron fist; Rollo must now become the leader his people need in Ragnar\'s absence.', '/juWaNsM6TDCvxQ1J5j7T9qM4AVT.jpg', '2014-03-20', 47, 0, 'free', 'publish', NULL),
(4285, 301, 973348, 5, 'Answers in Blood', 'Lagertha and Ragnar unite to try to win Kattegat back from Jarl Borg; Aslaug must face the truth of her prophecies; Athelstan struggles to define his faith; Bjorn must once again make a choice.', '/uMctGpmxDEfFcLDv37y63IxURHC.jpg', '2014-03-27', 47, 0, 'free', 'publish', NULL),
(4286, 301, 973785, 6, 'Unforgiven', 'King Horik returns to Kattegat with a surprising proposition for Ragnar; Lagertha runs into a less than enthusiastic homecoming from her new husband; Athelstan becomes confidant to King Ecbert.', '/hS0pqJLCh9HAWI9JC76sc4ScnFN.jpg', '2014-04-03', 44, 0, 'free', 'publish', NULL),
(4287, 301, 974030, 7, 'Blood Eagle', 'Ragnar and King Horik clash over how to dispense justice to Jarl Borg. In Wessex, King Aelle arrives and Ecbert has an eye on a new alliance.', '/5cifsP8FNSVolSgVFx88ctHfRpp.jpg', '2014-04-10', 52, 0, 'free', 'publish', NULL),
(4288, 301, 974365, 8, 'Boneless', 'Princess Aslaug\'s latest prophecy comes to fruition as she readies to give birth once more. Ragnar, Horik and their new ally Lagertha set sail for Wessex - Ragnar and Horik have very different ideas about the true purpose of this trip.', '/b7yBD85DDvs7kdq1UxGSls8sy6E.jpg', '2014-04-17', 48, 0, 'free', 'publish', NULL),
(4289, 301, 974631, 9, 'The Choice', 'Ragnar\'s warriors march on to King Ecbert\'s villa and are met with a surprisingly vicious welcome party.', '/zoNFrK1ARgFtuT15v9VGbqSjt3m.jpg', '2014-04-24', 46, 0, 'free', 'publish', NULL),
(4290, 301, 975352, 10, 'The Lord\'s Prayer', 'Ragnar and King Horik return to Kattegat; Ragnar places his trust in those who have stood by him.', '/dBfQlXePKuoSwy6eCUOY8t2irOb.jpg', '2014-05-01', 46, 0, 'free', 'publish', NULL),
(4291, 302, 1034152, 1, 'Mercenary', 'Ragnar and Lagertha\'s fleets depart Kattegat once more for Wessex and this time they bring a group to colonize there. King Ecbert hosts the Norsemen and proposes a deal. Despite the misgivings of some of the other leaders, Ragnar leads his forces into battle once more, but this time as allies of Wessex.', '/lxkXxSHLqkqM7vSGaZLTRbVnfvw.jpg', '2015-02-19', 49, 0, 'free', 'publish', NULL),
(4292, 302, 1043609, 2, 'The Wanderer', 'Lagertha and Athelstan help to set up the Viking settlement. A mysterious wanderer arrives in Kattegat.', '/l3FI55cfzldcO3jhNX1CeSctabN.jpg', '2015-02-26', 44, 0, 'free', 'publish', NULL),
(4293, 302, 1043610, 3, 'Warrior\'s Fate', 'King Ecbert visits the developing Viking settlement as the first harvest is sown.', '/d4BYOprH5Ymf2VlglH3UnEZWc8P.jpg', '2015-03-05', 44, 0, 'free', 'publish', NULL),
(4294, 302, 1043611, 4, 'Scarred', 'There is bitterness in the camp, Floki is angry over the alliance with Ecbert.', '/5w5PZjjiT0fscns1td55qEuR2np.jpg', '2015-03-12', 44, 0, 'free', 'publish', NULL),
(4295, 302, 1043612, 5, 'The Usurper', 'The fleet returns to Kattegat to discover tragic circumstances await.', '/PkbyH1xQZy63SycZT07IOTSF1N.jpg', '2015-03-19', 44, 0, 'free', 'publish', NULL),
(4296, 302, 1043613, 6, 'Born Again', 'Preparations for the Paris raid pick up speed, and Rollo thinks about the Seer\'s prophecy.', '/9n8pc6XwRlEeeMb4nrukUGzRHS9.jpg', '2015-03-26', 44, 0, 'free', 'publish', NULL),
(4297, 302, 1047164, 7, 'Paris', 'The Viking fleet causes panic in Paris. The Emperor Charles declares he will remain in the city.', '/cFFY8zOjUQlACFAKyMIufup3VjE.jpg', '2015-04-02', 44, 0, 'free', 'publish', NULL),
(4298, 302, 1047165, 8, 'To the Gates!', 'The Viking army sets out and Paris goes into lockdown as the army prepares the defense.', '/5Wmmag8yK7kPyLunTnx9DuQAJTs.jpg', '2015-04-09', 44, 0, 'free', 'publish', NULL),
(4299, 302, 1047166, 9, 'Breaking Point', 'Paris is hit with a second assault. Emperor Charles needs to make a difficult decision.', '/kJerWFq6iuToWn6NJf2hwkXzFUO.jpg', '2015-04-16', 44, 0, 'free', 'publish', NULL),
(4300, 302, 1049832, 10, 'The Dead', 'With one last chance to take Paris, Ragnar, and his Vikings troops take a daring chance. Ragnar asks Bjorn for a favor that could change the course of Viking history.', '/5KpRWZYaZ8Tjxn40TQzPj4Tnk9t.jpg', '2015-04-23', 44, 0, 'free', 'publish', NULL),
(4301, 303, 1149575, 1, 'A Good Treason', 'A dangerously ill Ragnar returns to Kattegat, where his suspected death kicks off a scramble to succeed him. Meanwhile, Lagertha engages in a power struggle with her calculating, former second in command, Kalf. Rollo betrays his heritage and remains in Frankia. Floki pays the price for his brutality against the Christian priest.', '/hrwR0Ttjrr4iuiMWBVr9dTN2Aa7.jpg', '2016-02-18', 47, 0, 'free', 'publish', NULL),
(4302, 303, 1166651, 2, 'Kill the Queen', 'As Ragnar and Floki remain at odds, Rollo makes great efforts in Paris to win over his new bride, Princess Gisla. Meanwhile, King Ecbert sets the task for his son Aethelwulf to rescue Queen Kwenthrith.', '/fLmE6zAIwmL1tmzsPylRrxNvlac.jpg', '2016-02-25', 44, 0, 'free', 'publish', NULL),
(4303, 303, 1166652, 3, 'Mercy', 'Floki learns of the heavy price he has paid for his actions. Rollo finds an unlikely ally in Count Odo. Bjorn has to fight a fierce opponent in the wilderness.', '/whXSA0wNJ5huU8GwA1gVWoqOEpb.jpg', '2016-03-03', 49, 0, 'free', 'publish', NULL),
(4304, 303, 1166653, 4, 'Yol', 'King Aelle goes to Wessex for Christmas and is not impressed with how family relations are developing. Rollo\'s future hangs in the balance.', '/aj2TVz5b4U3uPicwQoRa3Z2ebxh.jpg', '2016-03-10', 44, 0, 'free', 'publish', NULL),
(4305, 303, 1166654, 5, 'Promised', 'There\'s an air of betrayal as those whom Odo trusts plot against him. Ecbert agrees to support Kwenthrith in Mercia. Pregnancy brings happiness to Lagertha and Kalf and a marriage is arranged.', '/uHJAV3pXqNw3gNl73Tx5aZi3HHe.jpg', '2016-03-17', 45, 0, 'free', 'publish', NULL),
(4306, 303, 1166655, 6, 'What Might Have Been', 'Ragnar declares another raid on Paris at the Thing in Kattegat. Ecbert also has a journey in mind as he dispatches Aethelwulf and Alfred on a pilgrimage to Rome.', '/zGAYf5xNRQSiS8cirRYnyonvlnH.jpg', '2016-03-24', 44, 0, 'free', 'publish', NULL),
(4307, 303, 1169238, 7, 'The Profit and the Loss', 'In England, King Ecbert\'s true ambitions are revealed as he plots to gain the crown of Mercia. The Vikings attack Paris with considerable force, but will Rollo\'s defenses be too much for them to overcome? Meanwhile, Harbard, the mysterious wanderer, returns and causes a stir amongst the women of Kattegat.', '/iNzGDvCcceZJ6AG5B8LA0LdbBen.jpg', '2016-03-31', 45, 0, 'free', 'publish', NULL),
(4308, 303, 1177783, 8, 'Portage', 'Defeat for the Vikings calls Ragnar\'s leadership into question as they evacuate their camp and move back down river. Ragnar remains inscrutable until he orders the fleet to beach at a cliff face and unveils an ingenious plan. Rollo and Gisla have news that strengthens Rollo\'s position at the French Court.', '/tnwyCySvtyEtKX2OqUMaO0yTPmD.jpg', '2016-04-07', 45, 0, 'free', 'publish', NULL),
(4309, 303, 1177784, 9, 'Death All \'Round', 'The labors of the Vikings eventually bear fruit as, within sight of Paris, they re-launch their boats but this time along with some interesting structures that Floki has built. Aethelwulf and Alfred eventually arrive in Rome and honors are conferred by Pope Leo but relations are not so cordial in Wessex between King Ecbert and the disgruntled King Aelle.', '/m4gzIOird8hnGMlPd9xDhz8GBbO.jpg', '2016-04-14', 45, 0, 'free', 'publish', NULL),
(4310, 303, 1177785, 10, 'The Last Ship', 'A ferocious battle between the Vikings and the French eventually comes down to Ragnar against Rollo. The outcome will seal the fate of the two brothers.', '/cvezBE5fO95KKl5ZEsXh3MOjUNw.jpg', '2016-04-21', 44, 0, 'free', 'publish', NULL),
(4311, 303, 1216032, 11, 'The Outsider', 'Ragnar returns to Kattegat and formulates a plan to head back to Wessex, where he intends to right past wrongs.. Meanwhile, Lagertha plans a power play in Kattegat and Bjorn prepares to fulfill his long-held dream to explore the Mediterranean in a sleek new boat built for him by Floki.', '/23bDUORmHdkWVdhFbqilDhuIxE0.jpg', '2016-11-30', 45, 0, 'free', 'publish', NULL),
(4312, 303, 1216033, 12, 'The Vision', 'The Kattegat locals chide Ragnar that the gods have deserted him as he struggles to crew his voyage to Wessex. It\'s Bjorn who has charisma now as he prepares to fulfill his long-held dream to explore the Mediterranean in a sleek new boat built for him by Floki. By contrast, Ragnar must accept weathered boats and a crew he has bribed but when Aslaug foresees that the fleet will be lost in a vicious storm her warnings go un-heeded by Ragnar and her precious son, Ivar.', '/mQLcB8sbGJz9nd8th1kY5IyH4P4.jpg', '2016-12-07', 44, 0, 'free', 'publish', NULL),
(4313, 303, 1235443, 13, 'Two Journeys', 'Ragnar\'s fleet is shipwrecked and washes up on the Wessex coast, but without enough survivors to form a credible force, Ragnar and Ivar have a difficult decision to make. Rollo meets his Viking comrades again and can\'t resist the urge to join Bjorn\'s voyage, risking his marriage and his new Frankish identity. Ragnar too is taking a risk as he carries Ivar towards the Royal Villa in Wessex – throwing himself and his son upon the mercy of King Ecbert.', '/r9g10W86w9qYDhfbUwj6ger674t.jpg', '2016-12-14', 46, 0, 'free', 'publish', NULL),
(4314, 303, 1243300, 14, 'In the Uncertain Hour Before the Morning', 'Lagertha attempts to fulfill a long-held ambition. Ragnar negotiates an unexpected concession from King Ecbert.', '/kRYaOvnxbBeILFRCVMIDmZWlj4y.jpg', '2016-12-21', 45, 0, 'free', 'publish', NULL),
(4315, 303, 1243301, 15, 'All His Angels', 'Ragnar and Ivar plot against the Saxons and reach a new level of understanding.', '/bo8f6YozU0JIWhuAxdvAIfWPVqS.jpg', '2016-12-28', 47, 0, 'free', 'publish', NULL),
(4316, 303, 1248645, 16, 'Crossings', 'Bjorn\'s fleet sails onward and launches a surprise attack. Back in Kattegat, Lagertha continues in her quest for power.', '/lXjAKqM6FzcE3jKzlv0hjnAIjnt.jpg', '2017-01-04', 43, 0, 'free', 'publish', NULL),
(4317, 303, 1248805, 17, 'The Great Army', 'The Viking army begins to gather in Kattegat. Lagertha must remain vigilant in the absence of her son, Bjorn.', '/nG5WMT0v3h6sXDUyZwzs7BcWi3z.jpg', '2017-01-11', 44, 0, 'free', 'publish', NULL),
(4318, 303, 1248806, 18, 'Revenge', 'Ragnar\'s plan comes to fruition. The Viking army lands on the coast of Northumbria.', '/5HLpnL66LOOVOu33bQz7iEwTvvH.jpg', '2017-01-18', 52, 0, 'free', 'publish', NULL),
(4319, 303, 1248807, 19, 'On the Eve', 'The Viking army causes panic in the English countryside as King Ecbert and Aethelwulf plan the defense of the realm.', '/lAPqhzVTyik6zJiRbkPTUlrCEMt.jpg', '2017-01-25', 44, 0, 'free', 'publish', NULL),
(4320, 303, 1248808, 20, 'The Reckoning', 'Prince Aethelwulf finds himself subject to the Vikings\' battle master plan. Ecbert remains behind with a plan of his own.', '/p22hFeEGVqZu9hmMwMIHXxN30J4.jpg', '2017-02-01', 46, 0, 'free', 'publish', NULL),
(4321, 304, 1396196, 1, 'The Departed (1)', 'Tensions mount between the sons of Ragnar Lothbrok as the Vikings continue to threaten the very heart of England. As the Great Army moves to take York, with King Aethelwulf and his family still in hiding, Heahmund—the warrior bishop—must rally the Saxons to defend the Realm.', '/p0B2fryD84NkeSG8IezwdswJryE.jpg', '2017-11-29', 46, 0, 'free', 'publish', NULL),
(4322, 304, 1340856, 2, 'The Departed (2)', 'Tensions mount between the sons of Ragnar Lothbrok as the Vikings continue to threaten the very heart of England. As the Great Army moves to take York, with King Aethelwulf and his family still in hiding, Heahmund—the warrior bishop—must rally the Saxons to defend the Realm.', '/lh1FjFNHRPH53bp1eqcrfnXs8TV.jpg', '2017-11-29', 44, 0, 'free', 'publish', NULL),
(4323, 304, 1396195, 3, 'Homeland', 'Celebrations are cut short in the aftermath of the battle at York. Ragnar Lothbrok\'s sons are pitted against each other as tensions reach an all-time high, and each is forced to choose a side.', '/cAiBQE2KtsFQMWNXmJb7sSl4o7.jpg', '2017-12-06', 44, 0, 'free', 'publish', NULL),
(4324, 304, 1396197, 4, 'The Plan', 'Guided by Heahmund\'s visions, the Saxons devise a battle plan. Ivar the Boneless strategises as the Vikings undergo increasing pressure. Bjorn Ironside finds himself in a new territory and must convince the local commander he is a trader.', '/mwhArS0AWSYKnES2Ne22vWgxl7Z.jpg', '2017-12-13', 44, 0, 'free', 'publish', NULL),
(4325, 304, 1396198, 5, 'The Prisoner', 'Ivar meets his match in Heahmund. Floki returns to Kattegat. Bjorn receives a lavish welcome in North Africa.', '/qW4zxYXVAIoodVC8G4ix7sLsP8H.jpg', '2017-12-20', 48, 0, 'free', 'publish', NULL),
(4326, 304, 1405442, 6, 'The Message', 'Lagertha is betrayed, and Bjorn must find a way to support the distraught queen. Floki and his settlers arrive in a new land, but it is far from what they expected.', '/cfmte4CzQuUyUka7gSLfNwDYLXD.jpg', '2017-12-27', 47, 0, 'free', 'publish', NULL),
(4327, 304, 1405443, 7, 'Full Moon', 'Bjorn returns to Kattegat to learn that an attack will take place during the next full moon. Ivar must decide if he can place his trust in a former enemy on the battlefield.', '/vpHMCPaeOflXb8NZFKx2rGMSMYM.jpg', '2018-01-03', 45, 0, 'free', 'publish', NULL),
(4328, 304, 1405444, 8, 'The Joke', 'The battle for Kattegat begins and, as the two armies line up to fight, the Great Heathen Army must decide between a final plea for peace or all-out war. Floki faces discord among the settlers.', '/ax7Qx3iaftydXA21h3JpdtL3DYG.jpg', '2018-01-10', 46, 0, 'free', 'publish', NULL),
(4329, 304, 1405445, 9, 'A Simple Story', 'The army leaders consider their options in the aftermath of the battle. In Floki\'s camp, all hopes of binding the community together are dashed as tragedy unfolds.', '/aGDpMbiLDRSKw67o5RKTKpFUEMK.jpg', '2018-01-17', 46, 0, 'free', 'publish', NULL),
(4330, 304, 1405446, 10, 'Moments of Vision', 'A sense of doom looms over Kattegat as bloodshed ensues. The defeated army flees in the face of the victors. A legendary warrior makes his way home.', '/glnCGZWOccC4fVCihgggXo93bA2.jpg', '2018-01-24', 46, 0, 'free', 'publish', NULL),
(4331, 304, 1535094, 11, 'The Revelation', 'Ivar is crowned the new king of Kattegat just in time to welcome Rollo home. Bjorn, Lagertha and Ubbe must rely on unsteady alliances to survive.', '/tHBGZz1uxTbhP0KWZ8fUaUYcsZe.jpg', '2018-11-28', 45, 0, 'free', 'publish', NULL),
(4332, 304, 1628200, 12, 'Murder Most Foul', 'Bjorn, Lagertha and Ubbe face an uncertain fate as Heahmund\'s loyalty is tested. Floki fights to understand the will of the gods. Ivar may have met his match.', '/7RyxIQQ2S0y3ZxBuZ89lCsgmoD2.jpg', '2018-12-05', 45, 0, 'free', 'publish', NULL),
(4333, 304, 1628201, 13, 'A New God', 'Heahmund must try to convince King Alfred that his actions are in defense of the Crown. Ubbe and Torvi strengthen the position of the Vikings but not all in the Viking camp support their strategy. Another settler disappears in Iceland.', '/6DHMKxB7FXXHy4myQixMxmNyFFQ.jpg', '2018-12-12', 45, 0, 'free', 'publish', NULL),
(4334, 304, 1628202, 14, 'The Lost Moment', 'As the celebrations for Ivar continue in Kattegat, grief hits Iceland and Floki must now make a fated decision. Harald\'s army approaches Wessex. A conspiracy grows against King Alfred.', '/xRSDThRVa1Xj3UpoIOR9xrqquZr.jpg', '2018-12-19', 44, 0, 'free', 'publish', NULL),
(4335, 304, 1628203, 15, 'Hell', 'Bishop Heahmund is wracked with guilt as he fights to renounce his passions. Viking will clash with Saxon on the battlefield leaving a key figure lost in the balance.', '/s56Ni5Ywi05t3gf4V9IN3QV16Zq.jpg', '2018-12-26', 45, 0, 'free', 'publish', NULL),
(4336, 304, 1648402, 16, 'The Buddha', 'Bjorn achieves one of Ragnar\'s dreams. Ivar hatches a new plan while preparing for a divine arrival. In Iceland, a settler returns in a terrible state. King Alfred faces his greatest threat yet.', '/sZdh4eH8hoi2uU7Vt6zBRkNbqj1.jpg', '2019-01-02', 44, 0, 'free', 'publish', NULL),
(4337, 304, 1651820, 17, 'The Most Terrible Thing', 'An unexpected turn amongst the settlers leaves Floki powerless. King Alfred confronts Judith. In York, Bjorn must strike a deal with Harald. Wessex is once again threatened by a Viking force, but who will lead the Saxon army to defend the Realm?', '/jkGKKRCkLkRMNBBnNMWTrDMCniE.jpg', '2019-01-09', 46, 0, 'free', 'publish', NULL),
(4338, 304, 1651824, 18, 'Baldur', 'Hvitserk is severely tested. Floki makes an amazing discovery. Freydis gives Ivar a surprise. Ubbe negotiates with the three Danish Kings that have massed their armies in Reading, but the negotiations may have a perilous outcome.', '/zAzm9qFxGxOlnAig6sVRer8CKAf.jpg', '2019-01-16', 45, 0, 'free', 'publish', NULL),
(4339, 304, 1651825, 19, 'What Happens in the Cave', 'Ubbe is forced into hand-to-hand combat. Floki reaches new depths and is met by a shocking sight. Bjorn sets off for Scandinavia with an old rival.', '/qoReo3XyPF4xrWMA5zq84CkKI8O.jpg', '2019-01-23', 44, 0, 'free', 'publish', NULL),
(4340, 304, 1651826, 20, 'Ragnarok', 'A new battle for Kattegat is on and only the gods know who will emerge victorious.', '/6PQWhAgRNXeg4kNagCP5soaK4Y3.jpg', '2019-01-30', 45, 0, 'free', 'publish', NULL),
(4341, 305, 1949344, 1, 'New Beginnings', 'It’s six months after the battle of Kattegat and Bjorn is now King. As he struggles with the responsibilities of kingship, he finds he can’t rely on his mother. Ivar falls into the hands of the Kievan Rus, and in their ruthless and unpredictable ruler, Prince Oleg, he may finally have met his match.', '/o3L1c9Fsw5G92zOEOrPi5RmyAcx.jpg', '2019-12-04', 46, 0, 'free', 'publish', NULL),
(4342, 305, 2005234, 2, 'The Prophet', 'Messengers arrive in Kattegat with news that presents Bjorn with a dilemma. Prince Oleg of Kiev seems untroubled by his conscience. Lagertha has settled into her new, peaceful life, but danger lurks nearby.', '/w7ZBnpkkbDuACKm3XUCOEEomzda.jpg', '2019-12-04', 44, 0, 'free', 'publish', NULL),
(4343, 305, 2005242, 3, 'Ghosts, Gods and Running Dogs', 'Lagertha is forced to take action. In Kiev, although Oleg continues to be friendly, Ivar is aware of the threat which Oleg poses to the vulnerable young heir to the throne. Bjorn has answered the call and come to the aid of an old enemy.', '/9blglyXt9RWGDBGBhWr3STaDtKe.jpg', '2019-12-11', 44, 0, 'free', 'publish', NULL),
(4344, 305, 2005245, 4, 'All the Prisoners', 'Lagertha leads her village\'s response to the recent attacks, but despite her best efforts, the consequences are tragic. Olaf has a bold new plan for the future of Norway. Ivar discusses Oleg\'s ambitions for Scandinavia.', '/eFj6z3QOKVwdc9yJnEBCFBfqlSM.jpg', '2019-12-18', 46, 0, 'free', 'publish', NULL),
(4345, 305, 2014568, 5, 'The Key', 'As Norway’s Kings and Jarls arrive at Harald’s territory for the election of the King of all Norway, Olaf is certain of the result, however, it may not go as smoothly as he believes. Lagertha’s village is anxious in anticipation of another attack and she is relieved when Gunnhild arrives with re-enforcements. In Kiev, Igor and Ivar engage in subterfuge and Ivar is stunned when he encounters a ghost from his past.', '/5ZQfIh4Eq924DYiBFcnb3nNTqDk.jpg', '2020-01-01', 44, 0, 'free', 'publish', NULL),
(4346, 305, 2020424, 6, 'Death and the Serpent', 'Bjorn is forced to act quickly in the aftermath of the election for the king of all Norway. The Bandits attack Lagertha’s village again confident of an easy victory. However, when the defense boils down to single combat with Lagertha, victory seems less likely. In Kattegat, haunted and paranoid, Hvitserk continues to unravel.', '/8l5jE8Ue1g9HZn417vbcHrvgaD5.jpg', '2020-01-08', 47, 0, 'free', 'publish', NULL),
(4347, 305, 2023324, 7, 'The Ice Maiden', 'Bjorn returns to Kattegat. Harald gains a measure of revenge on Olaf. In Kiev, interesting news reaches Ivar and Igor about Prince Dir.', '/mXzDiFWFiII28bCwRhD08OS1OuP.jpg', '2020-01-15', 45, 0, 'free', 'publish', NULL),
(4348, 305, 2023325, 8, 'Valhalla Can Wait', 'Bjorn faces a difficult decision. Ubbe and Torvi leave Kattegat in search of new lands and perhaps old friends. Oleg\'s plans for the invasion of Scandinavia take shape. King Harald is baffled by the origin of a mysterious raiding party.', '/qQz3GyZvuWHIDVmwlBP2k4eoQQ2.jpg', '2020-01-22', 46, 0, 'free', 'publish', NULL),
(4349, 305, 2029179, 9, 'Resurrection', 'In Iceland, Ubbe and Torvi finally meet a mysterious wanderer. Bjorn is forced to re-think who his enemies are when Erik returns from a scouting mission with worrying information. Bjorn will need allies, but he may not be able to convince his old foe, King Harald, to join forces in the face of the new threat. Ivar is reunited with someone close to him.', '/mW72v3NPSSja5fBKnjKNvMYnRZL.jpg', '2020-01-29', 46, 0, 'free', 'publish', NULL),
(4350, 305, 2060319, 10, 'The Best Laid Plans', 'Ivar and Igor may be plotting against Oleg, but they\'re still part of the force that departs Kiev to invade Scandinavia. King Harald and King Bjorn begin furious preparations for the invasion.', '/7jQkjDessT3JB36TMDv6uMkb25q.jpg', '2020-02-05', 51, 0, 'free', 'publish', NULL),
(4351, 305, 2502168, 11, 'King of Kings', 'In Iceland, Ubbe learns the truth about Kjetill and has a difficult decision to make. Back in Norway, the battle against the Rus has had grave consequences. But re-enforcements have arrived, and Bjorn has an idea that may yet save the day.', '/aCoYfoKTSMzmorUGLtetbFLAu3j.jpg', '2020-12-30', 47, 0, 'free', 'publish', NULL),
(4352, 305, 2582985, 12, 'All Change', 'Ubbe persuades the settlers in Iceland to embark on a voyage of exploration. The defeat of the Rus creates power vacuums in both Kattegat and Kiev.', '/78xct2iRITk4xw49tIO8SdklcgS.jpg', '2020-12-30', 47, 0, 'free', 'publish', NULL),
(4353, 305, 2582986, 13, 'The Signal', 'The election for Kattegat\'s new ruler is held, but a surprise visitor disrupts the proceedings. Ivar puts his plan to overthrow Oleg into action.', '/7gGkUeTPXXTTKxNVLtEywqzT0LF.jpg', '2020-12-30', 46, 0, 'free', 'publish', NULL),
(4354, 305, 2582987, 14, 'Lost Souls', 'As his enemies scheme for power, Harald prepares for his coronation and chooses a queen. Ubbe\'s party reaches shore — but not the one they\'re seeking.', '/rwV2fN5TnKumTdPk1PuT8abJWrR.jpg', '2020-12-30', 47, 0, 'free', 'publish', NULL),
(4355, 305, 2582988, 15, 'All at Sea', 'Factions in Greenland spill blood, driving Ubbe\'s company away. Troops under Ivar and Dir seize Kiev for Prince Igor. Gunnhild makes a fateful choice.', '/tDJx5ctSRoiHPJaW6FttobxZQ36.jpg', '2020-12-30', 47, 0, 'free', 'publish', NULL),
(4356, 305, 2582989, 16, 'The Final Straw', 'Ubbe and his followers languish on the open sea. Ivar and Hvitserk receive a frosty reception in Kattegat, until a restless Ivar has a revelation.', '/xEtHizRmll7cXnE4iho04lHx4nM.jpg', '2020-12-30', 45, 0, 'free', 'publish', NULL),
(4357, 305, 2582990, 17, 'The Raft of Medusa', 'Ivar and Hvitserk lead King Harald\'s army to England, where King Alfred of Wessex abandons his royal villa and marches to meet the sons of Ragnar.', '/bJJskMzn4HGgKWAXKXzvU684zWe.jpg', '2020-12-30', 45, 0, 'free', 'publish', NULL),
(4358, 305, 2582991, 18, 'It\'s Only Magic', 'King Alfred falls ill as the Viking army seizes the high ground. Ingrid curses Erik. Ubbe and his people find a new world — but they\'re not alone.', '/7YdP8WQEqg6r03wpw6OeLxvNMoF.jpg', '2020-12-30', 45, 0, 'free', 'publish', NULL),
(4359, 305, 2582993, 19, 'The Lord Giveth...', 'Ubbe and the settlers open relations with the indigenous people of the new land. Ivar\'s strategy lures Alfred\'s forces into a devastating battle.', '/ctmbwLgqQE3BPvLiAEP9VS81HGd.jpg', '2020-12-30', 46, 0, 'free', 'publish', NULL),
(4360, 305, 2582994, 20, 'The Last Act', 'Ubbe reunites with an old friend but must pass judgment on a killer. The armies of Alfred and Ivar clash as each leader looks to his god for strength.', '/1qJ5CMO7vLvU4Hw04hVLtK5d39d.jpg', '2020-12-30', 51, 0, 'free', 'publish', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `tmdb_genre_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `genres`
--

INSERT INTO `genres` (`id`, `tmdb_genre_id`, `name`) VALUES
(1, 878, 'Science Fiction'),
(2, 12, 'Adventure'),
(3, 28, 'Actions'),
(4, 10765, 'Sci-Fi & Fantasy'),
(5, 18, 'Drama'),
(6, 10759, 'Action & Adventure'),
(7, 53, 'Thriller'),
(8, 35, 'Comedy'),
(9, 80, 'Crime'),
(10, 9648, 'Mystery'),
(11, 16, 'Animation'),
(12, 10768, 'War & Politics'),
(14, 10752, 'War'),
(15, 36, 'History'),
(16, 14, 'Fantasy'),
(17, 10751, 'Family'),
(18, 27, 'Horror'),
(19, 10749, 'Romance'),
(20, 37, 'Western');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `homepage_sections`
--

CREATE TABLE `homepage_sections` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `section_type` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `homepage_sections`
--

INSERT INTO `homepage_sections` (`id`, `section_title`, `section_type`, `is_active`, `display_order`) VALUES
(1, 'Featured Slider', 'slider', 1, 1),
(2, 'Platforms', 'platforms_section', 1, 2),
(3, 'Latest Movies', 'latest_movies', 1, 4),
(4, 'Latest TV Shows', 'latest_tv_shows', 1, 5),
(5, 'All Genres', 'all_genres', 1, 6),
(6, 'Top 10 Trending', 'trending', 1, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `url`, `menu_order`, `is_active`) VALUES
(2, 'TV Shows', '/tv-shows', 2, 1),
(14, 'Movies', '/movies', 1, 1),
(16, 'Requests', '/requests', 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `tmdb_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `backdrop_path` varchar(255) DEFAULT NULL,
  `logo_backdrop_path` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `trailer_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_count` int(11) NOT NULL DEFAULT 0,
  `director` varchar(255) DEFAULT NULL,
  `budget` bigint(20) DEFAULT NULL,
  `revenue` bigint(20) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `instagram_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movies`
--

INSERT INTO `movies` (`id`, `tmdb_id`, `title`, `slug`, `overview`, `poster_path`, `backdrop_path`, `logo_backdrop_path`, `logo_path`, `release_date`, `runtime`, `video_url`, `trailer_key`, `created_at`, `view_count`, `director`, `budget`, `revenue`, `homepage`, `facebook_id`, `instagram_id`, `twitter_id`) VALUES
(22, 755898, 'War of the Worlds', 'war-of-the-worlds', 'Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, until one day an attack by an unknown entity leads him to question whether the government is hiding something from him... and from the rest of the world.', '/yvirUYrva23IudARHn3mMGVxWqM.jpg', '/kqHypb4MdEBUFiphf49bK99T4cn.jpg', '/f2T5LlY8EPvmgtBVvOra8H2GvlQ.jpg', '/4U3NQ3KvqjofySTwoDbffawb00h.png', '2025-07-29', 91, NULL, 'd9erkpdh5o0', '2025-08-15 01:45:30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 1234821, 'Jurassic World Rebirth', 'jurassic-world-rebirth', 'Five years after the events of Jurassic World Dominion, covert operations expert Zora Bennett is contracted to lead a skilled team on a top-secret mission to secure genetic material from the world\'s three most massive dinosaurs. When Zora\'s operation intersects with a civilian family whose boating expedition was capsized, they all find themselves stranded on an island where they come face-to-face with a sinister, shocking discovery that\'s been hidden from the world for decades.', '/1RICxzeoNCAO5NpcRMIgg1XT6fm.jpg', '/fncHijpWjitFBmj7SX5z148XEhP.jpg', '/4f2csu7KZ6tXhlmRWGEmBpFZetP.jpg', '/tO2Y6RlJuXKtzVMsRRYCGUwgP39.png', '2025-07-01', 134, NULL, '2ZhB-YO5Tnk', '2025-08-15 01:45:37', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 1195631, 'William Tell', 'william-tell', 'The narrative unfolds in the 14th Century, when the European nations vie for supremacy within the Holy Roman Empire. The ambitious Austrian Empire, desiring more land, invades neighbouring Switzerland, a serene and pastoral nation. Protagonist William Tell, a formerly peaceful hunter, finds himself forced to take action as his family and homeland come under threat from the oppressive Austrian King and his ruthless warlords.', '/8SdaetXSTPyQVDb5pTEPRLBSx15.jpg', '/bP6BqIljp4a3BqhxN7YPckcpKI.jpg', '/rIA80h7plU21PIK9zzZZpXviZOA.jpg', '/hmwRnMg2IfkBl4NRm8euoxaYmNn.png', '2025-01-17', 133, NULL, 'dex9bWjroao', '2025-08-15 01:45:51', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 1106289, 'The Pickup', 'the-pickup', 'A routine cash pickup takes a wild turn when mismatched armored truck drivers Russell and Travis are ambushed by ruthless criminals led by savvy mastermind Zoe.', '/vFWvWhfAvij8UIngg2Vf6JV95Cr.jpg', '/y7tjLYcq2ZGy2DNG0ODhGX9Tm60.jpg', '/mM65QLduex33VCvHvVzt32TEKjY.jpg', '/iQgO4V26Uk2HZYCxbGHqdWLRJmf.png', '2025-07-27', 94, NULL, 'YIcga73lPFE', '2025-08-15 01:45:55', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 1285247, 'Murder Company', 'murder-company', 'In the midst of the D-Day invasion, a group of US soldiers are given orders to smuggle a member of the French Resistance behind enemy lines to assassinate a high-value Nazi target.', '/eUjzUUFm1dEUR6U4r0C6s9L2FEd.jpg', '/eDVp3J8HqkXXMagnVKlm53dYJvJ.jpg', '/oUzLjO3Lo6yP6bJJ052FbVJwbw3.jpg', '/qVByCLuZ2EnX0bUcNgKnWdiF4RM.png', '2024-07-05', 86, NULL, 'NKIAEVuLETI', '2025-08-15 01:46:15', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1311031, 'Demon Slayer: Kimetsu no Yaiba Infinity Castle', 'demon-slayer-kimetsu-no-yaiba-infinity-castle', 'As the Demon Slayer Corps members and Hashira engaged in a group strength training program, the Hashira Training, in preparation for the forthcoming battle against the demons, Muzan Kibutsuji appears at the Ubuyashiki Mansion. With the head of the Demon Corps in danger, Tanjiro and the Hashira rush to the headquarters but are plunged into a deep descent to a mysterious space by the hands of Muzan Kibutsuji.  The destination of where Tanjiro and Demon Slayer Corps have fallen is the demons\' stronghold – the Infinity Castle. And so, the battleground is set as the final battle between the Demon Slayer Corps and the demons ignites.', '/aFRDH3P7TX61FVGpaLhKr6QiOC1.jpg', '/1RgPyOhN4DRs225BGTlHJqCudII.jpg', '/aI3Wz1F6ie9DY94jp5F42Yg5ZYK.jpg', '/w3H7PDwwss5SLuMQ8UBrAProasG.png', '2025-07-18', 155, NULL, 'VCC958XvXpA', '2025-08-15 01:46:24', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1155281, 'Creation of the Gods II: Demon Force', 'creation-of-the-gods-ii-demon-force', 'Taishi Wen Zhong led the army of Shang Dynasty including Deng Chanyu and four generals of the Mo Family to Xiqi. With the help of Kunlun immortals such as Jiang Ziya, Ji Fa led the army and civilians of Xiqi to defend their homeland.', '/dfUCs5HNtGu4fofh83uiE2Qcy3v.jpg', '/yujcZMkNKtNXPvRGyTA3e3VCrbx.jpg', '', '', '2025-01-29', 145, NULL, 'GR1LszelGoU', '2025-08-15 01:46:31', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 1087192, 'How to Train Your Dragon', 'how-to-train-your-dragon', 'On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.', '/q5pXRYTycaeW6dEgsCrd4mYPmxM.jpg', '/7HqLLVjdjhXS0Qoz1SgZofhkIpE.jpg', '/9E0C4FVsGfQzeuQA7wMxYKwhxVv.jpg', '/sEJ7d72IXxoktZeJ4V6z35Hhe4a.png', '2025-06-06', 125, NULL, 'OWEq2Pf8qpk', '2025-08-15 01:46:39', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 1225572, 'Screamboat', 'screamboat', 'A late-night boat ride turns into a desperate fight for survival in New York City when a mischievous mouse becomes a monstrous reality.', '/78xGAhQaKpgq9TI08XK40Ua2bGx.jpg', '/r2u7GCYhxtpZbprKJIgdAkGQow3.jpg', '/5eeXWOaTQrfPaaRCBnzAWENFAuj.jpg', '/5o0UPWnv6p4QTTSEri9zhKDsVWi.png', '2025-03-20', 102, NULL, 'gE3TbWfKTMs', '2025-08-16 00:11:43', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 1307078, 'My Oxford Year', 'my-oxford-year', 'An ambitious American fulfilling her dream of studying at Oxford falls for a charming Brit hiding a secret that may upend her perfectly planned life.', '/jrhXbIOFingzdLjkccjg9vZnqIp.jpg', '/A466i5iATrpbVjX30clP1Zyfp31.jpg', '/a1OrRCGUFdtt2icChuAqsNdwQBT.jpg', '/8bwh6JVD0ilbvtZloLTCnAnfDJc.png', '2025-07-31', 113, NULL, 'EKQPCiUSRAo', '2025-08-16 01:19:39', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 238, 'The Godfather', 'the-godfather', 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.', '/3bhkrj58Vtu7enYsRolD1fZdja1.jpg', '/htuuuEwAvDVECMpb0ltLLyZyDDt.jpg', '/AbgEQO2mneCSOc8CSnOMa8pBS8I.jpg', '/kysDTCloxUPJ1BILI4f8gs74fcr.png', '1972-03-14', 175, NULL, 'Ew9ngL1GZvs', '2025-08-16 01:20:30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 157336, 'Interstellar', 'interstellar', 'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.', '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', '/vgnoBSVzWAV9sNQUORaDGvDp7wx.jpg', '/Ys8UIGWJpd2TMuQk8fU77W3mBz.jpg', '/rf5sspdsudNSITHMNNcJyvb1LBv.png', '2014-11-05', 169, NULL, 'LY19rHKAaAg', '2025-08-16 01:24:34', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 550, 'Fight Club', 'fight-club', 'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.', '/jSziioSwPVrOy9Yow3XhWIBDjq1.jpg', '/hZkgoQYus5vegHoetLkCJzb17zJ.jpg', '/b9HyPoxwxjxkWEUL5ErZdhApQe2.jpg', '/7Uqhv24pGJs4Ns31NoOPWFJGWNG.png', '1999-10-15', 139, NULL, 'dfeUzm6KF4g', '2025-08-16 01:32:15', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 569094, 'Spider-Man: Across the Spider-Verse', 'spider-man-across-the-spider-verse', 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.', '/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg', '/kVd3a9YeLGkoeR50jGEXM6EqseS.jpg', '/nGxUxi3PfXDRm7Vg95VBNgNM8yc.jpg', '/cmE0j3mQQe6xrzLryxGF9rF2KC8.png', '2023-05-31', 140, NULL, 'yFrxzaBLDQM', '2025-08-16 01:47:46', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 27205, 'Inception', 'inception', 'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person\'s idea into a target\'s subconscious.', '/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg', '/gqby0RhyehP3uRrzmdyUZ0CgPPe.jpg', '/sTwMClsIxfPEb4gEl8Rd7fFFRyD.jpg', '/8ThUfwQKqcNk6fTOVaWOts3kvku.png', '2010-07-15', 148, NULL, 'JE9z-gy4De4', '2025-08-16 01:58:59', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 429, 'The Good, the Bad and the Ugly', 'the-good-the-bad-and-the-ugly', 'While the Civil War rages on between the Union and the Confederacy, three men – a quiet loner, a ruthless hitman, and a Mexican bandit – comb the American Southwest in search of a strongbox containing $200,000 in stolen gold.', '/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg', '/x4biAVdPVCghBlsVIzB6NmbghIz.jpg', 'https://image.tmdb.org/t/p/original/bN9DtYAagtGLUUtKwlErmMrwt75.jpg', '/3u3zjZnW7O1TPHmbs3OUUCfg12x.png', '1966-12-22', 161, NULL, 'WCnRSl24FPA', '2025-08-16 01:59:27', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 533535, 'Deadpool & Wolverine', 'deadpool-wolverine', 'A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.', '/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg', '/by8z9Fe8y7p4jo2YlW2SZDnptyT.jpg', '/wNa8cZp4fjF5Fa1oE5HhF6Km7kK.jpg', '/2o48U3kMXGIqRAkKZQ3n5OTWSBy.png', '2024-07-24', 128, NULL, 'Idh8n5XuYIA', '2025-08-29 00:11:29', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 1429739, 'Gold Rush Gang', 'gold-rush-gang', 'At the tail end of World War II, a bandit leader and his crew go up against his sworn enemy and the Japanese army to rob a train full of gold.', '/7j6jZNhCTnsZy5QItpruDwyBWoo.jpg', '/kYsU56QEcwEr8jAQ6Vm3M8bXTWz.jpg', 'https://image.tmdb.org/t/p/original/oTdhYP7c8pzCfrK9RSo5Dw4jkyG.jpg', '/6JTmvTnnKPQjK94RBp1WSOOwTGa.png', '2025-08-19', 120, NULL, 'f0tzvgOpAlc', '2025-08-29 03:01:42', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 603, 'The Matrix', 'the-matrix', 'Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.', '/p96dm7sCMn4VYAStA6siNz30G1r.jpg', '/8K9qHeM6G6QjQN0C5XKFGvK5lzM.jpg', '/ll4HTrUVuELq7wixDB36uzI1VHN.jpg', '/kA8phmxG7h4BIN061fiutckq9Ho.png', '1999-03-31', 136, NULL, 'd0XTFAMmhrE', '2025-09-01 03:42:38', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_cast`
--

CREATE TABLE `movie_cast` (
  `movie_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `cast_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movie_cast`
--

INSERT INTO `movie_cast` (`movie_id`, `person_id`, `character_name`, `cast_order`) VALUES
(22, 149, 'William Radford', 0),
(22, 150, 'NASA Scientist Sandra Salas', 1),
(22, 151, 'NSA Director Donald Briggs', 2),
(22, 152, 'Faith Radford', 3),
(22, 153, 'David Radford', 4),
(23, 154, 'Zora Bennett', 0),
(23, 155, 'Dr. Henry Loomis', 1),
(23, 156, 'Duncan Kincaid', 2),
(23, 157, 'Martin Krebs', 3),
(23, 158, 'Reuben Delgado', 4),
(24, 159, 'William Tell', 0),
(24, 160, 'Gessler', 1),
(24, 161, 'Suna', 2),
(24, 162, 'Rudenz', 3),
(24, 163, 'Princess Bertha', 4),
(25, 150, 'Natalie', 3),
(25, 164, 'Russell', 0),
(25, 165, 'Travis', 1),
(25, 166, 'Zoe', 2),
(25, 167, 'Banner', 4),
(26, 168, 'General Haskel', 0),
(26, 169, 'Southern', 1),
(26, 170, 'Smith', 2),
(26, 171, 'Daquin', 3),
(26, 172, 'Coolidge', 4),
(27, 173, 'Tanjiro Kamado (voice)', 0),
(27, 174, 'Nezuko Kamado (voice)', 1),
(27, 175, 'Inosuke Hashibira (voice)', 2),
(27, 176, 'Zenitsu Agatsuma (voice)', 3),
(27, 177, 'Muzan Kibutsuji (voice)', 4),
(28, 178, 'Jiang Ziya', 0),
(28, 179, 'Ji Fa', 1),
(28, 180, 'Deng Chanyu', 2),
(28, 181, 'Yin Jiao', 3),
(28, 182, 'King Zhou', 4),
(29, 183, 'Hiccup', 0),
(29, 184, 'Astrid', 1),
(29, 185, 'Stoick', 2),
(29, 186, 'Gobber', 3),
(29, 187, 'Snoutlout', 4),
(30, 237, 'Steamboat Willie', 0),
(30, 238, 'Selena', 1),
(30, 239, 'Amber', 2),
(30, 240, 'Pete', 3),
(30, 241, 'Barry', 4),
(31, 242, 'Anna De La Vega', 0),
(31, 243, 'Jamie Davenport', 1),
(31, 244, 'Maggie Timbs', 2),
(31, 245, 'Charlie Butler', 3),
(31, 246, 'William Davenport', 4),
(32, 247, 'Don Vito Corleone', 0),
(32, 248, 'Michael Corleone', 1),
(32, 249, 'Sonny Corleone', 2),
(32, 250, 'Tom Hagen', 3),
(32, 251, 'Clemenza', 4),
(33, 252, 'Cooper', 0),
(33, 253, 'Brand', 1),
(33, 254, 'Professor Brand', 2),
(33, 255, 'Murph', 3),
(33, 256, 'Tom', 4),
(34, 257, 'Narrator', 0),
(34, 258, 'Tyler Durden', 1),
(34, 259, 'Marla Singer', 2),
(34, 260, 'Robert Paulson', 3),
(34, 261, 'Angel Face', 4),
(35, 262, 'Miles Morales (voice)', 0),
(35, 263, 'Gwen Stacy (voice)', 1),
(35, 264, 'Jeff Morales (voice)', 2),
(35, 265, 'Rio Morales (voice)', 3),
(35, 266, 'Peter B. Parker (voice)', 4),
(36, 267, 'Dom Cobb', 0),
(36, 268, 'Arthur', 1),
(36, 269, 'Saito', 2),
(36, 270, 'Eames', 3),
(36, 271, 'Ariadne', 4),
(37, 272, 'Blondie', 0),
(37, 273, 'Tuco Ramirez', 1),
(37, 274, 'Sentenza / Angel Eyes', 2),
(37, 275, 'Alcoholic Union Captain', 3),
(37, 276, 'Father Pablo Ramirez', 4),
(37, 277, 'Maria', 5),
(37, 278, 'Storekeeper', 6),
(37, 279, 'Tuco Henchman', 7),
(37, 280, 'Bill Carson / Jackson', 8),
(37, 281, 'Baker', 9),
(38, 282, 'Wade Wilson / Deadpool / Nicepool', 0),
(38, 283, 'Logan / Wolverine', 1),
(38, 284, 'Cassandra Nova', 2),
(38, 285, 'Mr. Paradox', 3),
(38, 286, 'Laura / X-23', 4),
(39, 302, 'Ko-Wah Thungsong', 0),
(39, 303, 'Jong Lansaka', 1),
(39, 304, 'Yada Nopphitam', 2),
(39, 305, 'Dum Sichon', 3),
(39, 306, 'Mont Ronphibun', 4),
(40, 312, 'Neo', 0),
(40, 313, 'Morpheus', 1),
(40, 314, 'Trinity', 2),
(40, 315, 'Agent Smith', 3),
(40, 316, 'Oracle', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movie_genres`
--

INSERT INTO `movie_genres` (`movie_id`, `genre_id`) VALUES
(22, 1),
(22, 7),
(23, 1),
(23, 2),
(23, 3),
(24, 3),
(24, 5),
(24, 15),
(25, 3),
(25, 8),
(25, 9),
(26, 3),
(26, 14),
(27, 3),
(27, 7),
(27, 11),
(27, 16),
(28, 3),
(28, 14),
(28, 16),
(29, 2),
(29, 3),
(29, 16),
(29, 17),
(30, 8),
(30, 18),
(31, 5),
(31, 8),
(31, 19),
(32, 5),
(32, 9),
(33, 1),
(33, 2),
(33, 5),
(34, 5),
(34, 7),
(35, 1),
(35, 2),
(35, 3),
(35, 11),
(36, 1),
(36, 2),
(36, 3),
(37, 20),
(38, 1),
(38, 3),
(38, 8),
(39, 3),
(39, 5),
(39, 8),
(39, 20),
(40, 1),
(40, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_networks`
--

CREATE TABLE `movie_networks` (
  `movie_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_platforms`
--

CREATE TABLE `movie_platforms` (
  `movie_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movie_platforms`
--

INSERT INTO `movie_platforms` (`movie_id`, `platform_id`) VALUES
(9, 3),
(9, 4),
(18, 3),
(18, 4),
(28, 3),
(28, 4),
(29, 3),
(29, 4),
(39, 3),
(39, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `tmdb_person_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `profile_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `people`
--

INSERT INTO `people` (`id`, `tmdb_person_id`, `name`, `profile_path`) VALUES
(149, 9778, 'Ice Cube', '/ymR7Yll7HjL6i6Z3pt435hYi91T.jpg'),
(150, 52605, 'Eva Longoria', '/1u26GLWK1DE7gBugyI9P3OMFq4A.jpg'),
(151, 9048, 'Clark Gregg', '/mq686D91XoZpqkzELn0888NOiZW.jpg'),
(152, 1632530, 'Iman Benson', '/6s8Cyc4rxDRpX1vYnczU52RM4IM.jpg'),
(153, 60482, 'Henry Hunter Hall', '/qZEv8RIGC9yLwY29Vo4KQzpO9Dt.jpg'),
(154, 1245, 'Scarlett Johansson', '/9t4CIXaNPkCB1BRivCVPej1SZGf.jpg'),
(155, 80860, 'Jonathan Bailey', '/kMtZtavkXIXYA0CnhaWqbNo6uFV.jpg'),
(156, 932967, 'Mahershala Ali', '/9ZmSejm5lnUVY5IJ1iNx2QEjnHb.jpg'),
(157, 36669, 'Rupert Friend', '/a3HeMHmlXnoRlHLX9h31ZdZgCXM.jpg'),
(158, 1168097, 'Manuel Garcia-Rulfo', '/54Rk1hKfNdNKGHQMnONDGmNtUv3.jpg'),
(159, 150802, 'Claes Bang', '/fqSBUq2UEoQYuqjjKNMQzDVxZv2.jpg'),
(160, 2112439, 'Connor Swindells', '/12mK65Y0oLnJWgTK6jeI6q8p1xE.jpg'),
(161, 229932, 'Golshifteh Farahani', '/DuAPmZxZlX25m57pJy16WbIyKM.jpg'),
(162, 1599391, 'Jonah Hauer-King', '/yXGsk9UtOV9tprU5ZSuhwdFtaBB.jpg'),
(163, 1508785, 'Ellie Bamber', '/7hWOxGSLeIbCrcwBT83NRJNK6p3.jpg'),
(164, 776, 'Eddie Murphy', '/qgjMfefsKwSYsyCaIX46uyOXIpy.jpg'),
(165, 1427948, 'Pete Davidson', '/f3kubnZu3KgMniExcq9nJy8RwjW.jpg'),
(166, 74688, 'Keke Palmer', '/f5i3WzdMt02mlfm9I9LHKRJtZ4J.jpg'),
(167, 1292258, 'Jack Kesy', '/lQ8nUYK6InbCFk2TWNnXjjvG9IY.jpg'),
(168, 7090, 'Kelsey Grammer', '/5zik4VJim6YTSWDjC7tkp13wxUp.jpg'),
(169, 5528, 'William Moseley', '/6HTpmCaGhtLEY6OUhRaXYgldb0x.jpg'),
(170, 29234, 'Joe Anderson', '/x0Fz2mIMU4Prk7I43pn87Fyno40.jpg'),
(171, 58723, 'Gilles Marini', '/sbe1rtvd0DhLy2MW3FT6SvMsPTe.jpg'),
(172, 87817, 'Pooch Hall', '/uG2km0S6M5JNQlsxyvzsnqFrrJd.jpg'),
(173, 1256603, 'Natsuki Hanae', '/alTb0DlcPIbcwM08WSmxFai58sd.jpg'),
(174, 1563442, 'Akari Kito', '/AoRQOZRC0yINB0WeKnM569rV1wF.jpg'),
(175, 233590, 'Yoshitsugu Matsuoka', '/ugDwdWEXnmv43jcbnfAi4XwiQ8C.jpg'),
(176, 119145, 'Hiro Shimono', '/yrSDcgFefHtWkFmLnTrcw2t0MV.jpg'),
(177, 90571, 'Toshihiko Seki', '/7jUPvx4hxWZWZJgyiCwd8KxWuvI.jpg'),
(178, 128026, 'Huang Bo', '/zOzz4woq7dfcll9AR1yGiQbjY4.jpg'),
(179, 3193743, 'Yu Shi', '/xIzHhuScL4wbm2zmHxtnfpBFqcs.jpg'),
(180, 4176055, 'Nashi', '/i2oD8NEMmCSXDVtJq0bxOF0cJ4V.jpg'),
(181, 1612192, 'Chen Muchi', '/cu7k1HTLpNNNKZ2WdxVIUGXiPVF.jpg'),
(182, 1133067, 'Kris Phillips', '/gh6dlF5SkVKfNrRaHVseBwiTbUA.jpg'),
(183, 2803710, 'Mason Thames', '/8xgGYl8AMWVB44r8wEyweiao5bO.jpg'),
(184, 2064124, 'Nico Parker', '/gt0NJClVSCPCEfcPgcLj3f85uLa.jpg'),
(185, 17276, 'Gerard Butler', '/rTO5opVC3Gs6hPYAxWSP9eEjogi.jpg'),
(186, 11109, 'Nick Frost', '/2CHS4t6miNGLgMQAjhFqb4fFuKS.jpg'),
(187, 3792786, 'Gabriel Howell', '/u3PTI9FlrpGFZVMoHXZZBiYWMCl.jpg'),
(188, 974169, 'Jenna Ortega', '/7oUAtVgZU0uLdUSvDHKkINt1y7Y.jpg'),
(189, 884, 'Steve Buscemi', '/lQKdHMxfYcCBOvwRKBAxPZVNtkg.jpg'),
(190, 1911865, 'Hunter Doohan', '/ihno5ut6ha8TaubQFgl5Ozco2K1.jpg'),
(191, 2604515, 'Emma Myers', '/v1Y8RP39135ZOary9M4MbkrCAdn.jpg'),
(192, 2189049, 'Joy Sunday', '/phPn3BRW1vZzxkl3hgEy8umzXn.jpg'),
(193, 53820, 'Michael C. Hall', '/7zUMGoujuev5PUwwv4Gl6ikB50k.jpg'),
(194, 53828, 'Jennifer Carpenter', '/haxhKRJoWl71dAUWMLlDIaSd5bN.jpg'),
(195, 25879, 'Geoff Pierson', '/vIhxKBwqV19CwHdPuycmkchYOba.jpg'),
(196, 22821, 'David Zayas', '/w1E8n9gl2HcZEhfBOXdVzMvIlzg.jpg'),
(197, 1736, 'James Remar', '/56LwfMaMge2LmWYI46O6R2Wm0YX.jpg'),
(198, 22970, 'Peter Dinklage', '/9CAd7wr8QZyIN0E7nm8v1B6WkGn.jpg'),
(199, 239019, 'Kit Harington', '/iCFQAQqb0SgvxEdVYhJtZLhM9kp.jpg'),
(200, 12795, 'Nikolaj Coster-Waldau', '/6w2SgB20qzs2R5MQIAckINLhfoP.jpg'),
(201, 17286, 'Lena Headey', '/cDyZLf8ddz0EgoUjpv4jjzy7qxA.jpg'),
(202, 1223786, 'Emilia Clarke', '/58ZhsLDVFgxx6fePJQ2K8RVpc1s.jpg'),
(203, 73249, 'Lee Jung-jae', '/s3Sv4bZORQ5DuZJahgU2X0RgMUQ.jpg'),
(204, 1557181, 'Wi Ha-jun', '/tEZuIaMESdBw4LfNq3vshGR4VlP.jpg'),
(205, 1296713, 'Yim Si-wan', '/8XbMzvYE3KUNDW1jEHSCjM9t89n.jpg'),
(206, 2359937, 'Jo Yu-ri', '/4GwoDQFPwpaKldOTpGrIJUzBa9h.jpg'),
(207, 25002, 'Lee Byung-hun', '/pY4pwYO8qwtzvuzpzRczDACDiVA.jpg'),
(208, 17419, 'Bryan Cranston', '/aGSvZg7uITJveQtGHDcPNI6map1.jpg'),
(209, 84497, 'Aaron Paul', '/8Ac9uuoYwZoYVAIJfRLzzLsGGJn.jpg'),
(210, 134531, 'Anna Gunn', '/adppyeu1a4REN3khtgmXusrapFi.jpg'),
(211, 209674, 'RJ Mitte', '/s36ExsDnmlSKVDF7vu05NzjH3LW.jpg'),
(212, 14329, 'Dean Norris', '/cchkQH3DRrvwFYocx7TxyfIDAAr.jpg'),
(213, 51382, 'Chris Parnell', '/9Ga03Y9TVIqTZJ4I9rfL740ibgJ.jpg'),
(214, 176823, 'Spencer Grammer', '/1L8Y45RJo2YxUXl6ldIowQay1V7.jpg'),
(215, 49001, 'Sarah Chalke', '/ycwiu89cpjqCtSNC5FjbJggjj5R.jpg'),
(216, 4322756, 'Ian Cardoni', '/iEC17Hj50xsH99GTRai14yWP0wp.jpg'),
(217, 4129855, 'Harry Belden', '/lkEyIjVsOKOzJgMZE2o8DCrOkbF.jpg'),
(218, 62220, 'Lauren Cohan', '/zJ9nZ5jqQTUD55GLKbgfiKlUoBN.jpg'),
(219, 4886, 'Norman Reedus', '/ozHPdO5jAt7ozzdZUgyRAMNPSDW.jpg'),
(220, 47296, 'Jeffrey Dean Morgan', '/m8bdrmh6ExDCGQ64E83mHg002YV.jpg'),
(221, 31535, 'Melissa McBride', '/2omPfeMdnicJqqvgKAU2iqVyD4Z.jpg'),
(222, 84224, 'Christian Serratos', '/jP07Elhu2eZdmjIB4fJiag5CfaD.jpg'),
(223, 2037, 'Cillian Murphy', '/llkbyWKwpfowZ6C8peBjIV9jj99.jpg'),
(224, 220448, 'Paul Anderson', '/xROnQbYvFH3OSEoC9EgRriVAQ1G.jpg'),
(225, 1088620, 'Sophie Rundle', '/9HxJ6pG1Q0BBbIV1UXk5iU9zDM9.jpg'),
(226, 1167897, 'Natasha O\'Keeffe', '/tOX10C02tSFnOSra8a8rGuA6QZ5.jpg'),
(227, 73968, 'Henry Cavill', '/kN3A5oLgtKYAxa9lAkpsIGYKYVo.jpg'),
(228, 2146944, 'Anya Chalotra', '/uF7OzuFm0TEYP8MkaBiQBLjuxUv.jpg'),
(229, 2146942, 'Freya Allan', '/z4zucBNv95oNwUEveKJSDhdNsCX.jpg'),
(230, 1353920, 'Joey Batey', '/4uo4JPaK6KpdN7v8C1pbwKpNVJU.jpg'),
(231, 57578, 'MyAnna Buring', '/oN3YUXsQYfcss2lJZetkRPoKx21.jpg'),
(232, 77996, 'Asa Butterfield', '/1IoQIesuvI9o1IpYZqdjBWvKhRf.jpg'),
(233, 12214, 'Gillian Anderson', '/60fOJNhmfEmyskQDmHStSMHRjgK.jpg'),
(234, 1475239, 'Ncuti Gatwa', '/vLFh9kdB2G06ugwYmRNpxiXhbN0.jpg'),
(235, 2201315, 'Emma Mackey', '/tLkYW0FEKla2pfsk5pA4HgDLKCz.jpg'),
(236, 126169, 'Kedar Williams-Stirling', '/dhXjEwdKhhObMgU1Y8cA1MgZnUL.jpg'),
(237, 1880016, 'David Howard Thornton', '/z82y3Nxm7VZjfaMPMdUtbyoAyls.jpg'),
(238, 4479440, 'Allison Pittel', '/4UZqLYpcN3JCL8UCwdILLlGZ35k.jpg'),
(239, 3731720, 'Amy Schumacher', '/vysKhNOndWfZcxOxcj1KRDpvuOL.jpg'),
(240, 1863450, 'Jesse Posey', '/msNMmbFZwogwmjdKfBIR6jAC8eQ.jpg'),
(241, 54856, 'Jarlath Conroy', '/h1dpCoYDlAEKzovLavTvoVI4jFV.jpg'),
(242, 1331457, 'Sofia Carson', '/aQudxuIAd2UEGQD1YWsdrHH11Kc.jpg'),
(243, 3486663, 'Corey Mylchreest', '/nP7HMr5VLNLbHqKj0Sn0g9rIL4H.jpg'),
(244, 3882558, 'Esmé Kingdom', '/2rRLuJXKOJ3ONlwa2rUwzbplHWt.jpg'),
(245, 2104260, 'Harry Trevaldwyn', '/uYHekOiCHZoob1tW11vTceplA2e.jpg'),
(246, 15336, 'Dougray Scott', '/1fBd7n7s1Furk4kXN4YIcOD6mZb.jpg'),
(247, 3084, 'Marlon Brando', '/vklkhX4QlRKnEG8ylhWzoBdcuev.jpg'),
(248, 1158, 'Al Pacino', '/2dGBb1fOcNdZjtQToVPFxXjm4ke.jpg'),
(249, 3085, 'James Caan', '/v3flJtQEyczxENi29yJyvnN6LVt.jpg'),
(250, 3087, 'Robert Duvall', '/ybMmK25h4IVtfE7qrnlVp47RQlh.jpg'),
(251, 3086, 'Richard S. Castellano', '/1vr75BdHWret81vuSJ3ugiCBkxw.jpg'),
(252, 10297, 'Matthew McConaughey', '/lCySuYjhXix3FzQdS4oceDDrXKI.jpg'),
(253, 1813, 'Anne Hathaway', '/s6tflSD20MGz04ZR2R1lZvhmC4Y.jpg'),
(254, 3895, 'Michael Caine', '/bVZRMlpjTAO2pJK6v90buFgVbSW.jpg'),
(255, 83002, 'Jessica Chastain', '/xRvRzxiiHhgUErl0yf9w8WariRE.jpg'),
(256, 1893, 'Casey Affleck', '/304ilSygaCRWykoBWAL67TOw8g9.jpg'),
(257, 819, 'Edward Norton', '/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg'),
(258, 287, 'Brad Pitt', '/cckcYc2v0yh1tc9QjRelptcOBko.jpg'),
(259, 1283, 'Helena Bonham Carter', '/hJMbNSPJ2PCahsP3rNEU39C8GWU.jpg'),
(260, 7470, 'Meat Loaf', '/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg'),
(261, 7499, 'Jared Leto', '/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg'),
(262, 587506, 'Shameik Moore', '/mGF5ihrMt1MCxDvEOK2MO6YcNLt.jpg'),
(263, 130640, 'Hailee Steinfeld', '/ev7Vs8XdjehzAxlHIw4YB6FDTsM.jpg'),
(264, 226366, 'Brian Tyree Henry', '/1UgDnFt3OteCJQPiUelWzIR5bvT.jpg'),
(265, 141610, 'Luna Lauren Velez', '/98BvmTJCZHx0jPv0oNcv04Jkmfb.jpg'),
(266, 543505, 'Jake Johnson', '/3UNfW2qZgRkW81neNVfQvaRC92K.jpg'),
(267, 6193, 'Leonardo DiCaprio', '/wo2hJpn04vbtmh0B9utCFdsQhxM.jpg'),
(268, 24045, 'Joseph Gordon-Levitt', '/4U9G4YwTlIEbAymBaseltS38eH4.jpg'),
(269, 3899, 'Ken Watanabe', '/w2t30L5Cmr34myAaUobLoSgsLfS.jpg'),
(270, 2524, 'Tom Hardy', '/d81K0RH8UX7tZj49tZaQhZ9ewH.jpg'),
(271, 27578, 'Elliot Page', '/eCeFgzS8dYHnMfWQT0oQitCrsSz.jpg'),
(272, 190, 'Clint Eastwood', '/8TwdCfeOZH7ucRlfLZ6wObxa7cO.jpg'),
(273, 3265, 'Eli Wallach', '/gR13hoE24B072GrxwNPzSRKBulJ.jpg'),
(274, 4078, 'Lee Van Cleef', '/yQc5wjNCdRZzPp5E2wRPRYsEq9a.jpg'),
(275, 5813, 'Aldo Giuffrè', '/aT6eECl1R3YGYL4KatyIQrq0zG8.jpg'),
(276, 5814, 'Luigi Pistilli', '/bH5vmD2CMBHzJyBe0P0bL6iTUNL.jpg'),
(277, 5815, 'Rada Rassimov', '/xJhnSHn2vKp0MJ2KZaihrgqq0Mc.jpg'),
(278, 1077276, 'Enzo Petito', NULL),
(279, 1077277, 'Claudio Scarchilli', NULL),
(280, 5818, 'Antonio Casale', '/uAhNOD1ZA9Gh1CmCWkb4RRI1OKd.jpg'),
(281, 5817, 'Livio Lorenzon', '/AkIJIeGG2w0RIWejf6QoReu3ZhB.jpg'),
(282, 10859, 'Ryan Reynolds', '/l4t0lLxAKMOXG9zCHFQH4WyoQOO.jpg'),
(283, 6968, 'Hugh Jackman', '/4Xujtewxqt6aU0Y81tsS9gkjizk.jpg'),
(284, 2324569, 'Emma Corrin', '/wqGOVOsHzZaHeHymIS40elGCnY0.jpg'),
(285, 15576, 'Matthew Macfadyen', '/wjzFvujqF5KuHoIGLOjk6FCiSYJ.jpg'),
(286, 1464650, 'Dafne Keen', '/g325OIjIHrFr0te8ewPfhKQ2SKj.jpg'),
(287, 41688, 'Seth Gilliam', '/9CiWZNBysr4IiyERAYQFONqyTAQ.jpg'),
(288, 555249, 'Ross Marquand', '/2CxkVPimin0c2v7fUK3MGjgEnLt.jpg'),
(289, 1252310, 'Josh McDermitt', '/9K7zFdSRWMMDyf0UO7Kqx71S5fg.jpg'),
(290, 65640, 'Khary Payton', '/4PgEGuAb2KkaRb7P9PdK40pPeVH.jpg'),
(291, 111698, 'Cooper Andrews', '/uyvhcj3hrhCWqXmS4VSM36LhISt.jpg'),
(292, 3266, 'Joe Mantegna', '/4jzvAE6B1eoiZDUnDUuMazirCPP.jpg'),
(293, 15423, 'Paget Brewster', '/lpT3unm2LknRSNxCeu3fZByY29P.jpg'),
(294, 49706, 'Adam Rodriguez', '/qFSbLvyNPZK40hY9gZXJDvq0qVK.jpg'),
(295, 123727, 'Kirsten Vangsness', '/davwWkIDqUoVF28YmSAqpvUUFuS.jpg'),
(296, 17236, 'A. J. Cook', '/tvEjGDQVuu7jiOvWXwEU6tEE7NW.jpg'),
(297, 3972, 'Wentworth Miller', '/js09M98qo6rEyyIlTbRMI6XiZJH.jpg'),
(298, 10862, 'Dominic Purcell', '/30giDZ53c8f72pPbXCLK9xMSAnw.jpg'),
(299, 86468, 'Sarah Wayne Callies', '/uBtFalxNR1O0eARg0lsyLXkoJNG.jpg'),
(300, 17342, 'Paul Adelstein', '/jDa3EeyLb0blefoG1PKjcpPppjL.jpg'),
(301, 17345, 'Rockmond Dunbar', '/gim7zIrYkbKWsp2Kod7fp74fWyI.jpg'),
(302, 57208, 'Petchtai Wongkamlao', '/3hmcqU1OfLZ5kbvl7url63VuWMJ.jpg'),
(303, 1536084, 'Thiti Mahayotaruk', '/6Yo0eUXe9icC7WGST6GSsnLSM4x.jpg'),
(304, 4878122, 'Chingduang Duijkers', '/i4CetWHMrY9nbsffvNWNuq0Aw3C.jpg'),
(305, 4431452, 'Ophaphoom Chitapan', '/6OqRFUN8wIvlB5UPAdAh7k2tEnX.jpg'),
(306, 1070771, 'Nachat Juntapun', '/gGLRvWb2nsypCXyhneiNXs0xY2Y.jpg'),
(307, 1609347, 'Alex Høgh Andersen', '/kDO1gFqMnsV5gCQsMgEL9BZongX.jpg'),
(308, 1394429, 'Jordan Patrick Smith', '/bGPLRUkjCHm2j8VspCOgL6mti4b.jpg'),
(309, 1372317, 'Marco Ilsø', '/xfcrAKFHq81VVO9axg1zP8JrYCN.jpg'),
(310, 11263, 'Peter Franzén', '/8ltJpmctAnBxCuG725N2GclwWMZ.jpg'),
(311, 2074237, 'Georgia Hirst', '/7xHIjmpI4jWUfB1EFiTMtYzpVXM.jpg'),
(312, 6384, 'Keanu Reeves', '/8RZLOyYGsoRe9p44q3xin9QkMHv.jpg'),
(313, 2975, 'Laurence Fishburne', '/2GbXERENPpl5MmlqOLlPVaVtifD.jpg'),
(314, 530, 'Carrie-Anne Moss', '/gc7JwuLDD0kXHUlGx5vWzdlqSIT.jpg'),
(315, 1331, 'Hugo Weaving', '/t4ScpYIHlXVD41scEyiGdQDYflX.jpg'),
(316, 9364, 'Gloria Foster', '/AriGXtC9fjBOia9Zr8CZjn4o3rx.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `background_path` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `slug`, `logo_path`, `background_path`, `status`) VALUES
(3, 'Disney Pluss', 'disneyy', '1754703557_logo_Disney+_logo.png', '1754703557_bg_Collage-Credit-Whats-On-Disney-Plus.png', 1),
(4, 'Netflix', 'netflix', '1754703573_logo_Netflix-Logo.png', '1754703573_bg_TR-tr-20250721-TRIFECTA-perspective_ffcb28a9-c450-4ef3-8832-22d7bfe62b85_large.jpg', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_child` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `name`, `avatar`, `is_child`, `created_at`) VALUES
(6, 3, '1', '/assets/images/avatars/AAAABZAC833RzRB1ZfLsHGA2GD1IyonrM2cinbJMnJ2XjG_Y79o3Cjsz7R8Hpu2PCLTrZiDjDWGpV_MWm6A_Co2pWWlbOL_P5s2WuA.png', 0, '2025-08-28 18:47:19'),
(7, 3, '2', '/assets/images/avatars/AAAABW3udJs_t2LoJBBqQ2nicNqXdsOOV2NuAWzycYuMgNNjmRjXSgvrO4GcKFbAIapxNb2NVqFeCEMBtZh-0pmBXJ8ABU6SGA0S4w.png', 0, '2025-08-28 18:47:25'),
(8, 3, '3', '/assets/images/avatars/AAAABWgx7Fv60wMDzrlqiETFjooLaVueW2_jAuMwlcupE8vxB8-ofx-yVYfxXmuNvEIe3BN3bN7zcae9Dje8Couhl2dt__mb5xboOg.png', 0, '2025-08-28 18:47:38'),
(9, 9, 'ANA', '/assets/images/avatars/AAAABT9wBL4i4yFGrzSmwSuCMGZ3xf0v-MGTX2aBnMcKMXV-FF1FDo5jFK78YT6FubASMkAanbDSHqHHJLJfTyEVhlfrTnyYYULImQ.png', 0, '2025-08-30 21:21:08'),
(10, 22, 'ss', '/assets/images/avatars/AAAABTNxrMYx95Zi2mfmfaPMiF8ey2_mCKDUQBEelGKAtXySPB8Brc_rxK2O1shyW8PotbLrx6aKb9jWFBEomARoACKwnNBk10bMVA.png', 0, '2025-09-01 03:26:24');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profile_search_history`
--

CREATE TABLE `profile_search_history` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `search_query` varchar(255) NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profile_watch_history`
--

CREATE TABLE `profile_watch_history` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` enum('movie','tv_show') NOT NULL,
  `progress_seconds` int(11) DEFAULT 0,
  `finished` tinyint(1) NOT NULL DEFAULT 0,
  `last_watched_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `reason` text NOT NULL,
  `additional_info` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `profile_id`, `content_id`, `content_type`, `movie_id`, `episode_id`, `reason`, `additional_info`, `status`, `created_at`) VALUES
(2, 3, 6, 53, 'tv_show', NULL, NULL, 'subtitle_issue', 'ASDFASDFAF', 'resolved', '2025-08-30 17:35:46'),
(3, 3, 6, 22, 'movie', NULL, NULL, 'spam_or_misleading', 'SDFGSDFGSDFGSDFGSDFGSDFGSDFG', 'resolved', '2025-08-30 18:15:22'),
(4, 3, 6, 53, 'tv_show', NULL, NULL, 'subtitle_issue', 'sfggdfgdgdfgdfgdg', 'resolved', '2025-08-30 18:36:09'),
(5, 3, 6, 53, 'tv_show', NULL, NULL, 'spam_or_misleading', 'adsfasdfascsdvadadvadv', 'resolved', '2025-08-30 18:45:16'),
(6, 3, 6, 53, 'tv_show', NULL, NULL, 'wrong_content', 'dssdfgsdf', 'resolved', '2025-08-30 19:09:02'),
(7, 3, 6, 53, 'tv_show', NULL, NULL, 'audio_issue', 'sdfgsdfgsdfg', 'resolved', '2025-08-30 19:09:08'),
(8, 3, 6, 53, 'tv_show', NULL, NULL, 'subtitle_issue', 'asdfasdf', 'resolved', '2025-08-30 19:31:51'),
(9, 3, 6, 53, 'tv_show', NULL, NULL, 'audio_issue', 'sadfasdfs', 'resolved', '2025-08-30 19:31:58'),
(10, 3, 6, 53, 'tv_show', NULL, NULL, 'video_not_working', 'dfasdfasdf', 'resolved', '2025-08-30 19:32:04'),
(11, 3, 6, 22, 'movie', NULL, NULL, 'subtitle_issue', 'cvbcvbcbc', 'resolved', '2025-08-30 21:17:00'),
(12, 3, 6, 36, 'tv_show', NULL, NULL, 'subtitle_issue', 'fdghdfghdghdgh', 'resolved', '2025-08-31 03:50:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `requests`
--

INSERT INTO `requests` (`id`, `user_id`, `profile_id`, `title`, `type`, `poster_path`, `status`, `created_at`) VALUES
(1, 3, 6, 'The Walking Dead', 'tv_show', NULL, 'approved', '2025-09-01 20:26:23'),
(2, 3, 6, 'The Walking Dead: The Ones Who Live', 'tv_show', '/ywbacot78IuNhGW4uVZPxxxVTkm.jpg', 'approved', '2025-09-01 20:39:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seasons`
--

CREATE TABLE `seasons` (
  `id` int(11) NOT NULL,
  `tv_show_id` int(11) NOT NULL,
  `tmdb_season_id` int(11) DEFAULT NULL,
  `season_number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `air_date` date DEFAULT NULL,
  `episode_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `seasons`
--

INSERT INTO `seasons` (`id`, `tv_show_id`, `tmdb_season_id`, `season_number`, `name`, `overview`, `poster_path`, `air_date`, `episode_count`) VALUES
(262, 36, 88731, 1, 'Season 1', '', '/5BvFJfi3qBxTFaLKsft202YeqGl.jpg', '2019-12-20', 8),
(263, 36, 201716, 2, 'Season 2', 'Geralt embraces his destiny as he protects Ciri from the forces battling for control of the Continent — and from the mysterious power she possesses.', '/e4ALUvmGoQL1LhAwdc0ORs0BSd0.jpg', '2021-12-17', 8),
(264, 36, 338504, 3, 'Season 3', 'Destiny brought them together. Dangerous forces are trying to tear them apart. Geralt and Yennefer fight to keep Ciri safe as war brews on the Continent.', '/wgmaqKgweZA6AahZ95aioSRd1M6.jpg', '2023-06-29', 8),
(265, 36, 395146, 4, 'Season 4', '', NULL, NULL, 0),
(268, 40, 59499, 1, 'Season 1', 'By day, mild-mannered Dexter is a blood-spatter analyst for the Miami police. But at night, he is a serial killer who only targets other murderers.', '/rmhoMEHK3ZP2EAXX2VpxuKpW3Bf.jpg', '2006-10-01', 12),
(269, 40, 59500, 2, 'Season 2', 'In season two, the bodies of Dexter\'s victims are uncovered and an investigation is launched in Dexter\'s own department to find the killer, dubbed the \"Bay Harbor Butcher.\" Debra struggles to recover, and Rita sends Dexter to Narcotics Anonymous meetings when she suspects that he has an addiction. Sergeant James Doakes, stalks Dexter, suspecting that he is connected with the \"Ice Truck Killer\" killings.', '/t8o6P0pTsnfgsUo6AXSuaiw9fgG.jpg', '2007-09-30', 12),
(270, 40, 59502, 3, 'Season 3', 'After a runin with a man, Dexter initiates a friendship with his brother, Assistant District Attorney Miguel Prado. In the meantime, Rita discovers that she is pregnant, and Debra investigates the murders of a new serial killer, called \"The Skinner,\" hoping to gain a promotion to detective.', '/8zyoh0AtArOyTq0F2USckRGzZEU.jpg', '2008-09-28', 12),
(271, 40, 59504, 4, 'Season 4', 'Dexter as a father and husband struggles to figure out how to survive for years to come. He seeks to learn from Arthur Mitchell, a serial killer and family man, who has murdered for over thirty years without being discovered.', '/1Oh0QmXVTnyV9QqpDcEpvxtKYFw.jpg', '2009-09-27', 12),
(272, 40, 59506, 5, 'Season 5', 'In season five, Dexter comes to terms with the aftermath of the Season 4 finale, stopping a group of serial rapists and avoiding a corrupt cop who learns his deadly secret.', '/sKDHRvdaHfhiYzCFCXQoo1TuHhb.jpg', '2010-09-26', 12),
(273, 40, 59509, 6, 'Season 6', 'Season six follows Dexter\'s and Miami Metro\'s investigations into a string of bizarre ritualistic killings featuring overtly religious apocalyptic symbolism.', '/yxylCqF28NttybWJvQtHztTdDKr.jpg', '2011-10-02', 12),
(274, 40, 59510, 7, 'Season 7', 'Season seven follows Dexter\'s tangles with a Ukrainian mob boss and introduces Hannah McKay, a mysterious widow with a green thumb and a checkered past.', '/lM4EY2L324exlZ1hF2YpBM0a97J.jpg', '2012-09-30', 12),
(275, 40, 59512, 8, 'Season 8', 'As Deb struggles to deal with the consequences of her actions, a mysterious woman comes to work with Miami Metro, offering first-hand information on Dexter\'s past.', '/q8dWfc4JwQuv3HayIZeO84jAXED.jpg', '2013-06-30', 12),
(276, 41, 107288, 1, 'Season 1', 'Insecure Otis has all the answers when it comes to sex advice, thanks to his therapist mom. So rebel Maeve proposes a school sex-therapy clinic.', '/6Hj4vgnYC8ZVOGUQrETeQ807oxU.jpg', '2019-01-11', 8),
(277, 41, 136055, 2, 'Season 2', 'Otis finally loosens up—often and epically—but the pressure’s on to perform as chlamydia hits the school and mates struggle with new issues.', '/dPtbNSqIopLXzJTlGtKVMQyxBX8.jpg', '2020-01-17', 8),
(278, 41, 158823, 3, 'Season 3', 'Word of the \"sex school\" gets out as a new head teacher tries to control a rambunctious student body and Otis attempts to hide his secret hookup.', '/wMElvLI13E9dfeqmRB4Gdrrl0EK.jpg', '2021-09-17', 8),
(279, 41, 341784, 4, 'Season 4', 'With Maeve in America and Moordale closed, Otis must find his footing at free-spirited Cavendish College — but he\'s not the only sex therapist on campus.', '/pNpvCl4WNuEI7vGrgdDp8c30jKO.jpg', '2023-09-21', 8),
(287, 51, 7132, 1, 'Season 1', 'Lincoln Burrows is currently on death row and scheduled to die in a few months for an assassination his younger brother Michael is convinced he did not commit. With no other options and time winding down, Michael takes drastic measures to get himself incarcerated alongside his brother in Fox River State Penitentiary. Once he\'s inside, Michael, a structural engineer with the blueprints for the prison, begins to execute an elaborate plan to break Lincoln out and prove him innocent.', '/UeJcx1hV0gJkvZEvv7t6PjtBq2.jpg', '2005-08-29', 22),
(288, 51, 7133, 2, 'Season 2', 'In season two, Michael, Lincoln and six other inmates, including pickpocket Tweener and the mentally unstable Haywire, have ultimately escaped from Fox River. Once outside the prison walls, however, the escape truly begins as the convicts race for their lives while trying to avoid capture by the authorities. The pursuers are led by FBI agent Alexander Mahone, who is haunted by his own demons; vengeful prison guard Captain Brad Bellick, who, driven by his own personal vendetta, will also stop at nothing until the escapees are captured or killed; and Secret Service Agent Paul Kellerman, who, under President Reynolds\' orders, will do anything to keep the truth about the conspiracy very much a secret.', '/sRZyjc1BVnVFnTkeU33TG9C6Djd.jpg', '2006-08-21', 22),
(289, 51, 7134, 3, 'Season 3', 'Just when they thought they were out, they are pulled back in — for the most dangerous escape ever. Season three finds Michael Scofield wrongly incarcerated in Sona, a hellish Panamanian prison where there are no rules, no guards, and no escape.', '/vlEtqQFkz4oqXaKo5tQzR2gtmWw.jpg', '2007-09-17', 13),
(290, 51, 7136, 4, 'Season 4', 'After engineering a daring escape from the hellish, Panamanian prison Sona, brothers Michael Scofield and Lincoln Burrows are determined to seek justice against The Company, the shadowy group responsible for destroying their lives and killing the woman Michael loves, Dr. Sara Tancredi. Michael’s quest for vengeance leads him to Los Angeles, where his world is turned upside down when Company operative Gretchen/Susan B. Anthony informs him that Sara is still alive. Realizing the only way they will truly be free, Michael and Lincoln avow to find Sara and take down The Company. With the help of Homeland Security agent Don Self, they assemble a group of allies and familiar faces to accomplish their task: Mahone, Sucre, Bellick and computer expert Roland Glenn. Unfortunately for the brothers, they must also evade company assassin Wyatt and find an on-the-loose T-Bag. Michael and Lincoln soon discover the only thing harder than breaking out will be breaking in.', '/iPngrAzUJ6tilHiZLYUXAqmazsO.jpg', '2008-09-01', 22),
(291, 51, 75021, 5, 'Resurrection', 'Seven years later, thanks to an information provided by T-Bag, Lincoln and Sara discover that Michael is still alive in a Yemen prison, so they develop a plan to get him out.', '/1YwzKyKGen3498Ui2AjD9FUTkG2.jpg', '2017-04-04', 9),
(292, 52, 3624, 1, 'Season 1', 'Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros\' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.', '/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg', '2011-04-17', 10),
(293, 52, 3625, 2, 'Season 2', 'The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night\'s Watch.', '/9xfNkPwDOqyeUvfNhs1XlWA0esP.jpg', '2012-04-01', 10),
(294, 52, 3626, 3, 'Season 3', 'Duplicity and treachery...nobility and honor...conquest and triumph...and, of course, dragons. In Season 3, family and loyalty are the overarching themes as many critical storylines from the first two seasons come to a brutal head. Meanwhile, the Lannisters maintain their hold on King\'s Landing, though stirrings in the North threaten to alter the balance of power; Robb Stark, King of the North, faces a major calamity as he tries to build on his victories; a massive army of wildlings led by Mance Rayder march for the Wall; and Daenerys Targaryen--reunited with her dragons--attempts to raise an army in her quest for the Iron Throne.', '/5MkZjRnCKiIGn3bkXrXfndEzqOU.jpg', '2013-03-31', 10),
(295, 52, 3628, 4, 'Season 4', 'The War of the Five Kings is drawing to a close, but new intrigues and plots are in motion, and the surviving factions must contend with enemies not only outside their ranks, but within.', '/jXIMScXE4J4EVHUba1JgxZnWbo4.jpg', '2014-04-06', 10),
(296, 52, 62090, 5, 'Season 5', 'The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.', '/7Q1Hy1AHxAzA2lsmzEMBvuWTX0x.jpg', '2015-04-12', 10),
(297, 52, 71881, 6, 'Season 6', 'Following the shocking developments at the conclusion of season five, survivors from all parts of Westeros and Essos regroup to press forward, inexorably, towards their uncertain individual fates. Familiar faces will forge new alliances to bolster their strategic chances at survival, while new characters will emerge to challenge the balance of power in the east, west, north and south.', '/p1udLh0gfqyZFmXBGa393gk8go5.jpg', '2016-04-24', 10),
(298, 52, 81266, 7, 'Season 7', 'The long winter is here. And with it comes a convergence of armies and attitudes that have been brewing for years.', '/oX51n32QyHeFP5kErksemJsJljL.jpg', '2017-07-16', 7),
(299, 52, 107971, 8, 'Season 8', 'The Great War has come, the Wall has fallen and the Night King\'s army of the dead marches towards Westeros. The end is here, but who will take the Iron Throne?', '/259Q5FuaD3TNB7DGauTaJVRC8XV.jpg', '2019-04-14', 6),
(300, 53, 53334, 1, 'Season 1', 'Introducing the extraordinarily complex and violent world of the Norsemen, The History Channel\'s first scripted series races the gripping sagas of historical hero Ragnar Lothbrok. As claimed direct descendent of Odin, god of war and warriors, Lothbrok\'s mystical nature and devotion to the gods feeds his stealthy maneuvers and determination to become King of the Vikings.', '/uYaskJzmBhBdvkitDTjlH6gj9Pt.jpg', '2013-03-03', 9),
(301, 53, 53336, 2, 'Season 2', 'Season two brings crises of faith, of power, of relationships. Brothers rise up against one another. Loyalties shift from friend to foe, and unlikely alliances are formed in the name of supremacy. Ragnar’s indiscretions threaten his marriage to Lagertha, tearing him and his beloved son apart. Plots are hatched, scores are settled, blood is spilled…all under the watchful eyes of the gods.', '/g2Pgu5Dae9P99yJs0xZQtEagA76.jpg', '2014-02-26', 10),
(302, 53, 64422, 3, 'Season 3', 'With the promise of new land from the English, Ragnar leads his people to an uncertain fate on the shores of Wessex. King Ecbert has made many promises and it remains to be seen if he will keep them. But ever the restless wanderer, Ragnar is searching for something more … and he finds it in the mythical city of Paris.', '/jICv5UxLDvUqCp1D2jAb0PSJWAw.jpg', '2015-02-19', 10),
(303, 53, 72979, 4, 'Season 4', 'A ferocious battle between the Vikings and the French eventually comes down to Ragnar against Rollo. The outcome will seal the fate of the two brothers.', '/vDomkDsMrMFkTMIdzl6auzEDms7.jpg', '2016-02-18', 20),
(304, 53, 88459, 5, 'Season 5', 'Season five begins with Ivar the Boneless asserting his leadership over the Great Heathen Army, while Lagertha reigns as Queen of Kattegat. Ivar’s murder of his brother Sigurd sets the stage for vicious battles to come as Ragnar’s sons plot their next moves after avenging their father’s death. Bjorn follows his destiny into the Mediterranean Sea and Floki who is suffering from the loss of his wife Helga, takes to the seas submitting himself to the will of the Gods. This season is full of startling alliances and unbelievable betrayals as the Vikings fight to rule the world.', '/iOVC9GVEEVTGN3eYcDVkmDkOa11.jpg', '2017-11-29', 20),
(305, 53, 133827, 6, 'Season 6', 'The final season finds Bjorn now the king of Kattegat, while Ivar is a fugitive in Russia and Lagertha plans a peaceful retirement to a country farm.', '/3VsziFTocbNyGQjM2QNLJF41ccX.jpg', '2019-12-04', 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`) VALUES
(1, 'site_name', 'MuvixTV'),
(2, 'site_description', 'A great place to watch movies and TV shows.'),
(3, 'tmdb_api_key', '88c4b87bb42b453174d8e4cf9b5b7863'),
(4, 'logo_path', 'logo_1754964549_logo-1752450631.png'),
(5, 'favicon_path', 'favicon_1756509709_osimhene doping yapmak.jpg'),
(6, 'login_required', '1'),
(7, 'smtp_host', 'localhost'),
(8, 'smtp_port', '1025'),
(9, 'smtp_user', ''),
(10, 'smtp_pass', 'Ahmet4646.'),
(11, 'smtp_secure', ''),
(12, 'site_email', 'no-reply@muvixtv.com'),
(13, 'ads_network', 'admob'),
(14, 'admob_publisher_id', ''),
(15, 'admob_app_id', ''),
(16, 'admob_banner_ad_id', ''),
(17, 'admob_interstitial_ad_id', ''),
(18, 'admob_native_ad_id', ''),
(19, 'facebook_banner_ad_id', ''),
(20, 'facebook_interstitial_ad_id', ''),
(21, 'facebook_native_ad_id', ''),
(22, 'startapp_app_id', ''),
(23, 'adcolony_app_id', ''),
(24, 'adcolony_banner_zone_id', ''),
(25, 'adcolony_interstitial_zone_id', ''),
(26, 'unity_game_id', ''),
(27, 'unity_banner_zone_id', ''),
(28, 'unity_interstitial_zone_id', ''),
(29, 'custom_banner_url', ''),
(30, 'custom_banner_click_url_type', 'none'),
(31, 'custom_banner_click_url', ''),
(32, 'custom_interstitial_url', ''),
(33, 'custom_interstitial_click_url_type', 'none'),
(34, 'custom_interstitial_click_url', ''),
(35, 'applovin_sdk_key', ''),
(36, 'applovin_banner_id', ''),
(37, 'applovin_interstitial_id', ''),
(38, 'ironsource_app_key', ''),
(39, 'vortex_ad_key', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subtitles`
--

CREATE TABLE `subtitles` (
  `id` int(11) NOT NULL,
  `video_link_id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `type` varchar(10) DEFAULT 'vtt',
  `status` varchar(50) DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `subtitles`
--

INSERT INTO `subtitles` (`id`, `video_link_id`, `language`, `url`, `type`, `status`) VALUES
(3, 7, 's', 's', 'vtt', 'publish'),
(6, 11, 'TR', 'https://cdn.davaydavay.click/uploads/encode/2eonivl93qnhnxf8z3jx/2eonivl93qnhnxf8z3jx_tur.vtt', 'vtt', 'publish'),
(7, 13, 'TR', 'https://vs9.photoflax.org/v/Chernobyl.S01E01.WEB-DL.1080p.DUAL.x264-HDM/subtitle-tur-1.vtt', 'vtt', 'publish'),
(8, 25, 'sdfsd', 'sdfsdf', 'vtt', 'publish');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_shows`
--

CREATE TABLE `tv_shows` (
  `id` int(11) NOT NULL,
  `tmdb_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `backdrop_path` varchar(255) DEFAULT NULL,
  `logo_backdrop_path` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `first_air_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `trailer_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_count` int(11) NOT NULL DEFAULT 0,
  `creator` varchar(255) DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `instagram_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_shows`
--

INSERT INTO `tv_shows` (`id`, `tmdb_id`, `title`, `slug`, `overview`, `poster_path`, `backdrop_path`, `logo_backdrop_path`, `logo_path`, `first_air_date`, `status`, `trailer_key`, `created_at`, `view_count`, `creator`, `network`, `homepage`, `facebook_id`, `instagram_id`, `twitter_id`) VALUES
(36, 71912, 'The Witcher', 'the_witcher', 'Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.', '/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg', '/dQOphbONxlpPsKo30araFr0CYMO.jpg', '/wr4Sxvky6XzOE4KDj3UuEKgiSFj.jpg', '/x3uBgefbFC8blsE4Sbdi0m2a71d.png', '2019-12-20', 'Returning Series', 'eb90gqGYP9c', '2025-08-15 04:58:31', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 1405, 'Dexter', 'dexter', 'Dexter Morgan, a blood spatter pattern analyst for the Miami Metro Police also leads a secret life as a serial killer, hunting down criminals who have slipped through the cracks of justice.', '/q8dWfc4JwQuv3HayIZeO84jAXED.jpg', '/aSGSxGMTP893DPMCvMl9AdnEICE.jpg', '/5PBWovhpRsUeLMGBZIkacr9dp24.jpg', '/lAfyAdGWfBLQ6m7NPT7c3OSC2zW.svg', '2006-10-01', 'Ended', 'YQeUmSD1c3g', '2025-08-15 05:36:43', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 81356, 'Sex Education', 'sex-education', 'Inexperienced Otis channels his sex therapist mom when he teams up with rebellious Maeve to set up an underground sex therapy clinic at school.', '/bc3bmTdnoKcRuO9xdQKgAbB7Y9Z.jpg', '/u23G9KZregWHs1use6ir1fX27gl.jpg', '/jKbqVjCOOL2P8cP1VNxbC2h31Re.jpg', '/mN6B2kjX7XzIUvzfJXwgtNSWVUw.png', '2019-01-11', 'Ended', 'Hd2ldTR-WpI', '2025-08-16 00:11:16', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 2288, 'Prison Break', 'prison-break', 'Due to a political conspiracy, an innocent man is sent to death row and his only hope is his brother, who makes it his mission to deliberately get himself sent to the same prison in order to break the both of them out, from the inside out.', '/5E1BhkCgjLBlqx557Z5yzcN0i88.jpg', '/7w165QdHmJuTHSQwEyJDBDpuDT7.jpg', '/y2k3wNHAJ3Hvny3d1j9xcenBV3V.jpg', '/pX2ceIs6ZJIbYQKKQpk0bvqjUi2.png', '2005-08-29', 'Returning Series', 'AL9zLctDJaU', '2025-08-29 01:32:16', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 1399, 'Game of Thrones', 'game-of-thrones', 'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.', '/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg', '/2OMB0ynKlyIenMJWI2Dy9IWT4c.jpg', '/mufG2RtiUrWew3HkTnKetAcXDyl.jpg', '/6pObznbCoxVpY1lPQwJxETd7Phe.png', '2011-04-17', 'Returning Series', 'KPLWWIOCOOQ', '2025-08-29 03:05:29', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 44217, 'Vikings', 'vikings', 'The adventures of Ragnar Lothbrok, the greatest hero of his age. The series tells the sagas of Ragnar\'s band of Viking brothers and his family, as he rises to become King of the Viking tribes. As well as being a fearless warrior, Ragnar embodies the Norse traditions of devotion to the gods. Legend has it that he was a direct descendant of Odin, the god of war and warriors.', '/bQLrHIRNEkE3PdIWQrZHynQZazu.jpg', '/lHe8iwM4Cdm6RSEiara4PN8ZcBd.jpg', '/gNIwh41v7Pe8hwF8XEu5JdH4s6B.jpg', '/4GKqOzFXX8UXqmF5XzEO7AQlNqY.png', '2013-03-03', 'Returning Series', '7rcozIVtujw', '2025-08-29 23:51:38', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_cast`
--

CREATE TABLE `tv_show_cast` (
  `tv_show_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `cast_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_show_cast`
--

INSERT INTO `tv_show_cast` (`tv_show_id`, `person_id`, `character_name`, `cast_order`) VALUES
(36, 227, 'Geralt of Rivia', 0),
(36, 228, 'Yennefer of Vengerberg', 2),
(36, 229, 'Princess Cirilla \'Ciri\' of Cintra', 3),
(36, 230, 'Jaskier / The Sandpiper', 4),
(36, 231, 'Tissaia de Vries', 6),
(40, 193, 'Dexter Morgan', 0),
(40, 194, 'Debra Morgan', 2),
(40, 195, 'Thomas Matthews', 3),
(40, 196, 'Angel Batista', 4),
(40, 197, 'Harry Morgan', 5),
(41, 232, 'Otis Milburn', 0),
(41, 233, 'Jean Milburn', 1),
(41, 234, 'Eric Effiong', 2),
(41, 235, 'Maeve Wiley', 3),
(41, 236, 'Jackson Marchetti', 4),
(51, 297, 'Michael Scofield', 0),
(51, 298, 'Lincoln Burrows', 2),
(51, 299, 'Sara Tancredi', 3),
(51, 300, 'Paul Kellerman', 5),
(51, 301, 'Benjamin \'C-Note\' Franklin', 7),
(52, 198, 'Tyrion \'The Halfman\' Lannister', 0),
(52, 199, 'Jon Snow', 1),
(52, 200, 'Sir Jaime \'Kingslayer\' Lannister', 5),
(52, 201, 'Cersei Lannister', 6),
(52, 202, 'Daenerys Targaryen', 8),
(53, 307, 'Ivar Lothbrok / Ivar the Boneless', 1),
(53, 308, 'Ubbe Lothbrok', 3),
(53, 309, 'Hvitserk Lothbrok', 5),
(53, 310, 'King Harald Finehair', 9),
(53, 311, 'Torvi', 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_genres`
--

CREATE TABLE `tv_show_genres` (
  `tv_show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_show_genres`
--

INSERT INTO `tv_show_genres` (`tv_show_id`, `genre_id`) VALUES
(36, 4),
(36, 5),
(36, 6),
(40, 5),
(40, 9),
(40, 10),
(41, 5),
(41, 8),
(51, 5),
(51, 6),
(51, 9),
(52, 4),
(52, 5),
(52, 6),
(53, 5),
(53, 6),
(53, 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_networks`
--

CREATE TABLE `tv_show_networks` (
  `tv_show_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_platforms`
--

CREATE TABLE `tv_show_platforms` (
  `tv_show_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_show_platforms`
--

INSERT INTO `tv_show_platforms` (`tv_show_id`, `platform_id`) VALUES
(13, 3),
(13, 4),
(18, 3),
(18, 4),
(27, 3),
(27, 4),
(28, 3),
(28, 4),
(29, 3),
(29, 4),
(31, 3),
(31, 4),
(33, 3),
(33, 4),
(35, 3),
(35, 4),
(36, 3),
(36, 4),
(37, 3),
(37, 4),
(39, 3),
(39, 4),
(40, 3),
(40, 4),
(42, 3),
(42, 4),
(46, 3),
(46, 4),
(51, 3),
(51, 4),
(52, 3),
(52, 4),
(53, 3),
(53, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `1` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `token_expires_at` datetime DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `1`, `is_admin`, `is_verified`, `verification_token`, `token_expires_at`, `password_reset_token`, `reset_token_expires_at`, `created_at`) VALUES
(3, 'randomhesapgen@gmail.com', 'asdasd', '$2y$10$UC7dMoVKL63bMmx2r.vBM.pXYSlfIYSioRkb.4uYIDmTLrq6IWZRy', 0, 1, 1, NULL, NULL, '764023', '2025-09-01 05:07:31', '2025-07-28 18:31:10'),
(7, 'quarionmedia@gmail.com', 'fdfddf', '$2y$10$oBGtipc3q2e/vMn2GXG2XO.m7Udb0eAY0Jw8tjC4ohfdiuCjJBS3q', 0, 0, 0, NULL, NULL, NULL, NULL, '2025-07-28 20:26:04'),
(9, 'echoceviriekibi@gmail.com', 'crixised', '$2y$10$v.MdrF1hE25oQNwLSDL7ru3jqn9qXFXncGlLeSoGVk4lfJLZkaj3i', 0, 0, 1, NULL, NULL, NULL, NULL, '2025-08-30 21:20:52'),
(10, 'jaknkfjnsfd@gmail.com', 'nerkid', '$2y$10$0/JvxldwQjCmb40Z8hqgluHgmlL83ssfC4IG8PsXpF8Rd/X2l4QyG', 0, 0, 0, '42e8744969cebbe476652531a220b8c917c0d7cd289a862f5235034a0b9d90f1', '2025-08-31 00:44:11', NULL, NULL, '2025-08-30 21:44:11'),
(11, 'dsfgsdfgjd@gmail.com', 'furksıs', '$2y$10$ye8YBAZwRcIrbhJvAE/5sOt7qgyLdcDFAlkAIOwB01od4qjNJVmiO', 0, 0, 0, '579426', '2025-08-31 01:09:20', NULL, NULL, '2025-08-30 22:09:20'),
(12, 'afbsjhbdfgkjsbdf@gmail.com', 'dededed', '$2y$10$YlaqAW/QsgS3gz2PD62VK.RsdXqriBwhvDhkRGxGAnfWfPdIbxey6', 0, 0, 0, '187026', '2025-08-31 00:37:20', NULL, NULL, '2025-08-30 22:36:20'),
(13, 'njvnfjkgdnj@gmail.com', 'jnjnjknsdf', '$2y$10$iMJ82kM4anC8GDOX8TGZ/OjqlvInc0gixzwQXqsOBj6SWM2l24yXS', 0, 0, 0, '488421', '2025-08-31 00:50:56', NULL, NULL, '2025-08-30 22:49:56'),
(14, 'sdfgjksdfjg@gmail.com', 'Ahmet', '$2y$10$56hLSBo9d1p5Q.ERT8J4R.8m8FKV2s5uTWzG1kTzcfIwtl5nsViXq', 0, 0, 0, '356329', '2025-08-31 00:52:36', NULL, NULL, '2025-08-30 22:51:36'),
(15, 'sdfgsdf@gmail.com', 'Ahmett', '$2y$10$T03mNkiUgLBB6xar5/7XXe0a6IiE7Tgw6mO/.CQSmg1UkQifvj7Ce', 0, 0, 0, '848072', '2025-08-31 00:54:47', NULL, NULL, '2025-08-30 22:53:47'),
(16, 'asdnfjaksndf@gmail.com', 'ASdassssd', '$2y$10$eMlNiCDUzbavEvb7iQoiruaYavfhFm63OVmMShL3smTEuQ65dp9XG', 0, 0, 0, '646812', '2025-08-31 01:11:48', NULL, NULL, '2025-08-30 22:57:32'),
(17, 'sdfgsdfgsdfgs@gmail.com', 'sdgsdfgsdfgsdf', '$2y$10$M//t3lcokmE..HtRm0MXLO4s1DkoQr2ZGmPBC0jiRKw.a2Namv6R6', 0, 0, 0, '230121', '2025-08-31 05:13:09', NULL, NULL, '2025-08-31 03:12:09'),
(18, 'sgnjhdfngjbhdf@gmail.com', 'safasdfasdf', '$2y$10$QzlcLvKyhgRvp2rozD78GOAQ5Jwb4B.0lk0wTsRFJURYKguWff8d2', 0, 0, 0, '987420', '2025-08-31 05:14:50', NULL, NULL, '2025-08-31 03:13:50'),
(19, 'ttttututuutu@gmail.com', 'Aherer', '$2y$10$wUSdmyp6OaDiJGGwEK7SjeUYc3Krn//F22qW4YFNN6.NRjpNy.h.q', 0, 0, 0, '799096', '2025-08-31 05:55:30', NULL, NULL, '2025-08-31 03:54:30'),
(20, 'akjfnjdnfjnfnnn@gmail.com', 'akjfnjdnfjnfnnn', '$2y$10$85Vx/yuXP1SMei/KA.48culccTqLi5b13QdIYZKHU/c.i3WOgWKNq', 0, 0, 0, '824013', '2025-09-01 05:13:13', NULL, NULL, '2025-09-01 03:12:13'),
(21, 'cccccddcdc@gmail.com', 'cccccddcdc', '$2y$10$FvrK4Qe/HTuVdF0283H/u.hF0Qq69ftha6Ufg.3lNg.k/8eRn24V6', 0, 0, 1, NULL, NULL, NULL, NULL, '2025-09-01 03:14:30'),
(22, 'afsdfsdf33@gmail.com', 'afsdfsdf33', '$2y$10$o75mHnERlcrcOTHYNVaHAe4bLe9FQSah5w1ijhQf5GlSpBbv8myqm', 0, 0, 1, NULL, NULL, NULL, NULL, '2025-09-01 03:26:03');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `user_id`, `session_id`, `ip_address`, `user_agent`, `last_activity`) VALUES
(5, 3, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-28 00:44:31'),
(7, 9, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-30 21:20:52'),
(8, 13, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-30 22:51:15'),
(9, 14, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-30 22:53:28'),
(10, 15, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-30 22:54:48'),
(11, 9, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-31 02:23:31'),
(12, 3, 'c46q8vmf4b4f917t917t0og70q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-31 02:27:32'),
(13, 3, 'ilnl4487cn60ean5rrhqlg7r4b', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-08-31 03:53:35'),
(14, 9, 'jkriedes8sar33ib1rk3v500qe', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-01 03:11:43'),
(15, 21, 'jkriedes8sar33ib1rk3v500qe', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-01 03:15:00'),
(16, 22, 'jkriedes8sar33ib1rk3v500qe', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-01 03:26:19'),
(17, 3, 'fnk04et6lc1rm8nqlhq0pfeqc1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', '2025-09-01 03:30:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_watchlist`
--

CREATE TABLE `user_watchlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `content_type` enum('movie','tv_show') NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `user_watchlist`
--

INSERT INTO `user_watchlist` (`id`, `user_id`, `profile_id`, `content_type`, `content_id`, `created_at`) VALUES
(108, 3, 6, 'tv_show', 51, '2025-08-29 01:46:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `video_ads`
--

CREATE TABLE `video_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Örn: Ana Preroll Reklamı',
  `type` enum('preroll','midroll','postroll','pauseroll') NOT NULL,
  `vast_url` text NOT NULL COMMENT 'Reklam sunucusundan gelen VAST URLsi',
  `offset_time` varchar(50) DEFAULT NULL COMMENT 'Sadece midroll için (örn: 600 veya 25%)',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `video_ads`
--

INSERT INTO `video_ads` (`id`, `name`, `type`, `vast_url`, `offset_time`, `is_active`, `created_at`) VALUES
(8, '22', 'preroll', 'https://pubads.g.doubleclick.net/gampad/ads?iu=/21775744923/external/single_preroll_skippable&sz=640x480&ciu_szs=300x250%2C728x90&gdfp_req=1&output=vast&unviewed_position_start=1&env=vp&impl=s&correlator=', NULL, 1, '2025-08-20 16:00:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `video_links`
--

CREATE TABLE `video_links` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `link_type` varchar(50) DEFAULT 'stream',
  `status` varchar(50) DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `video_links`
--

INSERT INTO `video_links` (`id`, `movie_id`, `episode_id`, `label`, `quality`, `size`, `source`, `url`, `link_type`, `status`) VALUES
(3, 9, NULL, '', '', '', 'Youtube', '2', 'stream', 'publish'),
(7, NULL, 2468, '', '', '', 'Youtube', 'ss', 'stream', 'publish'),
(9, NULL, 2475, 's', '', '', 'Youtube', 's', 'stream', 'publish'),
(10, 8, NULL, 'ss', '', '', 'Youtube', 'ss', 'stream', 'publish'),
(11, 33, NULL, 'Türkçe', '1080p', '', 'M3u8_From_Url', 'https://vs10.photoflix.org/v/Savage.Salvation.2022.WEB-DL.1080p.DUAL.H.264-HDM/master.m3u8', 'stream', 'publish'),
(14, NULL, 3866, '2', '', '', 'M3u8_From_Url', 'https://vs10.photoflix.org/v/Savage.Salvation.2022.WEB-DL.1080p.DUAL.H.264-HDM/master.m3u8', 'stream', 'publish'),
(17, 36, NULL, '', '', '', 'M3u8_From_Url', 'https://s17.imglink.pro/mt/ITu1ozEypzWioUEmYwVjZwHhI0IPYHEZYwRjBQOjYxEIDHjhFP4lAwDgFREAd0zxnJ1aoTyhnl5jpz8s0xi17vr1', 'stream', 'publish'),
(18, NULL, 0, '1', '', '', 'M3u8_From_Url', 'https://s17.imglink.pro/mt/ITu1ozEypzWioUEmYwVjZwHhI0IPYHEZYwRjBQOjYxEIDHjhFP4lAwDgFREAd0zxnJ1aoTyhnl5jpz8s0xi17vr1', 'stream', 'publish'),
(19, NULL, 0, '1', '', '', 'M3u8_From_Url', 'https://s17.imglink.pro/mt/ITu1ozEypzWioUEmYwVjZwHhI0IPYHEZYwRjBQOjYxEIDHjhFP4lAwDgFREAd0zxnJ1aoTyhnl5jpz8s0xi17vr1', 'stream', 'publish'),
(21, NULL, 0, '', '', '', 'M3u8_From_Url', 'https://srv12.cdnimages71.sbs/hls/missionimpossible-thefinalreckoning-2025-webmp4-eNFA484EZT6.mp4/txt/master.txt', 'stream', 'publish'),
(24, NULL, 3865, '', '', '', 'M3u8_From_Url', 'https://hdplayersystem.live/cdn/hls/e4ced7fd74aad14be897cc60e559b05c/master.txt', 'stream', 'publish'),
(25, 39, NULL, '', '', '', 'Youtube', 'k', 'stream', 'publish'),
(27, NULL, 0, 'asdsfas', 'dfadfsasf', 'asddfsadf', 'Dailymotion', 'adfsfasdf', 'stream', 'publish'),
(28, NULL, 4199, 'asdfasdf', 'sadfasdf', 'asdfsadf', 'Youtube', 'sadfsadf', 'stream', 'publish'),
(29, 39, NULL, 'DFGSFDGS', 'SDFGSDFGS', 'DFGSDFGS', 'Youtube', 'DFGSDFGDFG', 'stream', 'publish');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id_index` (`parent_id`),
  ADD KEY `fk_comments_profile` (`profile_id`);

--
-- Tablo için indeksler `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_comment_unique` (`user_id`,`comment_id`);

--
-- Tablo için indeksler `content_networks`
--
ALTER TABLE `content_networks`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_name` (`template_name`);

--
-- Tablo için indeksler `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_episode_id` (`tmdb_episode_id`),
  ADD KEY `season_id` (`season_id`);

--
-- Tablo için indeksler `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_genre_id` (`tmdb_genre_id`);

--
-- Tablo için indeksler `homepage_sections`
--
ALTER TABLE `homepage_sections`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_id` (`tmdb_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Tablo için indeksler `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`movie_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Tablo için indeksler `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Tablo için indeksler `movie_networks`
--
ALTER TABLE `movie_networks`
  ADD PRIMARY KEY (`movie_id`,`network_id`);

--
-- Tablo için indeksler `movie_platforms`
--
ALTER TABLE `movie_platforms`
  ADD PRIMARY KEY (`movie_id`,`platform_id`);

--
-- Tablo için indeksler `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_person_id` (`tmdb_person_id`);

--
-- Tablo için indeksler `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Tablo için indeksler `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `profile_search_history`
--
ALTER TABLE `profile_search_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Tablo için indeksler `profile_watch_history`
--
ALTER TABLE `profile_watch_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_history_item` (`profile_id`,`content_id`,`content_type`);

--
-- Tablo için indeksler `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_report_profile` (`profile_id`);

--
-- Tablo için indeksler `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id_idx` (`profile_id`);

--
-- Tablo için indeksler `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_season_id` (`tmdb_season_id`),
  ADD KEY `tv_show_id` (`tv_show_id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Tablo için indeksler `subtitles`
--
ALTER TABLE `subtitles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tv_shows`
--
ALTER TABLE `tv_shows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_id` (`tmdb_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Tablo için indeksler `tv_show_cast`
--
ALTER TABLE `tv_show_cast`
  ADD PRIMARY KEY (`tv_show_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Tablo için indeksler `tv_show_genres`
--
ALTER TABLE `tv_show_genres`
  ADD PRIMARY KEY (`tv_show_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Tablo için indeksler `tv_show_networks`
--
ALTER TABLE `tv_show_networks`
  ADD PRIMARY KEY (`tv_show_id`,`network_id`);

--
-- Tablo için indeksler `tv_show_platforms`
--
ALTER TABLE `tv_show_platforms`
  ADD PRIMARY KEY (`tv_show_id`,`platform_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_content_unique` (`user_id`,`content_type`,`content_id`),
  ADD KEY `fk_watchlist_profile` (`profile_id`);

--
-- Tablo için indeksler `video_ads`
--
ALTER TABLE `video_ads`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `video_links`
--
ALTER TABLE `video_links`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `content_networks`
--
ALTER TABLE `content_networks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4361;

--
-- Tablo için AUTO_INCREMENT değeri `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `homepage_sections`
--
ALTER TABLE `homepage_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Tablo için AUTO_INCREMENT değeri `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- Tablo için AUTO_INCREMENT değeri `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `profile_search_history`
--
ALTER TABLE `profile_search_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `profile_watch_history`
--
ALTER TABLE `profile_watch_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Tablo için AUTO_INCREMENT değeri `subtitles`
--
ALTER TABLE `subtitles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `tv_shows`
--
ALTER TABLE `tv_shows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `user_watchlist`
--
ALTER TABLE `user_watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- Tablo için AUTO_INCREMENT değeri `video_ads`
--
ALTER TABLE `video_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `video_links`
--
ALTER TABLE `video_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `profile_search_history`
--
ALTER TABLE `profile_search_history`
  ADD CONSTRAINT `fk_search_history_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `profile_watch_history`
--
ALTER TABLE `profile_watch_history`
  ADD CONSTRAINT `fk_history_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_report_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `seasons`
--
ALTER TABLE `seasons`
  ADD CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_shows` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `tv_show_cast`
--
ALTER TABLE `tv_show_cast`
  ADD CONSTRAINT `tv_show_cast_ibfk_1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_shows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tv_show_cast_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `tv_show_genres`
--
ALTER TABLE `tv_show_genres`
  ADD CONSTRAINT `tv_show_genres_ibfk_1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_shows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tv_show_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD CONSTRAINT `fk_watchlist_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
