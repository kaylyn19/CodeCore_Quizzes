const express=require('express');
const logger = require('morgan');
const app = express();
const path = require('path')
const cookieParser = require('cookie-parser');
const knex = require('./db/client');
const rootRouter = require('./route/root');
const indexRouter = require('./route/index')
const methodOverride = require('method-override');

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(cookieParser());
app.use(logger ('dev'));
app.use(express.urlencoded({extended:true})); 
app.use(express.static(path.join(__dirname, 'public')))


app.use((req, res, next) => {
    res.locals.username=""
    const username = req.cookies.username;
    if(username) {
        res.locals.username = username;
    }
    next();
})

// function redirectToSignIn(req, res, next) {
//     if(res.locals.username) {
//         next()
//     } else {
//         res.render('cluckr/sign_in')
//     }
// }

app.use(methodOverride ((request, response) => {
    if (request.body && request.body._method) {
        const method = request.body._method
        return method;
    }
})
)

app.use('/', rootRouter);
app.use('/index', indexRouter);

const PORT = 4000
const ADDRESS = 'localhost'
app.listen(PORT, ADDRESS, () => {
    console.log(`listening to http://${ADDRESS}:${PORT}`)
})