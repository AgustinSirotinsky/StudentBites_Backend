import winston from "winston";
/*
    0: error
    1: warn
    2: info
    3: verbose
    4: debug
    5: silly
*/
const logConfiguration = {
    transports: [
        new winston.transports.Console({
            level: 'debug'
        }),
        new winston.transports.File({
            level: 'info',
            // Create the log directory if it does not exist
            filename: 'logs/example.log'
        })
    ]
};
export default logConfiguration;