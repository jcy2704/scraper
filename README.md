<p align="center">
  <a href="https://github.com/jcy2704/">
    <img src="https://res.cloudinary.com/growsurf-prod/image/upload/v1582211139/production/gnysw2objzekbagrqiax.png" alt="Logo" width="350" height="70">
  </a>
</p>

<h1 align="center">E-Commerce Scraper</h1>

<p align="center">
  <strong>Project created by Steven Jack Chung</strong>
  <br>
  It was based on a Capstone project for the Ruby Module in Microverse
</p>

<p align="center">
  <a href="https://github.com/jcy2704/scraper/issues">
    <img src="https://img.shields.io/badge/REPORT%20A%20BUG-purple?style=for-the-badge">
  </a>
   ‎ ‎ ‎ ‎
  <a href="https://github.com/jcy2704/scraper/issues">
    <img src="https://img.shields.io/badge/Request%20a%20feature-purple?style=for-the-badge">
  </a>
</p>

## Table of Contents
- [⚒️ Scraper](#️-scraper)
- [📐 About The Project](#-about-the-project)
- [📝 Usage Instructions](#-usage-instructions)
- [![Ruby](https://cdn.emojidex.com/emoji/px16/Ruby.png) Built With](#built-with)
- [🖥️ Setup for starting the Scraper](#️-setup-for-starting-the-scraper)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [💻 Run Scraper](#-run-scraper)
  - [Windows](#windows)
  - [Mac and Linux](#mac-and-linux)
- [⚗️ Test Code with Rspec](#️-test-code-with-rspec)
- [📶 Live Preview](#live-preview)
- [👥 Author](#-author)
- [🤝 Contributing](#-contributing)
- [⭐ Show your support](#-show-your-support)

## ⚒️ Scraper
Originally, a **scraper** is a tool used to extract something on a surface, for example, a chewing gum from the floor. However, in this case we are using a Web Scraper. A **Web Scraper** or **Web Crawler**, is used to extract bits of information from a website to analize them.

<hr>

## 📐 About The Project
I created this basic web scraper to get information from products in an e-commerce website.
I used https://helmboots.com for this project.

The scraper has a basic interface that runs in the terminal.

The goals of this project is to show mastery in:

- **OOP (Object Oriented Programming)** using Ruby.
- **Create and structure** a Ruby project from previous knowledge.
- **Managing the files** with correct usage to make code maintainable.
- **Git Flow and Github Flow** creating branches for different features and for version control.
- **Rspec** for testing parts of the code.

## 📝 Usage Instructions

Once you run the scraper on the terminal, wait for the scrape to finish and select what you want to do when it shows prompt for the menu in the terminal.

For example:
```
Added 50 products.

1. Show all Products
2. Products by Price
3. Exit

What would you like to do?
1
...
```

- **Option 1.** Will show a formatted list with all the products and prices as well as if the product is on sale or not.
- **Option 2.** Will ask you to input a minimum price and it will show results starting from the minimum price.

For example:
```
Please input your minimum price.
250

Product: ...
Price: $250
Sale: Yes

Product: ...
Price: $300
```

- After finishing showing the results it will prompt the menu once again so you can choose what you want to do.
- **Option 3.** Will exit the program.

```
1. Show all Products
2. Products by Price
3. Exit

What would you like to do?
3

Have a nice day! :D
```

**Enjoy!!**

## Built With

- [Ruby ![Ruby](https://cdn.emojidex.com/emoji/px16/Ruby.png)](https://www.ruby-lang.org/en/)


## 🖥️ Setup for starting the Scraper

To get a local copy up and running follow these simple example steps.

### Prerequisites
Computer running Mac OS, Windows, or Linux Ubuntu.
Internet browser: Firefox, Google Chrome, Opera...

Have Ruby installed you can see this link for more detailed instructions [Install Ruby](https://www.theodinproject.com/courses/ruby-programming/lessons/installing-ruby-ruby-programming)

### Installation

You MUST have Ruby installed in your system. If you don't have it installed you can go this page [Install Ruby](https://www.theodinproject.com/courses/ruby-programming/lessons/installing-ruby-ruby-programming)

After installing ruby, you can download the repo or clone it (paste on the terminal) `git clone https://github.com/jcy2704/scraper.git`

## 💻 Run Scraper
You will need to execute the scraper file located inside the bin folder. If you are using Window, follow next step.

### Windows

Open the terminal and navigate to the folder using `cd path-to-folder` containing the scraper files. Once you are inside, your terminal should look like this: User/<folder>/scraper/. You can type or paste this on terminal `bin/scraper.rb` to run the program.

### Mac and Linux

Most Mac and some of Linux computers come with ruby installed, but still need to verify by typing in your terminal `ruby --version` if not please go back to [Installation](#installation) section.

After verifying you have ruby installed and completing the [Installation](#installation) section, open the terminal navigate using `cd path-to-folder` containing the tic-tac-toe game and run in the terminal `bin/scraper.rb` to run the game.

## ⚗️ Test Code with Rspec

To be able to test your code with Rspec, you should have Ruby and Rspec installed in your computer. To install rspec type in your terminal `gem install rspec`. After installing rspec, just got to the project folder and run `rspec` in the terminal.

### 📶 Live Preview
[Scraper](https://repl.it/@jcy2704/scraper#bin/scraper.rb)

**Enjoy our project!!**

## 👥 Author

👤 **Steven Jack Chung**

- GitHub: [@jcy2704](https://github.com/jcy2704)
- Twitter: [@yiak_](https://twitter.com/yiak_)
- LinkedIn: [Steven Jack Chung](https://linkedin.com/in/stevenjchung)
- Gmail: [Steven Jack Chung](mailto:stevenjchung12@gmail.com)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jcy2704/scraper/issues).

## ⭐ Show your support

Give a ⭐️ if you like this project!
