process.env.NODE_ENV = process.env.NODE_ENV || 'development'
const webpack = require('webpack');

const environment = require('./environment')

environment.loaders.append('jquery', {
    test: require.resolve('jquery'),
    loader: 'expose-loader',
    options: {
        exposes: ['$', 'jQuery'],
    },
});

module.exports = environment.toWebpackConfig()
