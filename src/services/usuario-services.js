import config from '../../dbconfig-env.js';
import sql from 'mssql'
class UsuarioService {

getAll = async () => {
    let returnArray = null;
    console.log('Estoy en UsuarioService.getAll()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Usuario");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

getById = async (id) => {
    let returnEntity=null;
    console.log('Estoy en UsuarioService.getById()');
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pId', sql.Int, id)
            .query('SELECT * FROM Usuario WHERE id = @pId');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

getByEmail = async (email) => {
    let returnEntity=null;
    console.log('Estoy en UsuarioService.getByEmail()');
    console.log(email)
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pEmail', sql.VarChar, email)
            .query('SELECT * FROM Usuario WHERE Email = @pEmail');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
    console.log(returnEntity)
}

getByNombre = async (nombre) => {
    let returnEntity=null;
    console.log('Estoy en UsuarioService.getByNombre()');
    console.log(nombre)
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pNombre', sql.VarChar, nombre)
            .query('SELECT * FROM Usuario WHERE Usuario = @pNombre');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
    console.log(returnEntity)
}

auth = async (data) => {
    let returnEntity=null;
    console.log('Estoy en UsuarioService.auth()');
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pEmail', sql.VarChar, data.email)
            .input('pPassword', sql.VarChar, data.password)
            .query('SELECT * FROM Usuario WHERE Email = @pEmail AND Contraseña = @pPassword');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

insert = async (data) => {
    let returnEntity=null;
    console.log('Estoy en UsuarioService.insert()');
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pEmail', sql.VarChar, data.Email)
            .input('pUsuario', sql.VarChar, data.Usuario)
            .input('pContraseña', sql.VarChar, data.Contraseña)
            .input('pFoto', sql.VarChar, data.Foto)
            .query('INSERT INTO Usuario (Email,Usuario,Contraseña,Foto,isBanned) VALUES (@pEmail, @pUsuario, @pContraseña, @pFoto, 0)')
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

getSeguidos = async (idUsuario) => {
    let returnEntity=null;
    console.log('Estoy en UsuarioService.getSeguidos()');
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pidUsuario', sql.Int, idUsuario)
            .query('SELECT * FROM SeguidosXUsuario WHERE IDUsuario=@pidUsuario');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    console.log(returnEntity);
    return returnEntity;
}

} 
export default UsuarioService;