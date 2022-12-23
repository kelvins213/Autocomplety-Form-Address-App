# Autocomplete Form Adress With Flutter

Hey, guys! Thanks for reading.


## Context
I'm currently developing an app with my team, which will be usefull for studying stuff, like reviewing or learning a new subject. That said, in the past few days, we were dealing mainly with the backend on ```flutter```. So, I was given the task to connect ```APIs``` in a form which will register the student adress, like state, city and postcode (CEP; CEDEX; zip-code). My idea was to use an api which could provide all the information I needed based on the student's postcode - so the form would automatically fullfill his camps for the user - and another API to store the data inputted on the form by his conclusion.  


<div>
  <img src="https://user-images.githubusercontent.com/103438311/209247577-9864a5e7-8d8f-46dc-958a-d080c5645338.png">
</div>


## Explanation
In order to implement, I created a submit button, which when pressed, will check if the postcode camp is already fulfilled by the user. If so, the application sends by parameter the postcode for the ```Postcode API```, and then, if the postcode is valid, the API will return a ```JSON``` with the information about the state, city, street, and additionals from the user address, based on the postcode sent by parameter. That said, this json will be used to complete almost every forms’ camp automatically within the code. Then, when the user finishes with the camps, the application sends the data for ```my nodeJS API```, which will ```store``` them on my ```MongoDB``` collection;


The Postcode API base url is ```viacep.com.br```, and when you add the path ```/ws/$cep/json/``` on it, inside a http.get() query, like ```http.get('viacep.com.br/ws/$cep/json/')```, the query result will return the json I've just said, with all adress data. Once finished 
the form, the app queries to my ```nodeJS API```, by the ```route "/insertAdress/:country/:state/:city/:cep/:neighborhood/:street/:number"```,
which ```insert the data on MongoDB.```

[comment]: <> (you must add the app video here, who going to show how it's working)

## Conclusion
The task has deeply opened my mind, because, now, ```I know``` how to use a ```public API```, which could give us important data for free, usually required for our application to work properly. Besides, I also got how the programming languages could be put together. My nodeJS API, for example, was made with ```Javascript```, meanwhile, the application with ```Flutter```, and they’re all ```connected``` now! Finally, I also noticed how the programming has been divided, like, FRONT, BACK and API. Therefore, we can have different teams working on them, without having conflicts with each other.


[comment]: <> (Postcode route API: ```https://viacep.com.br/ws/$cep/json/```)
[comment]: <> (Store Adress API: ```https://replit.com/@fhyvugvfjudgf/locationapi```)
