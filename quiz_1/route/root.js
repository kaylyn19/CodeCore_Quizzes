const express = require('express')
const router = express.Router();
const knex = require('../db/client')

router.get('/sign_in', (req, res) => {
    res.render('cluckr/sign_in')
})

const COOKIE_MAX_AGE=1000 * 60 * 60 * 24 * 7; 
router.post('/sign_in', (req, res) => {
    const username = req.body.username
    console.log(username)
    res.cookie('username', username, {maxAge: COOKIE_MAX_AGE})
    res.redirect('/sign_in')
})

router.post('/sign_out', (req, res) => {
    res.clearCookie('username');
    res.redirect('/sign_in');
})
module.exports=router