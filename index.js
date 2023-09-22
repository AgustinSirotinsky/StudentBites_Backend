import express from "express";
import bodyParser from "body-parser"
import cors from 'cors'
import jwtservice from "./middleware/middleware.js"

import LocalService from './src/services/local-services.js';
import UsuarioService from "./src/services/usuario-services.js";
import ReseñaService from "./src/services/reseña-services.js";

const svcLocal=new LocalService();
const svcUsuario=new UsuarioService();
const svcReseña=new ReseñaService();

const app = express();
app.use(cors());
app.use(express.json());
const port = 3000;
const auth = new jwtservice();

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

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

app.get('/local/:id',async (req,res) =>{
    const LocalGetById = await svcLocal.getById(req.params['id']);
    if (LocalGetById.length == 0) {
        return res.status(404).send('Local inexistente')
    } else {
        return res.status(200).json(LocalGetById)
    }
})

app.get('/locales/orderByPrecio',async (req,res) =>{
    const LocalesOrderByPrecio = await svcLocal.orderByPrecio();
    return res.status(200).json(LocalesOrderByPrecio)
})

app.get('/locales/orderByDistancia',async (req,res) =>{
    const LocalesOrderByDistancia = await svcLocal.orderByDistancia();
    return res.status(200).json(LocalesOrderByDistancia)
})

app.get('/locales/orderByCalificacion',async (req,res) =>{
    const LocalesOrderByCalificacion = await svcLocal.orderByCalificacion();
    return res.status(200).json(LocalesOrderByCalificacion)
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

app.get('/usuario/email/:email',async (req,res) =>{
    const UsuariosGetByEmail = await svcUsuario.getByEmail(req.params['email']);
    if (UsuariosGetByEmail.length == 0) {
        return res.status(404).send(UsuariosGetByEmail)
    } else {
        return res.status(200).json(UsuariosGetByEmail)
    }
})

app.get('/usuario/nombre/:nombre',async (req,res) =>{
    const UsuarioGetByNombre = await svcUsuario.getByNombre(req.params['nombre']);
    if (UsuarioGetByNombre.length == 0) {
        return res.status(404).send(UsuarioGetByNombre)
    } else {
        return res.status(200).json(UsuarioGetByNombre)
    }
})

app.get('/usuario/seguidos/:id',async (req,res) =>{
    const UsuariosGetSeguidos = await svcUsuario.getSeguidos(req.params['id']);
    if (UsuariosGetSeguidos.length == 0) {
        return res.status(404).send('Usuario inexistente')
    } else {
        return res.status(200).json(UsuariosGetSeguidos)
    }
})

app.post('/login',async (req, res) => {
    let data = req.body;
    let Usuario=null;
        //Es necesario que el post tenga en el body "email" y "password", si no se llaman asi exactamente la api da error y se cae
    if (data.email==null || data.password==null){
        res.send("Mail o Password Null")
    }
    else {
        Usuario=await svcUsuario.auth(data)
    }
        if (Usuario.length==0){
        return res.status(404).send('Error en la autenticacion')
    }
    else {
        return res.status(200).json({
            successful: auth.createToken(Usuario),
            done: "Login correct"
          });
    }
})

app.post('/usuario/insert', async (req, res) => {
    let data = req.body;
    let Usuario=null;
    if (data.Email == null || data.Usuario == null || data.Contraseña == null || data.Foto == null){
        res.send("undefined")
    }
    else {
        Usuario=await svcUsuario.insert(data)
    }
        return res.status(200).json('Usuario creado')
})


//Reseñas

app.get('/resenias',async (req,res) =>{
    const ReseñasGetAll = await svcReseña.getAll();
    return res.status(200).json(ReseñasGetAll)
})

app.get('/resenia/:id',async (req,res) =>{
    const ReseñasGetAll = await svcReseña.getById(req.params['id']);
    if (ReseñasGetAll.length == 0) {
        return res.status(404).send('Reseña inexistente')
    } else {
        return res.status(200).json(ReseñasGetAll)
    }
})

app.get('/resenia/local/:localId',async (req,res) =>{
    const ReseñasGetByLocal = await svcReseña.getByLocal(req.params['localId']);
    if (ReseñasGetByLocal.length == 0) {
        return res.status(404).send('Reseña/s inexistente')
    } else {
        return res.status(200).json(ReseñasGetByLocal)
    }
})

app.get('/resenia/usuario/:usuarioId',async (req,res) =>{
    const ReseñasGetByUsuario = await svcReseña.getByUsuario(req.params['usuarioId']);
    console.log(ReseñasGetByUsuario);
    if (ReseñasGetByUsuario.length == 0) {
        return res.status(404).send('Reseña/s inexistente')
    } else {
        console.log(ReseñasGetByUsuario.length)
        return res.status(200).json(ReseñasGetByUsuario)
    }
})

app.post('/resenias/insert', async (req, res) => {
    let data = req.body;
    let Reseña=null;
    if (data.UsuarioId==null || data.LocalId==null || data.Calificacion==null || data.ComidaId==null || data.Precio==null || data.Tardanza==null || data.Poblacion==null || data.Descripcion==null){
        res.send("undefined")
    }
    else {
        Reseña=await svcReseña.insert(data)
    }
        return res.status(200).json('Reseña insertada')
})

app.post('/resenias/update', async (req, res) => {
    let data = req.body;
    let Reseña=null;
    if (data.Calificacion==null || data.ComidaId==null || data.Precio==null || data.Tardanza==null || data.Poblacion==null || data.Descripcion==null || data.ID==null){
        res.send("undefined")
        console.log(data)
    }
    else {
        Reseña=await svcReseña.update(data)
    }
        return res.status(200).json(Reseña)
})

app.get('/tipodecomida',async (req,res) =>{
    const ComidaGetAll = await svcReseña.getAllComida();
    return res.status(200).json(ComidaGetAll)
})