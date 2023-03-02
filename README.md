# AiweApps_test
Getting json from api, parsing, writing and reading from CoreData 

ТЗ:
C использованием любой известной технологии хранения данных и удобного языка программирования, будь то Android c SQLite, PHP с MySQL, Node.js c Mongo DB, и т.п. реализовать:
Bеб страницу(любой single page) с двумя кнопками - Parse и Show
При нажатии на первую кнопку нужно загрузить json с информацией об криптовалютах, с использованием следующего API: https://api.coingecko.com/api/v3/global
из которого нужно получить market_cap_percentage и записать записать в БД id криптовалюты (например "btc") и ее текущее процентное значение(62.572660449574094).
по кнопке show выводим то, что есть из бд в таблицу на экран.
