const express = require("express")
const router = express.Router()
const User = require("./User")
const bcrypt = require('bcryptjs')
const adminAuth = require("../middlewares/adminAuth")


// Rota da página usuários
router.get("/admin/users", adminAuth,(req, res) => {
    User.findAll().then(users => {
        res.render("admin/users/index", {users: users})
    })
})

router.get("/admin/users/create", (req, res) => {
    res.render("admin/users/create")
})

// Rota para cadastro de usuário
router.post("/users/create", (req, res) => {
    var nome = req.body.nome
    var email = req.body.email
    var password = req.body.password

    User.findOne({where:{email: email}}).then( user => {
        if(user == undefined){
            var salt = bcrypt.genSaltSync(10)
            var hash = bcrypt.hashSync(password, salt)
        
            User.create({
                nome: nome,
                email: email,
                password: hash
            }).then(() => {
                res.redirect("/")
            }).catch((err) => {
                res.redirect("/")
            })

        }else{
            res.redirect("/admin/users/create")
        }
    })
})

// Rota para login de usuários
router.get("/login", (req, res) => {
    res.render("admin/users/login")
})


// Rota de autenticação
router.post("/authenticate", (req, res) => {
    var email = req.body.email
    var password = req.body.password
    User.findOne({where: {email: email}}).then(user => {
        if(user != undefined){ // Se existe um usuário com este e-mail
            // Então valide a senha com o bcrypt
            var correct = bcrypt.compareSync(password, user.password)

            if(correct){
                req.session.user = {
                    id: user.id,
                    email: user.email
                }
                res.redirect("/admin/articles");
            }else{
                res.redirect("/login")
            }
        }else{
            res.redirect("/login")
        }
    })
})

router.get("/logout" , (req, res) => {
    req.session.user = undefined
    res.redirect("/login") 
})

module.exports = router