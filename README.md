# Traveller - Capstone Project for Ruby on Rails module

> App to share opinions about traveling destinations with people who follow you. The project is built for the Ruby on Rails capstone based on a redesign of Twitter.

<div style="display: flex; flex-wrap: wrap">
<div align="center">
  <img src="image/01_welcome.png?raw=true" width="40%" height="auto"/>
  <img src="image/02_sign_up.png?raw=true" width="40%" height="auto"/>
</div>

<div align="center">
  <img src="image/03_home.png?raw=true" width="40%" height="auto"/>
  <img src="image/04_profile.png?raw=true" width="40%" height="auto"/>
</div>

<div align="center">
  <img src="image/05_edit.png?raw=true" width="40%" height="auto"/>
  <img src="image/06_profile_2.png?raw=true" width="40%" height="auto"/>
</div>
</div>

## Built With

- Ruby 2.7.1
- Ruby on Rails 6.1.1
- VS code
- Linters

## Live Demo

[travellers-tweet.herokuapp.com](https://travellers-tweet.herokuapp.com/)

## Here is a description of business requirements for the app:
<div style="display: flex; flex-wrap: wrap">
<div align="center">
  <img src="image/spec_1.png?raw=true" width="40%" height="auto"/>
  <img src="image/spec_2.png?raw=true" width="40%" height="auto"/>
  <img src="image/erd.png?raw=true" width="40%" height="auto"/>
</div>
</div>

1. The user logs in to the app, only by typing the username (a properly authenticated login is **not** a requirement).
2. The user is presented with the homepage (see the *Homepage* screenshot above) that includes:
    1. Left-side menu (includes only links to pages that are implemented).
    2. *Tweets* tab in the centre (skip *Photos* and *Videos* for this MVP).
    3. Right-side section with *Who to follow (*skip *Trending for* this MVP).
3. The *Tweets* section includes:
    1. Simple form for creating a tweet.
    2. List of all tweets (sorted by most recent) that display tweet text and author details.
4. The *Who to follow* section includes:
    1. List of profiles that are not followed by the logged-in user (ordered by most recently added).
5. When the user opens the profile page (see the *Userpage* screenshot above), they can see:
    1. Left-side menu (includes only links to pages that are implemented).
    2. Cover picture and *Tweets* tab in the centre (skip other tabs and *Tweet to user* form).
    3. Right-side section with *Profile detailed info.*
6. The *Profile detailed info* section includes:
    1. User photo.
    2. Button to follow a user.
    3. Stats: total number of tweets, number of followers and number of following users.
    4. List of people who follow this user.
7. At the end extend your MVP app with one simple feature of your choice.



## Getting Started

### Prerequisites

Ruby: 2.7.1
Rails: 6.1.1
Postgres: >=9.5


### Setup

To get a local copy up and running follow these simple example steps.

- On the project GitHub page, navigate to the main page of the repository [this page](https://github.com/SarvarKh/travellers).
- Under the repository name, locate and click on a green button named `Code`.
- Copy the project URL as displayed.
- If you're running Windows Operating System, open your command prompt. On Linux, Open your terminal.
- Change the current working directory to the location where you want the cloned directory to be made. Leave as it is if the current location is where you want the project to be.
- Type `git clone`, and then paste the URL you copied in Step 3.<br>
  `$ git clone https://github.com/SarvarKh/travellers` <em>Press Enter key</em><br>
- Press Enter. Your local copy will be created.

Please Note that you must have Git installed on your PC, this can be done [here](https://gist.github.com/derhuerst/1b15ff4652a867391f03).


Install gems with:

```
    bundle install
```

Setup database with:

```
    rails db:create
    rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```


### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Setup [Rubocop and Stylelint linters](https://github.com/microverseinc/linters-config/tree/master/ror)
5. Open a PR from the `feature/branch` when your work is done.


## Authors

👤 **Sarvar Khalimov**

- GitHub: [SarvarKh](https://github.com/SarvarKh)
- Twitter: [KhalimovSarvar](https://twitter.com/KhalimovSarvar)
- LinkedIn: [Sarvar-Khalimov](https://www.linkedin.com/in/sarvar-khalimov/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/SarvarKh/travellers/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](https://en.wikipedia.org/wiki/MIT_License) licensed.
