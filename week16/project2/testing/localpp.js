if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config()
}
const express = require('express');
const app = express();
const users = [];//storing locally instead of on the persist database to test logic.
const bcrypt = require('bcrypt');
const session = require('express-session');
const passport = require('passport');
const flash = require('express-flash');
const initializePassport = require('./passport-config');//referencing the location where we initialize passport //initializing from passport-config
initializePassport(
    passport,
    email => users.find(user => user.email === email)),
    id => users.find(user => user.id === id)
/*
//Implementing a passport local strategy on passport/config.js file to keep code clean

app.post('/login',
    passport.authenticate('local', { failureRedirect: '/login' }),
    function (req, res) {
        res.redirect('/');
    });
*/
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.urlencoded({ extended: false })) //this allows for the fields (password/email) on the form page to be access inside the req variable inside the login POST method
app.use(flash())
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,//should we resave session variables if nothing changes? 
    saveUninitialized: false //should we save an empty value in the session if there is not value?
}))
app.use(passport.initialize())//function in passport that sets up some of the basics
app.use(passport.session())//store variables to be persistent accross the entire sessions


app.get('/', (req, res) => {
    res.render('index.ejs', { name: "Kel" })
});

app.get('/login', (req, res) => {
    res.render('login.ejs')
});
app.post('/login', passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login',
    failureFlash: true
}



))

app.get('/register', (req, res) => {
    res.render('register.ejs')
});
app.post('/register', async (req, res) => {
    try {
        const hashedPassword = await bcrypt.hash(req.body.password, 10) //includes await since we are using async
        users.push({
            id: Date.now().toString(),
            name: req.body.name,
            email: req.body.email,
            password: hashedPassword
        })
        res.redirect('/login')//If everthing is correct, redirect user to login page to continue loggin in
    } catch {
        res.redirect('/register') //If not correct, send user back to register page
    }
    console.log(users)
    //req.body.password //corresponds to the "name" (name, email, password) on the form field
})

app.listen(3000, () => {
    console.log('Listening on port 3000: ')
}
);