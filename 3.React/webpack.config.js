const path = require("path")
const HtmlWebPackPlugin = require("html-webpack-plugin")

module.exports = {
    entry: "./src/index.jsx",
    mode: "development", // "production" | "development" | "none"
    devtool: "inline-source-map",
    resolve: {
        extensions: [".jsx", ".js"]
    },
    module: {
        rules: [
            {
              test: /\.(js|jsx|)$/,
                exclude: /node_modules/,
                loader: "babel-loader"
            },
            {
              test: /\.s?css$/,
              use: ['style-loader', 'css-loader']
            }
        ]
    },
    output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, "build")
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