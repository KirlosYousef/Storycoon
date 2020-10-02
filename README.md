# Storycoon iOS App
> Allows the user to see a list of the top articles/stories by New York Times. If the user bookmarked an article they will be able to read it again later in an offline mode.

![iOS](https://img.shields.io/badge/iOS-13-brightgreen)
![version](https://img.shields.io/badge/version-1.0-yellow)
[![GitHub license](https://img.shields.io/github/license/KirlosYousef/Storycoon)](https://github.com/KirlosYousef/Storycoon/blob/master/LICENSE)
[![Twitter](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2FKirlosYousef%2FStorycoon)](https://twitter.com/intent/tweet?text=Check-this-out!:&url=https%3A%2F%2Fgithub.com%2FKirlosYousef%2FStorycoon)

<img height="500" src="https://i.imgur.com/DBbBz44.jpg">

# Table of Contents

- [Features](#Features)
- [Tech](#Tech)
- [Usage](#Usage)
- [Support](#Support)
- [Attributes](#Attributes)
- [License](#License)

# Features
**Realtime Data**

All the fetched articles are updated using the NYTimes API.

**Accessible Offline**

Any bookmarked articles will be stored to be accessible later in an offline state, using the RealmDB.

**Less Bandwidth**

Less data used and faster loading because of the Kingfisher images caching feature.

**Simple and Responsive**

Simple UI using the Apple's system colors, with the support for the Dark and light modes.

**Feedbacks**

No internet connection and No stored articles feedback images.


<img height="600" src="https://i.imgur.com/8jECCzj.png"><img height="600" src="https://i.imgur.com/asatB4a.png"><img height="600" src="https://i.imgur.com/DsNqofB.png">
<img height="600" src="https://i.imgur.com/uCrZpPP.png"><img height="600" src="https://i.imgur.com/o015NCI.png"><img height="600" src="https://i.imgur.com/3Bzie0v.png">

# Tech
- <a href="https://developer.nytimes.com/" target="_blank">NYTimes</a> for fetching the articles data
- CocoaPods
- Alamofire
- Kingfisher
- RealmDB
- MVC

# Usage

You will need to replace the <code>NYApiKey</code> in the code with your API key, which you can get from your NYTimes developer account.

## Support

Reach out to me at one of the following places!

- Portfolio at <a href="https://www.kirlosyousef.com" target="_blank">`kirlosyousef.com`</a>
- Linkedin at <a href="https://www.linkedin.com/in/kirlosyousef" target="_blank">`Kirlos Yousef`</a>

## Attributes

<div class="section_title text-center wow fadeInUp" data-wow-delay=".5s" data-wow-duration=".5s">
    <p>
        <a href="https://iconscout.com/illustration/logging-off-2100983" target="_blank">No Bookmarked aricles</a>
        -
        Image by <a
            href="https://iconscout.com/contributors/iconscout/illustrations"
            target="_blank">Iconscout Freebies</a>
        on <a
            href="https://iconscout.com"
            target="_blank">Iconscout</a>
    </p>
</div>
<div class="section_title text-center wow fadeInUp" data-wow-delay=".5s" data-wow-duration=".5s">
    <p>
        <a href="https://iconscout.com/illustration/success-2103599"
           target="_blank">No internet connection</a>
        -
        Image by <a href="https://iconscout.com/contributors/pixel-true-designs/illustrations" target="_blank">Pixel True</a>
        on <a
            href="https://iconscout.com"
            target="_blank">Iconscout</a>
    </p>
</div>

## License

- **[MIT License](https://opensource.org/licenses/MIT)**
- Copyright 2020 © <a href="https://www.kirlosyousef.com" target="_blank">Kirlos Yousef</a>.
