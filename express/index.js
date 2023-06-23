import express from "express";

import LocalService from './src/services/local-services.js'
import UsuarioService from "./src/services/usuario-services.js";
import ReseñaService from "./src/services/reseña-services.js";

import Local from './src/models/Local.js'
import Usuario from './src/models/Usuario.js'
import Reseña from './src/models/Reseña.js'

const svcLocal=new LocalService();
const svcUsuario=new UsuarioService();
const svcReseña=new ReseñaService();

const app= express();
const port= 3000;

app.get('/', (req,res)=>{
    res.send('StudentBites');
})

app.listen(port,()=> {
    console.log(`Pagina abierte en el puerto ${port}`)
})

//Locales
app.get('/locales',async (req,res) =>{
    const LocalesGetAll = await svcLocal.getAll();
    return res.status(200).json(LocalesGetAll)
})

app.get('/locales/title',async (req,res) =>{
    const LocalesGetTitle = await svcLocal.getTitle();
    return res.status(200).json(LocalesGetTitle)
})

app.get('/locales/image',async (req,res) =>{
    const LocalesGetImage = await svcLocal.getImage();
    return res.status(200).json(LocalesGetImage)
})

app.get('/locales/stars',async (req,res) =>{
    const LocalesGetStars = await svcLocal.getStars();
    return res.status(200).json(LocalesGetStars)
})

// app.get('locales/insert',async (req,res) =>{

// })

app.get('/local/:id',async (req,res) =>{
    const LocalGetById = await svcLocal.getById(req.params['id']);
    if (LocalGetById.length == 0) {
        return res.status(404).send('Local inexistente')
    } else {
        return res.status(200).json(LocalGetById)
    }
})

//Usuarios
app.get('/usuarios',async (req,res) =>{
    const UsuariosGetAll = await svcUsuario.getAll();
    return res.status(200).json(UsuariosGetAll)
})

app.get('/usuario/:id',async (req,res) =>{
    const UsuariosGetById = await svcUsuario.getById(req.params['id']);
    if (UsuariosGetById.length == 0) {
        return res.status(404).send('Usuario inexistente')
    } else {
        return res.status(200).json(UsuariosGetById)
    }
})

//Reseñas