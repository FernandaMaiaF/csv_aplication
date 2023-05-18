# csv_aplication

An exercise that contains two aplications, one with a simple app that get a word and send using http get. 
And the other recieve that word from the app and check if it exist in any file inside the organizations folder.  

# Intructions:

You need to implement 2 applications:
1. A file processing system that counts the occurrences of a specific word in each file.
The program should be able to process multiple text files concurrently, be accessible
via HTTP requests, receive a word as a HTTP parameter and return the request with
the number occurrences.
2. A simple application to consume this API and present the results (a html page, a
console app, etc) where the user can input a word to be sent in the HTTP request.
Guidelines:
- The program can be written in the programming language of your preference.
- Record a video with the solution working.
- Create a github public repository to store your source code and send the repository
link and video in the answer email.
- In the Readme.md of your repository, document your development process.
- The files to be used in application 1 are attached in the email and must be placed
inside the application but ignored in the repository.

# Development process:

Initially I was thinking about doing it all using php, but as it was going I decided that it woudn't change much regarding the time that I had and I am more used to handle the requests in that way.

I started doing the function in backend testing on localhost link. As i was thinking what would be the better way to read the csv files i decided not to declare them and consider that i would look for the word in every file that exist inside a folder on the project, that i called organizations using the name of the file it self. 

I am more used to use frameworks with projects, so to make this request i declared on the top and set a static behavior to complete the exercise. After that i devided in three functions that i wanted to work with, 
* actionFindOcurrency: recieve the word and when called it would return the ocurrency of the word;
* findWord: recieve the word and go into every file that the function getFiles returns and count the ocurrency of the selected word adding the result of each file count;
* getFiles: it goes into the organizations folder path and add te relative path of each file on a array;

In the frontend I created a simple aplication using flutter that recieve a word and on the provider send it calling the function from the backend. 

I was having some doubt regarding witch validations should i include but in orther to make it simple i decided to simply make it work and continue confident about the deliverd time. 

I unziped the files, so when i was doing the commit apperd the message "Large files detected. You may want to try Git Large File Storage". When that happend i changed the code to rad a zip file insted of the csv.

# How to run the code:

clone this repository on your localhost path, this part is necessary for the request on the FLutter aplication to work. 

go inside the test_app folder and start the aplication. 