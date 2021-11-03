mongo -- "$MONGO_INITDB_DATABASE" <<EOF
    var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
    var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser,rootPassword)

    admin.createUser({user: '$ME_CONFIG_MONGODB_ADMINUSERNAME', pwd: '$ME_CONFIG_MONGODB_ADMINPASSWORD', roles: [ { role: "root", db: 'admin' }] });

    db = db.getSiblingDB('$MONGO_NS_DB');
    db.createUser({user: '$MONGO_NS_USER', pwd: '$MONGO_NS_PASSWORD', roles: [ { role: "readWrite", db: '$MONGO_NS_DB' }]});
EOF

