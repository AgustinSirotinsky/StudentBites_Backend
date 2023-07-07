import config from '../../dbconfig-env.js';
import sql from 'mssql'
class ReseñaService {

getAll = async () => {
    let returnArray = null;
    console.log('Estoy en ReseñaService.getAll()');
    try {
        let pool = await sql.connect(config);
        let result = await pool.request().query("SELECT * FROM Reseña");
        returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }

getById = async (id) => {
    let returnEntity=null;
    console.log('Estoy en ReseñaService.getById()');
    try {
        let pool=await sql.connect(config);
        let result = await pool.request()
            .input('pId', sql.Int, id)
            .query('SELECT * FROM Reseña WHERE id = @pId');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

getByLocal = async (local) => {
    let returnEntity=null;
    console.log('Estoy en ReseñaService.getByLocal()');
    try {
        let pool=await sql.connect(config);
        let result = await pool.request()
            .input('plocalId', sql.Int, local)
            .query('SELECT * FROM Reseña WHERE LocalID = @plocalId');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

getByUsuario = async (usuario) => {
    let returnEntity=null;
    console.log('Estoy en ReseñaService.getByUsuario()');
    try {
        let pool=await sql.connect(config);
        let result = await pool.request()
            .input('pUsuarioId', sql.Int, usuario)
            .query('SELECT * FROM Reseña WHERE UsuarioID = @pUsuarioId');
        returnEntity = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnEntity;
}

}
export default ReseñaService