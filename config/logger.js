const { createLogger, format, transports } = require('winston');
const { combine, timestamp, printf, colorize } = format;

const logFormat = printf(({ level, message, timestamp }) => {
  return `${timestamp} ${level}: ${message}`;
});

const logger = createLogger({
  level: process.env.NODE_ENV === 'development' ? 'debug' : 'info',
  format: combine(
    timestamp(),
    logFormat
  ),
  transports: [
    new transports.Console({
      format: process.env.NODE_ENV === 'development' ? combine(colorize(), logFormat) : logFormat
    })
  ]
});

module.exports = logger;