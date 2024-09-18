const { Sequelize } = require('sequelize');
const sql = require('sql');
const sequelize = new Sequelize('ecota2', 'postgres', 'posert', {
  host: 'localhost',
  dialect: 'postgres',  // Change this according to your database
  logging: process.env.SEQUELIZE_LOGGING === 'true' ? console.log : false
});
const { logger, logEnter, logExit } = require('../config/logger');


const { DataTypes } = require('sequelize');

const Orga = sequelize.define('orga', {
  number: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  firstname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  lastname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  mail: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  phone: {
    type: DataTypes.STRING,
  },
  team: {
    type: DataTypes.INTEGER,
    references: {
      model: 'team',
      key: 'id',
    }
  },
  position: {
    type: DataTypes.INTEGER,
    references: {
      model: 'position',
      key: 'id',
    }
  },
  plant: {
    type: DataTypes.INTEGER,
    references: {
      model: 'plant',
      key: 'id',
    }
  },
  manager: {
    type: DataTypes.INTEGER,
    references: {
      model: 'orga',
      key: 'id',
    }
  },
  arrivaldate: {
    type: DataTypes.DATE,
  },
  leavingdate: {
    type: DataTypes.DATE,
  },
  pass: {
    type: DataTypes.STRING,
  },
  resettoken: {
    type: DataTypes.UUID,
  },
  resetdeadline: {
    type: DataTypes.DATE,
  }
}, {
  freezeTableName: true,
  //timestamps: false,   // Disable timestamps if your table doesn't have `createdAt` and `updatedAt`
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
    freezeTableName: true,
  }
);

const Team = sequelize.define('team',
  {
    code: {
      type: DataTypes.STRING,
    },
    shorttext: {
      type: DataTypes.STRING,
    },
    longtext: {
      type: DataTypes.STRING,
    },
    parent: {
      type: Sequelize.INTEGER,
      references: {
        model: 'team',
        key: 'id',
      }
    },
  },
  {
    freezeTableName: true
  }
);

const Position = sequelize.define('position',
  {
    text: {
      type: DataTypes.STRING,
    },
  },
  {
    freezeTableName: true
  }
);
const Plant = sequelize.define('plant',
  {
    code: {
      type: DataTypes.STRING,
    },
    shorttext: {
      type: DataTypes.STRING,
    },
    longtext: {
      type: DataTypes.STRING,
    },
  },
  {
    freezeTableName: true
  }
);

const Intensity = sequelize.define('intensity',
  {
    text: {
      type: DataTypes.STRING,
    },
  },

  {
    freezeTableName: true
  }
);
const Campaign = sequelize.define('campaign',
  {
    year: {
      type: Sequelize.INTEGER,
      allowNull: false,
      unique: true
    },
    revenue: {
      type: Sequelize.INTEGER,
    },
  },

  {
    freezeTableName: true
  }
);

const Country = sequelize.define('country',
  {
    code: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },
    text: {
      type: DataTypes.STRING,
    },
  },

  {
    freezeTableName: true
  }
);
const VendorSap = sequelize.define('rd_vendor_master_data_sap',
  {
    vendorcode: {
      type: DataTypes.STRING,
      primaryKey: true,
    },
    vendorname: {
      type: DataTypes.STRING,
    },
    country: {
      type: DataTypes.STRING,
    },
    city: {
      type: DataTypes.STRING,
    },
    address: {
      type: DataTypes.STRING,
    },
    mdmcode: {
      type: DataTypes.STRING,
    },
    vendortype: {
      type: DataTypes.STRING,
    },
  },

  {
    timestamps: false,  // Disable createdAt and updatedAt columns
    createdAt: false,    // No createdAt column
    updatedAt: false,    // No updatedAt column
    freezeTableName: true
  }
);
const VendorStl = sequelize.define('rd_vendor_master_data_stl',
  {
    vendorcode: {
      type: DataTypes.STRING,
      primaryKey: true,
    },
    vendorname: {
      type: DataTypes.STRING,
    },
    country: {
      type: DataTypes.STRING,
      references: {
        model: 'country',
        key: 'code',
      }
    },
    city: {
      type: DataTypes.STRING,
    },
    address: {
      type: DataTypes.STRING,
    },
    mdmcode: {
      type: DataTypes.STRING,
    },
    vendortype: {
      type: DataTypes.STRING,
    },
  },

  {
    timestamps: false,  // Disable createdAt and updatedAt columns
    createdAt: false,    // No createdAt column
    updatedAt: false,    // No updatedAt column
    freezeTableName: true
  }
);
const VendorSyt = sequelize.define('rd_vendor_master_data_syt',
  {
    vendorcode: {
      type: DataTypes.STRING,
      primaryKey: true,
    },
    vendorname: {
      type: DataTypes.STRING,
    },
    country: {
      type: DataTypes.STRING,
      references: {
        model: 'country',
        key: 'code',
      }
    },
    city: {
      type: DataTypes.STRING,
    },
    address: {
      type: DataTypes.STRING,
    },
    mdmcode: {
      type: DataTypes.STRING,
    },
    vendortype: {
      type: DataTypes.STRING,
    },
  },

  {
    timestamps: false,  // Disable createdAt and updatedAt columns
    createdAt: false,    // No createdAt column
    updatedAt: false,    // No updatedAt column
    freezeTableName: true
  }
);

const Perfo = sequelize.define('td_perfo_synthesis',
  {
    VendorCode: {
      type: DataTypes.STRING,
    },
    purchasingorganisationcode: {
      type: DataTypes.STRING,
    },
    "Value(EUR)": {
      type: Sequelize.INTEGER,
    },
  },

  {
    timestamps: false,  // Disable createdAt and updatedAt columns
    freezeTableName: true
  }
);

