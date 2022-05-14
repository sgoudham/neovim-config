" Configs that are neater in their own file
for f in split(glob('~\AppData\Local\nvim\configs.d\*.vim'), '\n')
    exe 'source' f
endfor