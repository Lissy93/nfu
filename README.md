<!-- Title + Description -->
<h1 align="center">NFU 🤦‍♂️</h1>
<p align="center">
  <i>Day counting mobile app for keeping track of goals (aka Not Fucking Up)</i>
</p>

<hr />

<!-- Screenshot -->
<p align="center" title="Screenshot of homepage">
  <a href="https://github.com/Lissy93/nfu">
    <img alt="Screenshots" src="/demo.gif" width="700" />
  </a>
</p>


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

It's built with Flutter, and deploys nativley to Android and iOS.

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

<!-- License + Copyright -->
<p  align="center">
  <i>© <a href="https://aliciasykes.com">Alicia Sykes</a> 2019</i><br>
  <i>Licensed under <a href="https://gist.github.com/Lissy93/143d2ee01ccc5c052a17">MIT</a></i><br>
  <a href="https://github.com/lissy93"><img src="https://i.ibb.co/4KtpYxb/octocat-clean-mini.png" /></a>
</p>

<!-- Dinosaurs are Awesome -->
<!-- 
                        . - ~ ~ ~ - .
      ..     _      .-~               ~-.
     //|     \ `..~                      `.
    || |      }  }              /       \  \
(\   \\ \~^..'                 |         }  \
 \`.-~  o      /       }       |        /    \
 (__          |       /        |       /      `.
  `- - ~ ~ -._|      /_ - ~ ~ ^|      /- _      `.
              |     /          |     /     ~-.     ~- _
              |_____|          |_____|         ~ - . _ _~_-_
-->

[//]: # (Links to legal and licensing)
[license-as]: https://gist.github.com/Lissy93/143d2ee01ccc5c052a17
[license-img]: https://user-images.githubusercontent.com/1862727/68531648-69ef4200-030c-11ea-8d48-74af7a2d8304.png
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
