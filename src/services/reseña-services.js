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

Insert = async (reseña) => {
    //Poblacion y tardanza van a ser int Baja:1 Media:2 Alta:3 Muy Alta:4 despues vamos a hacer un promedio y mostrar como string
    let rowsAffected = 0;
    console.log('Estoy en: ReseñaService.Insert()');

    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pUsuarioId', sql.Int, reseña?.UsuarioId ?? 0)
            .input('pLocalId', sql.Int, reseña?.LocalId ?? 0)
            .input('pImagen', sql.VarChar, reseña?.Imagen ?? '')
            .input('pCalificacion', sql.Int, reseña?.Calificacion ?? 0)
            .input('pComidaId', sql.Int, reseña?.ComidaId ?? 0)
            .input('pPrecio', sql.Int, reseña?.Precio ?? 0)
            .input('pTardanza', sql.Int, reseña?.Tardanza ?? 0)
            .input('pPoblacion', sql.Int, reseña?.Poblacion ?? 0)
            .input('pDescripcion', sql.VarChar, reseña?.Descripcion ?? 0)

            .query('INSERT INTO Reseña (UsuarioId,LocalId,Imagen,Calificacion,ComidaId,Precio,Tardanza,Poblacion,Descripcion) VALUES (@pUsuarioId,@pLocalId,@pImagen,@pCalificacion,@pComidaId,@pPrecio,@pTardanza,@pPoblacion,@pDescripcion)')
        rowsAffected = result.rowsAffected;
    } catch (error) {
        console.log(error);
    }
    return rowsAffected;
}

}
export default ReseñaService