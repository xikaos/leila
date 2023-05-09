# leila

![leila-running](https://user-images.githubusercontent.com/3723250/236971888-c2897af5-634d-429c-8e32-3509cb6662d4.gif)

## Context
Back in the day, I used to buy MTG physical cards. One of the best places to buy Magic cards in Brazil is the [Ligamagic](https://www.ligamagic.com.br/) marketplace. They allow stores to sell cards to customers and also allow players to sell cards through auctions.

Searching for the same cards everyday using their UI was taking some precious time so I hacked my way trough improving that process.

## Objective
The main objective of this project is to print the existing auctions for the cards I wanted to buy on my terminal.

## Learning Objectives
I remember that back in the day, the main learning objective was learning how to perform HTTP requests, parse HTML and extract data from it using Ruby.

After 7 years, I decided to refactor the project to see how much I could improve it. Also, I would like to work on a Ruby project to see if my perspective of it changed after all that time. I will share my conclusion in the appropriate section.

## Up and Running
### Setup
1. Make sure you have Ruby 3.0^ installed.
2. Clone the project repo.
3. Navigate to the project main folder.
4. Run `bundle install`.

### Running the tests
Run `rspec`.

### Usage
1. Declare the cards you want to search in the `cards.txt` file inside the project main folder.
2. Run `ruby leila.rb`.

## Conclusion
Regarding the refactor, I think I did a good job at extracing a lot of the concerns in the main script into different modules/classses. Now it's much easier to reason about what is going on in the main script and it made automated testing possible.

I didn't implement a full integration test but having that small experience with rspec unit tests and Github Actions was really cool.

Regarding the language, I always loved Ruby. Back in the day, even tough I was not really aware about the language driving principles (DX, conciseness, etc), programming in it always felt natural. After refactoring the project, I actually felt the same way! It feels like the language is doing everything it can to make you help you get where you need very efficiently.

Coming from a PHP background, I can say that after types were introduced in parameter/return types in the language, it felt *weird* to not type my parameters and method returns. I felt the same with Ruby. Duck-typing feels very productive and removed a lot of verbosity in the code, but having types explicitly declared brings me a sense of (false?) security.

Even tought it's a small personal project, I tracked most of the necessary improvements in Github Issues and used Pull Requests to close them. It felt good to close some issues with merges in my free time and see that I was making progress towards the project completion.

As a closing tought, It was really good to take an old project from my Github and improve it. I would definitively recommend it for anyone without ideas for new projects (not my case, but...) or if you want to see how much you improved over the time.

I'm putting this project on the shelf again with a silly sense of accomplishment. I really improved my programming skills and vision a lot in the last years and I'm definitively happy about that.

