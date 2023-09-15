import config from '../../dbconfig-env.js';
import sql from 'mssql'
class LocalService {

getAll = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.getAll()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Local");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }


getById = async (id) => {
    let returnEntity=null;
    console.log('Estoy en LocalService.getById()');
    try {
        let pool=await sql.connect(config);
        let result = await pool.request()
            .input('pId', sql.Int, id)
            .query('SELECT * FROM Local WHERE id = @pId');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

getTitle = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.getTitle()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT ID,Nombre FROM Local");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

getImage = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.getImage()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT ID,Nombre,Portada FROM Local");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

getStars = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.getStars()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT ID,Nombre,Calificacion FROM Local");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }
getOrderPoblacion = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.getStars()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Local Order By Poblacion");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

insert = async (Local) => {
    let rowsAffected = 0;
    console.log('Estoy en: LocalService.insert()');

    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pNombre', sql.VarChar, Local?.Nombre ?? '')
            .input('pCalificacion', sql.Int, Local?.Calificacion ?? '')
            .input('pDireccion', sql.VarChar, Local?.Direccion ?? '')
            .input('pContacto', sql.Int, Local?.Contacto ?? '')
            .input('pPrecio', sql.Int, Local?.Precio ?? '')
            .input('pPoblacion', sql.VarChar, Local?.Poblacion ?? '')
            .input('pTardanza', sql.Int, Local?.Tardanza ?? '')
            .input('pPedirPorAdelantado', sql.Bit, Local?.PedirPorAdelantado ?? '')
            .input('pPortada', sql.VarChar, Local?.Portada ?? '')
            .query(`INSERT INTO Local (Nombre,Calificacion,Direccion,Contacto,Precio,Poblacion,Tardanza,PedirPorAdelantado,Portada) VALUES (@pNombre, @pCalificacion, @pDireccion, @pContacto, @pPrecio, @pPoblacion, @pTardanza, @pPedirPorAdelantado, @pPortada)`);
        rowsAffected = result.rowsAffected;
    } catch (error) {
        console.log(error);
    }
    return rowsAffected;
}

orderByPrecio = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.orderByPrecio()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Local Order By Precio");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

orderByDistancia = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.orderByDistancia()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Local Order By Distancia");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

orderByCalificacion = async () => {
    let returnArray = null;
    console.log('Estoy en LocalService.orderByCalificacion()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Local Order By Calificacion DESC");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }


}
export default LocalService