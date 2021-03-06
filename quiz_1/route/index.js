const express = require('express')
const router = express.Router();
const knex = require('../db/client')

function redirectToSignIn(req, res, next) {
    if(res.locals.username) {
        next()
    } else {
        res.render('cluckr/sign_in')
    }
}


router.get('/new', redirectToSignIn, (req, res) => {
    res.render('cluckr/new')
})

const COOKIE_MAX_AGE=1000 * 60 * 60 * 24 * 7; 
router.post('/', redirectToSignIn, (req, res) => {
    knex('clucks')
        .insert({
            username:req.cookies.username,
            imageUrl: req.body.url,
            content: req.body.content
        })
        .returning("*")
        .then(() => {
            res.redirect('/index')
        })    
    // console.log('username is', req.cookies.username)
    // console.log('imageurl is ', req.body.url)
    // console.log('content', req.body.content)
})


router.get('/', (req, res) => {
    console.log('req.body is ', req.body)
    knex('clucks')
        .orderBy('createdAt', "DESC")
        .then((data) => {
            res.render('cluckr/index', {data: data})
        })
})



module.exports=router