import Foundation

struct EventPoint {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }
}

//"features": [
//      {
//         "attributes": {
//            "ID": 207276,
//            "name": "Člověk, smrtelná osobnost a nesmrtelné jádro",
//            "text": "Srdečně zveme veřejnost na přednášku.Zkoumání cesty sebeobjevení.Transformace vědomí.Příběh o obyvateli nesmrtelného domu – na motivy knihy Jan Naposlednarozený.Jan Naposlednarozený je příběh jednoho mladého muže, který zdědil venkovský statek, k němuž se váže zvláštní příkaz. Ten je následující:Změň dům podle původního plánu znění,prostorům všem je třeba obnovení.Na první pohled to vypadá jako jednoduchý úkol, avšak když se Jan plný elánu do toho pustí, nemá ještě nejmenší tušení, jaké dalekosáhlé následky to bude mít.Jan Naposlednarozený je symbolické vyprávění a rovněž jméno je symbolický vzor. Ale může to být příběh každého, kdo je odhodlán a připraven od základu opravit a obnovit svůj život a zaměřit se na siločáry toho Jediného Světla.",
//            "tickets": "Zdarma - ",
//            "tickets_info": null,
//            "images": "https://www.gotobrno.cz/wp-content/uploads/2017/07/brno-panorama.jpg",
//            "url": "https://www.gotobrno.cz/akce/clovek-smrtelna-osobnost-a-nesmrtelne-jadro/",
//            "categories": "Veletrhy / vzdělávací",
//            "organizer_email": "kancelar.rosicrucianum@gmail.com",
//            "tickets_url": null,
//            "latitude": 49.1939516194948,
//            "longitude": 16.6125339456698,
//            "date_from": 1698796800000,
//            "date_to": 1698796800000,
//            "first_image": "https://www.gotobrno.cz/wp-content/uploads/2017/07/brno-panorama.jpg"
//         },
//         "geometry": {
//            "x": 16.612533945669817,
//            "y": 49.19395161949479
//         }
