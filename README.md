# getx_project_demo

An Example Flutter application using GetX as main framework and chopper as api generator.

## How to run
**requirement:** Flutter version >= 2.0.0

After cloning this repo, under the root direcory, do:

1. Get All dependencies

- run `flutter pub get`

2. Generate api files

- run `flutter pub run build_runner build`

This will generate `**.chopper.dart` in your direcory.(Adding to .gitigore is recommended?)

## Add your own code
[get_cli](https://github.com/jonataslaw/get_cli) is recommended to generated boilerplate code(binding, controller, view, model, etc).