# RestfulNewsAPI
## Client
- Web and mobile
- Created using Flutter
- Deployed using Firebase Web Hosting: https://firebase.google.com/docs/hosting

### Firebase:
- The web version of this project is available at: https://news-api-client-767e9.web.app/ 

## Server
- Created using Spring Boot: https://spring.io/projects/spring-boot
- Deployed using Heroku (PaaS): https://www.heroku.com/platform

### Heroku:
- BaseUrl: https://news-api-server.herokuapp.com
- Method: get
- Endpoints: /source, /category
- Query key parameters: source, category 
- Query value options for source: CNN, CBC-NEWS, NBC-NEWS, GOOGLE-NEWS, THE-WASHINGTON-POST, USA-TODAY
- Query value options for category: business, entertainment, politics, science, sports, technology
  - `ex) https://news-api-server.herokuapp.com/source?source=CNN`

### Original Resource: 
- BaseUrl: https://newsapi.org/v2/top-headlines
- Method: get
- Query parameters: sources, q, language, country, category
  - `ex) https://newsapi.org/v2/top-headlines?apiKey=qwerty&category=entertainment` 

## Running the Project Locally
- Clone the project

## Client
- In the project folder `cd Client/NewsApplication/`
- Ensure you have flutter correctly installed, run `flutter doctor -v`
- To see a list of available devices run `flutter devices`
- To run the application, execute `flutter run -d <device name>` 
  - ex) `flutter run -d chrome`
- Alternatively, you can run the application using Android Studio

## Server
- In the project folder `cd Server/NewsAPI/`
- To run the application as an executable jar file, run:
  - `gradle clean`
  - `gradle build`
  - `cd build/libs/`
  - `java -jar <war file name>.war`
- Local baseUrl: http://localhost:8080
- Alternatively, you can run the application using IntelliJ

## Client and Server
- To run the project as a whole:
  - Run the server, the default port should be 8080
  - In the Client/NewsApplication/lib/utils/constants.dart file, update the `BASE_URL` to `localhost:8080`
  - In the Client/NewsApplication/lib/Services/news_response_service.dart file, change the endpoints to use `Uri.http` instead of `Uri.https`
  - Run the client
