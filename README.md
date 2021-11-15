# Top Rated Movies

Flutter mobile app to show top rated movies from https://www.themoviedb.org/

This project uses Mobx as state managerment architechture and adopt project template from https://github.com/zubairehman/flutter-boilerplate-project with some changes.

## How to build project

### Step 1: fetch needed libraries by command

```flutter pub get```

### Step 2: generate code by command

```flutter pub run build_runner build```

If there are any error raised, add ```--delete-conflicting-outputs``` option

### Step 3: Build and run project

#### Building Android app

Debug mode ```flutter build apk --debug```

Release mode ```flutter build apk --release```

find more information in the link: https://flutter.dev/docs/deployment/android

#### Building iOS app

To build and run iOS app a macbook and Apple developer account are needed. check more detail in here https://flutter.dev/docs/deployment/ios

## Used libraries
<ol>
  <li>intl (<em>https://pub.dev/packages/intl</em>): using it for localization and format datetime</li>
  <li>dio (<em>https://pub.dev/packages/dio</em>): Http client to handy making api call</li>
  <li>get_it (<em>https://pub.dev/packages/get_it</em>): Service Locator to provided abstracted object in usage place without specifing implementation</li>
  <li>mobx (<em>https://pub.dev/packages/mobx</em>): State management</li>
  <li>flutter_mobx (<em>https://pub.dev/packages/flutter_mobx</em>): Cooperate with mobx to automatically rebuild UI on change from mobx store</li>
  <li>provider (<em>https://pub.dev/packages/provider</em>): Cooperate with mobx to build UI with provided store</li>
  <li>json_annotation (<em>https://pub.dev/packages/json_annotation</em>): Serialization and deserialization Json</li>
  <li>youtube_player_iframe (<em>https://pub.dev/packages/youtube_player_iframe</em>): Playing movie trailer from Youtube site</li>
  <li>build_runner (<em>https://pub.dev/packages/build_runner</em>): Putting in dev_dependency to generate needed code file in building process</li>
  <li>mobx_codegen (<em>https://pub.dev/packages/mobx_codegen</em>): Cooparate with build_runner to generate mobx implementation code</li>
  <li>json_serializable (<em>https://pub.dev/packages/json_serializable</em>): Cooparate with build_runner to generate code for json_annotation</li>
  <li>flutter_gen_runner (<em>https://pub.dev/packages/flutter_gen_runner</em>): Generate assets code for images, fonts... as static field</li>
  <li>flutter_lints (<em>https://pub.dev/packages/flutter_lints</em>): lints for Flutter apps, provide warning and suggestion on fly</li>
</ol>

