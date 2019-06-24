const express = require('express')
const router = express.Router();
const knex = require('../db/client')


router.get('/', (req, res) => {
    res.redirect('/index')
})
router.get('/sign_in', (req, res) => {
    res.render('cluckr/sign_in')
})


const COOKIE_MAX_AGE=1000 * 60 * 60 * 24 * 7; 
router.post('/sign_in', (req, res) => {
    // res.clearCookie('username')
    const username = req.body.username
    console.log(username)
    res.cookie('username', username, {maxAge: COOKIE_MAX_AGE})
    res.redirect('/index')
}) //clearing cookies

router.post('/sign_out', (req, res) => {
    res.clearCookie('username');
    res.redirect('/sign_in');
})
module.exports=router