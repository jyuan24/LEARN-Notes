Converting stuff to phone app

react-native : this is the create-react-app for native applications

npm install -g create-react-native-app
^^ works well w/ apple...might not work on windows machine

to start up react app
in terminal:
    npm install -g create-react-app
    create-react-app app_name
    npm install -g yarn
    yarn install
    cd app_name
    (now need extra step to change webpackHotDevClient.js https://github.com/facebook/create-react-app/pull/8079/commits/9585c26593e18296fe202bfea198130f9d0dbd34)
    yarn start
    

create-react-native-app learn-demo <- that's the name

both the above commands will take a while to run the first time

select "blank"

next they ask you to name the app
then asks if you want to use yarn - yes

yarn start after cding into the dir

start expo on phone


app.js is similar but different, importing stylesheet, text, view from react-native package

- convert functional components to class components
- html doesn't work in react-native aka div, table, h1, etc
- View = div
- Text = span/p
- command R reloads the emulator
- one thing w/ native is you need each line of text within a text string
- button paired with onpress
- stylesheet class is essentially the css for the code


what to do..
- go to react native website, useful info contained there
    - basic tutorials
    - includes info on elements we can work with on left scroll bar