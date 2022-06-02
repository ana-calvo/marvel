# marvel

### Description
This project is an app that fetches data from the Marvel API to display a list of characters and some of their details.
It has been built in Swift using a MVP architecture pattern.


### Comments
Since the character details data were contained as well in the array of characters (fetched from the first request), there's no request to ``` v1/public/characters/{characterId} ```.
The data is passed directly through an object from one controller to the next one. But instead, there're a few requests more in order to get some other information about comics, events, series and stories of each character.
