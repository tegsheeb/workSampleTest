const path = require("path")
var SRC_DIR = path.join(__dirname, '/src');
var DIST_DIR = path.join(__dirname, '/dist');
const HtmlWebPackPlugin = require("html-webpack-plugin")

module.exports = {
    entry: `${SRC_DIR}/index.jsx`,
    mode: "development", // "production" | "development" | "none"
    devtool: "inline-source-map",
    resolve: {
        extensions: [".jsx", ".js"]
    },
    output: {
        filename: "bundle.js",
        path: DIST_DIR
    },
    module: {
        rules: [
            {
              test: /\.(js|jsx|)$/,
                exclude: /node_modules/,
                loader: "babel-loader",
                query: {
                    presets: ['@babel/preset-env', '@babel/preset-react']
                 }
            },
            {
              test: /\.s?css$/,
              use: ['style-loader', 'css-loader', 'sass-loader']
            }
        ]
    },

    plugins: [
        new HtmlWebPackPlugin({
            template: "./index.html",
            filename: "index.html"
        })
    ],
    devServer: {
        contentBase: path.join(__dirname, "build"),
        compress: true,
        port: 8000
    }
}