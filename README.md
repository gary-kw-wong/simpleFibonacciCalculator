# SimpleFibonacciCalculator (Reference: friendlychat)

<img src="https://user-images.githubusercontent.com/12118835/79595080-d0c12480-8110-11ea-99c9-84f697741a3d.png" width="10%" height="10%"><img src="https://user-images.githubusercontent.com/12118835/79595105-ddde1380-8110-11ea-88f0-81a0e8f80773.jpg" width="25%" height="25%">

This project is a simple mobile calculator for calculating next or last Fibonacci number by simply pressing on + / - buttons on the screen.

As this is a Flutter application, so it could be deployed to both Android and iOS (needs to be built on macOS even with AndroidStudio).

Remark:
As this is a Flutter application which is referencing sample project 'friendlychat'.


## Description

### Layout & Directions

This mobile app. is quite intuitive. After started the app., you can simply press on "-" / "+" buttons, the application will show you before/next Fibonacci number.


## Background

### 1. What is Fibonacci numbers?

https://www.wikiwand.com/en/Fibonacci_number

### 2. Why writing this app?

It all starts on a day, when a friend talked to me that he likes playing Roulette in casino with the strategy of Fibonacci system, but he got poor memory on remembering the numbers, which interested me to make a mini tool for helping a bit on it.

### 3. Why choosing Flutter + Dart?

I know Reactive Native or Ionic is very famous for developing hybrid mobile app. And I, personally, had also developed mobile app. with Reactive Native (+ javascript) and also had develop an web-app with Angular (+ Typescript). Then why would I choose Flutter (+ Dart) for this app? What is the difference from the others?

React Native
------------
My feeling of dveloping mobile app. using React Native (+ javascript / +typescript) or web-app using Angular (+ typescript), they are quite similar on certain aspects: 
 
  1. Other than learning about the framework, and incorporating your business logic to the framework; there are many situations that you also need to handle with 3rd parties plugins / libraries for specific effect, state handling, function control (e.g. bluetooth handling) , or even layout. Some of them are even  charged for using (I know ... there is no free lunch in this world). 
  
  2. Instead of point 1, you also need to have some knowledges on some web components (e.g. HTML elements along with their attributes, CSS on how the cascading mechanism works, etc.), in order to have a comprehensive (full-stack) product (i.e. UI + busiess logic app).
  
  3. Although it is a great advantage by React Native that you can write once (in one single project), and run on both OS; actually, for the project works with same/similar behavior/effects on both OS, sometimes you still need to install and embed different plugins specific for either OS from case to case; not the true "write once run anywhere".
  
  4. For it to be easier understand by some guys who are more familiar to backend development, the whole feeling is like Spring (Framework) + Java (language).


Flutter
-------
How about Flutter (+Dart)? My feeling on it is that:

  1. it's more like writing Java Swing (which is implementing UI Layout, you're writing Java; while implemeting business logic, you're also writing Java). All the HTML elements are objectized (e.g. Row, Column, Divider, etc.)
  
  2. Since nearly "everything" are also included in 1 language (Dart), the IDE (e.g AndroidStudio) could easily help to offload some of the jobs (e.g. auto-importing libraries, more accurate code suggestion, auto compile, etc. )
  
  3. Due to the advantage in Point 2, less extra effort is required to look for appropriate external plugins.
  

Summary
-------
Although from the above points, looks like I have bias to keen on using Flutter (+Dart) at all, it's not true. Because there is still one point need to consider: **Project scale + team size**

  1. If the project scale is not small, and the team is in certain size, then why not consider React Native which may help to separate tasks, achive the same goal easier.
  
  2. If you're only one-man band, take care of fewer aspect (with Flutter + Dart), wouldn't it be a better choice?
  



Reference:
----------
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
