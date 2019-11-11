
# NFU - A Day Count App (for Not Fucking Up)

> A Flutter app for Android and iOS. What ever your aiming for, this day counting app will keep track of how long you&#x27;ve kept going for (aka Not Fucked Up).



SCREENSHOTS


---

## About

First off, there are plenty of goal tracking, self-improvement and habit apps already out there, so if your
looking for something with a bunch of features check out: **Habit Tracker** ([Android][habbit-tracker-android]),
**Habitify** ([Android][habitify-android] | [iOS][habitify-ios]),  **Productive** ([Android][productive-android] |
[iOS][productive-ios]), **Habit** ([iOS][habit-ios]), **Done** ([iOS][done-ios]) or **Loop** ([Andoid][loop-android]).


This app is a little different, the goal here was for you to spend as little time as possible using it.
And so instead of daily recoding your success or failure, you just reset the streak if you f*ck up.
It allows you to really quickly and easily keep track of how many days, you've kept going for 
(such as number of days smoke-free, sober, or whatever else you'd like to measure days for).


---

## Developing

Fairly small code base, and it's structured in the standard sorta way. Uses **Flutter SDK V2.1.0 - V3.0.0**.



#### Set Up Guide

- Get the Code: `git clone https://github.com/Lissy93/nfu.git` then `cd nfu`
- Grab the dependencies `flutter pub get`
- To keep the source code synced, you can `flutter packages pub run build_runner watch`
- Then use Android Studio or your favourite editor along with the Flutter CLI to develop

For more info, check out the [Flutter docs](https://flutter.dev/docs), which are actually pretty awesome.


#### Direcory Structure

```
nfu/
├── android/
├── build/
├── ios/
├── lib/
│   ├── forms/
│   ├── models/
│   ├── screens/
│   ├── utils/
│   ├── widgets/
│   └── main.dart
└── pubspec.yaml
```

#### Also...

Shout out to [@faob-dev] for [folding_cell] and  [@Realank] for [flutter_datetime_picker], both components
were nice and neat, and thanks to them, it made building this little app a lot quicker.

I'm quite new to Flutter, and always looking to improve, so if you see something 
that could be better, it'd be awesome if you could let me know, or open an issue 
and I'll look into it- thanks!


---

## Licensed under MIT (X11)
**Copyright (c) Alicia Sykes <alicia@as93.net>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included install
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT ABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[![mit-license-alicia-sykes][license-img]][license-as]



### Disclaimer
*There are no guarantees for the workingness of anything here 
(I mean, it works fine on my machine lol, and it is tested and all), 
but basically I cannot be held responsible for anything related related to this.*

*I code stuff just for the love of it, and not to earn anything. It's all open sourced, 
so that if any of you want to- you can use any parts of this project for whatever you like.
**But I would be grateful if you didn't deploy the whole project as it is, and pass it off as your own work**.*

**Legal info:** [https://aliciasykes.com/legal][legal-info].

[//]: # (Links to legal and licensing)
[license-as]: https://gist.github.com/Lissy93/143d2ee01ccc5c052a17
[license-img]: https://lh6.googleusercontent.com/OiYcw9WstZ8jHptCpJKE6ZZ7SgVAX3Lk7Xum_e-Bp1z455OljCJlVI9WvTwVv2qrNebDf3vnjqn76Q=w1865-h982
[legal-info]: https://aliciasykes.com/legal

[//]: # (Links to better apps than this one)
[habbit-tracker-android]: https://play.google.com/store/apps/details?id=com.oristats.habitbull
[habitify-android]: https://play.google.com/store/apps/details?id=co.unstatic.habitify
[habitify-ios]: https://apps.apple.com/us/app/habitify-habit-tracker/id1111447047
[productive-android]: https://play.google.com/store/apps/details?id=com.apalon.to.do.list
[productive-ios]: https://apps.apple.com/us/app/productive-habit-tracker/id983826477
[habit-ios]: https://apps.apple.com/gb/app/habit-daily-tracker/id1445651730
[done-ios]: https://apps.apple.com/gb/app/done-a-simple-habit-tracker/id1103961876
[loop-android]: https://play.google.com/store/apps/details?id=org.isoron.uhabits

[//]: # (Links to people and libraries that I used)
[@faob-dev]: https://github.com/faob-dev
[folding_cell]: https://github.com/faob-dev/folding_cell
[flutter_datetime_picker]: https://github.com/Realank/flutter_datetime_picker
[@Realank]: https://github.com/Realank

[//]: # (Links to my social platforms)
[as-website]: https://aliciasykes.com
[as-github]: https://github.com/lissy93
[as-twitter]: https://twitter.com/Lissy_Sykes
[as-instagram]: https://www.instagram.com/lissy_sykes93
[as-linkedin]: https://linkedin.com/in/aliciasykes
[as-keybase]: https://keybase.io/aliciasykes
[as-blog]: https://blog.aliciasykes.com

