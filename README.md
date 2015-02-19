# Anguloffee - AngularJS with CoffeeScript

This project is an application skeleton for a typical [AngularJS](http://angularjs.org/) web app with [CoffeeScript](http://coffeescript.org) similar to [angular-seed](https://github.com/angular/angular-seed).

## Anguloffee has:

* Support for CoffeeScript
* Up-to-date dependencies (Angular, Jasmine, Karma)
* [PhantomJS](http://phantomjs.org/) as default environment for running unit
  tests instead of Chrome. That gives you ability to test your application also in cloud based IDE like Cloud9.
* Task runner agnostic approach. Use Gulp, Grunt, Broccoli, Cake or whatever else which suits you best!
* Cool name. AngularJS + Coffee = Anguloffee. That's funny..., right?

## Conventions (and weird stuff):

* **ng-strict-di** Using strict dependency injection is highly recommended. Use [Inline Array Annotation](https://docs.angularjs.org/guide/di#inline-array-annotation) instead of [Implicit Annotation](https://docs.angularjs.org/guide/di#implicit-annotation).
* **app/lib?** Keep there libraries which cannot be installed via brower e.g. customized version of Modernizr.
* **jQuery dependency?** Yeah! You probably don't need it in your app but it comes in handy when unit testing.

## Instalation

To get Anguloffee working run:

```
npm install
bower install
```

If you don't have `karma-cli` installed yet you should do it in order to run tests. HTTP server is optional.

```
npm install -g coffee-script
npm install -g karma-cli
npm install -g http-server
```

To run E2E test you'll need [Protractor](http://angular.github.io/protractor/):

```
npm install -g protractor
```

## Available commands

There are some npm commands defined in package.json.

Run unit tests:
```
npm test
```

Start server (via http-server):
```
npm start
```

Start server (via http-server) in Cloud9:
```
npm run start-c9
```

Compile CoffeeScript:
```
npm run coffee
```

Run E2E test:
```
npm run protractor
```
