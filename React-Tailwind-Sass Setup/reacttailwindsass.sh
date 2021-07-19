#! /bin/zsh

# [ -d "$1" ] && echo "Directory already exists." && exit 0

# if [ -z "$1" ]
#   then
#     echo "No directory name specified"
#     exit 0
# fi

printf "Enter Directory name : "
read dir

npx create-react-app $dir  #create react application

cd $dir

code .

npm i -D tailwindcss@npm:@tailwindcss/postcss7-compat postcss@^7 autoprefixer@^9  #tailwind dependencies installation

npm i @craco/craco  # craco install

npm i node-sass@4.14.1

touch craco.config.js

echo "module.exports={style:{postcss:{plugins:[require('tailwindcss'),require('autoprefixer'),    ],},},}">>./craco.config.js

npx tailwindcss-cli@latest init

echo "module.exports={purge:['./src/**/*.{js,jsx,ts,tsx}', './public/index.html'],darkMode:false,theme:{extend:{}},variants:{extend:{}},plugins:[]};">./tailwind.config.js

cd src

rm index.css

touch index.scss

echo "@tailwindbase;">>index.scss
echo "@tailwindcomponents;">>index.scss
echo "@tailwindutilities;">>index.scss

sed -i '' 's/css/scss/g' ./index.js

npm start