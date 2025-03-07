# arscriptum.github-action 

A Github Action to build and deploy Jekyll site to Github Pages

The Action will build a production build of your jekyll site in gh-pages branch on every push. Very helpful, when you want to use jekyll plugins which are not supported by Github Pages Yet.

### Usage

You need to do the following:

1. set build folder
2. add the following in your site's **_config.yml** :

```yml
destination: ./build
```

And, put the following inside **yourjekyllsite/.github/workflows/main.yml**

```yml
name: Jekyll Deploy

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Deploy Jekyll Site with Ruby 3.3.x
      uses: arscriptum/arscriptum.github-action@1.0.5
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        GITHUB_REPOSITORY: ${{ secrets.GITHUB_REPOSITORY }}
        GITHUB_ACTOR: ${{ secrets.GITHUB_ACTOR }}
```


![Build Screenshot](doc/img/ss.png)
