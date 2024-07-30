const { Sequelize } = require('sequelize');
const sql = require('sql');
const sequelize = new Sequelize('ecota', 'postgres', 'posert', {
  host: 'localhost',
  dialect: 'postgres',  // Change this according to your database
});


const { DataTypes } = require('sequelize');
//const sequelize = require('../database');

const Orga = sequelize.define('Orga', {
  // Define attributes
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  mail: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  pass: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  resettoken: {
    type: DataTypes.UUID,
  },
  resetdeadline: {
    type: DataTypes.DATE
}
}, {
  tableName: 'orga',  // Specify the table name if it's different from the model name
  timestamps: false,   // Disable timestamps if your table doesn't have `createdAt` and `updatedAt`
});

const Session = sequelize.define('session',
    {
          id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true,
          },
        orgaid: {
            type: Sequelize.INTEGER,
            references: {
               model: 'orga',
               key: 'id',
            }
        },
        starttime: {
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW
        },
        endtime: {
            type: DataTypes.DATE
        }
    },

    {
        freezeTableName: true
    }
);

Orga.hasMany(Session, { foreignKey: 'orgaid' });
Session.belongsTo(Orga, { foreignKey: 'orgaid' });

sequelize.sync()
  .then(() => {
    console.log('Database synchronized');
    /*
    Session.findAll({ raw: true }).then(data => {
        console.log(data);
      });
      */
  })
  .catch(err => {
    console.error('Error synchronizing database:', err);
  });

module.exports = {
  sequelize,
  Orga,
  Session
}