const YearlySupplierSnapShot = sequelize.define('yearly_supplier_snapshot',
  {
    year: {
      type: Sequelize.INTEGER,
    },
    vendorcode: {
      type: DataTypes.STRING,
    },
    vendorname: {
      type: DataTypes.STRING,
    },
    mdmcode: {
      type: DataTypes.STRING,
    },
    country: {
      type: DataTypes.STRING,
    },
    city: {
      type: DataTypes.STRING,
    },
    address: {
      type: DataTypes.STRING,
    },
    source: {
      type: DataTypes.STRING,
    },
  },

  {
    /*
    indexes: [
      {
        unique: true,
        fields: ['year', 'vendorcode']
      }
    ],
    */
    freezeTableName: true
  }
);
const YearlyTeamCotaData = sequelize.define('yearly_team_cota_data',
  {
    year: {
      type: Sequelize.INTEGER,
    },
    vendorcode: {
      type: DataTypes.STRING,
    },
    purchasingorganisationcode: {
      type: DataTypes.STRING,
    },
    "Value(EUR)": {
      type: Sequelize.INTEGER,
    },
    reason1:
    {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    },
    reason2:
    {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    },
    reason3:
    {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    },
    reason4:
    {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    },
    forceperfcota:
    {
      type: DataTypes.BOOLEAN
    },
    forceriskcota:
    {
      type: DataTypes.BOOLEAN
    },
    comment:
    {
      type: Sequelize.TEXT
    },
    commenter:
    {
      type: DataTypes.INTEGER,
      references: {
        model: 'orga',
        key: 'id',
      },
      onDelete: 'SET NULL',
      onUpdate: 'CASCADE'
    }
  },

  {
    /*
    indexes: [
      {
        unique: true,
        fields: ['year', 'vendorcode', 'purchasingorganisationcode']
      }
    ],
    */
    freezeTableName: true
  }
);
//const sequelize = require('../database');
/*
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
  team: {
    type: DataTypes.STRING,
    references: {
        model: 'team',
        key: 'code',
    }
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

const Country = sequelize.define('country',
  {
    code: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    desc: {
      type: DataTypes.STRING,
    },
  },

  {
      freezeTableName: true
  }
);

const Team = sequelize.define('team',
  {
    code: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    desc: {
      type: DataTypes.STRING,
    },
  },

  {
      freezeTableName: true
  }
);

const Intensity = sequelize.define('intensity',
  {
    desc: {
      type: DataTypes.STRING,
    },
  },

  {
      freezeTableName: true
  }
);

const Supplier1 = sequelize.define('supplier1',
  {
    erp: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    mdm: {
      type: DataTypes.STRING,
    },
    name: {
      type: DataTypes.STRING,
    },
    revenue: {
      type: Sequelize.INTEGER
    },
    team: {
        type: DataTypes.STRING,
        references: {
            model: 'team',
            key: 'code',
        }
      }
  },

  {
      freezeTableName: true
  }
);

const Supplier2 = sequelize.define('supplier2',
  {
    erp: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true,
    },
    mdm: {
      type: DataTypes.STRING,
    },
    country: {
        type: DataTypes.STRING,
        references: {
            model: 'country',
            key: 'code',
        }
      }
  },

  {
      freezeTableName: true
  }
);

const Campaign = sequelize.define('campaign',
  {
    year: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
    },
    revenue: {
      type: Sequelize.INTEGER,
    },
    intensity: {
        type: Sequelize.INTEGER,
        references: {
            model: 'intensity',
            key: 'id',
        }
      }
  },

  {
      freezeTableName: true
  }
);

const SupplierSelection = sequelize.define('supplierselection',
  {
    year: {
      type: Sequelize.INTEGER,
      references: {
          model: 'campaign',
          key: 'year',
      }
    },
    erp: {
      type: DataTypes.STRING,
      references: {
          model: 'supplier1',
          key: 'erp',
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE'
    },
    name: {
        type: DataTypes.STRING,
      },
    reason1:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: false 
    },
    reason2:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: false 
    },
    reason3:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: false 
    },
    reason4:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: false 
    },
    reason5:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: false 
    },
    selected:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: false 
    },
    force:
    { 
      type: DataTypes.BOOLEAN,
      defaultValue: null
    },
    comment:
    { 
      type: Sequelize.TEXT
    },
    commenter:
    { 
      type: DataTypes.INTEGER,
      references: {
        model: 'orga',
        key: 'id',
      },
      onDelete: 'SET NULL',
      onUpdate: 'CASCADE'
    }
  },

  {
      freezeTableName: true
  }
);

const SupplierCotaData = sequelize.define('suppliercotadata',
  {
    year: {
      type: Sequelize.INTEGER,
      references: {
          model: 'campaign',
          key: 'year',
      }
    },
    erp: {
      type: DataTypes.STRING,
      references: {
          model: 'supplier1',
          key: 'erp',
      },
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE'
    },
    intensity: {
      type: Sequelize.INTEGER,
      references: {
          model: 'intensity',
          key: 'id',
      }
    }
  })

Orga.hasMany(Session, { foreignKey: 'orgaid' });
Session.belongsTo(Orga, { foreignKey: 'orgaid' });
*/


sequelize.sync({ alter: true })
  .then(() => {
    logger.info('Database synchronized');
    const cronjobs = require("../cronjobs/cronjobs");
    cronjobs.startCampaign();
  })
  .catch(err => {
    console.error('Error synchronizing database:', err);
  });

module.exports = {
  sequelize,
  Orga,
  Session,
  Team,
  Position,
  Plant,
  Intensity,
  Campaign,
  Country,
  VendorSap,
  VendorStl,
  VendorSyt,
  Perfo,
  YearlySupplierSnapShot,
  YearlyTeamCotaData,
}