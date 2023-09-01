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

insert = async (data) => {
    //Poblacion y tardanza van a ser int Baja:1 Media:2 Alta:3 Muy Alta:4 despues vamos a hacer un promedio y mostrar como string
    let returnEntity = null;
    console.log('Estoy en: ReseñaService.Insert()');

    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('pUsuarioId', sql.Int, data?.UsuarioId ?? 0)
            .input('pLocalId', sql.Int, data?.LocalId ?? 0)
            .input('pCalificacion', sql.Int, data?.Calificacion ?? 0)
            .input('pComidaId', sql.Int, data?.ComidaId ?? 0)
            .input('pPrecio', sql.Int, data?.Precio ?? 0)
            .input('pTardanza', sql.Int, data?.Tardanza ?? 0)
            .input('pPoblacion', sql.Int, data?.Poblacion ?? 0)
            .input('pDescripcion', sql.VarChar, data?.Descripcion ?? 0)

            .query('INSERT INTO Reseña (UsuarioId,LocalId,Calificacion,ComidaId,Precio,Tardanza,Poblacion,Descripcion) VALUES (@pUsuarioId,@pLocalId,@pCalificacion,@pComidaId,@pPrecio,@pTardanza,@pPoblacion,@pDescripcion)')
        returnEntity = result.recordsets[0];
    }
    catch (error) {
        console.log(error);
    }
    return rowsAffected;
}

getAllComida = async () => {
    let returnArray = null;
    console.log('Estoy en ReseñaService.getAllComida()');
    try {
        let pool = await sql.connect(config);
        let result = await pool.request().query("SELECT * FROM TipoDeComida");
        returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }
}

export default ReseñaService