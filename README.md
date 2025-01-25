# Unofficial FIIT STU template for final theses in Typst

<u>***Note:***</u>

**This template is WIP (Work in Progress), contains a lot of things to be fixed and should be used with caution**

## About

This is an **unofficial** template for [FIIT STU](https://www.fiit.stuba.sk/) students writing their final theses in Typst. It is based on the official FIIT STU thesis guidelines and the unofficial FIIT STU LaTeX template.

It was created to make writing theses easier with `Typst` rather than `LaTeX` and more accessible to students of the FIIT STU.

## Installation

For local use, first you need to install Typst. You can find the installation instructions and other usefull information on their [Github repository](https://github.com/typst/typst).

If you want to use this template, because it is WIP (Work in Progress) you need to clone this repository and then you can start modying the [main.typ](main.typ) file.

Later on, when the template is more stable, it will be available in the [Typst Universe](https://typst.app/universe/) and you will be able to use it directly from there by importing it as a package.

If you do not have or do not want to use Typst locally, you can use the [Typst Web Editor](https://typst.app/). You need to download the `lib.typ` and `main.typ` files and then upload them. You will probably need to change the import statements in the `main.typ` file to point to the correct location of the `lib.typ` file.

## Usage

Most, if not all of the parameters that you need to set are in the `main.typ` file and are pretty self-explanatory. You can also check the [lib.typ](./thesis-template/lib.typ) file for more information on the document setup.

You can change anything anywhere, but be careful with the `lib.typ` file. Even some minor changes can break the whole document if you do not know what you are doing.

Example of rendered document can be found in the [main.pdf](main.pdf) file.

## First time users to Typst

Using Typst is pretty simple, and pretty straightforward. It is basically combination of `LaTeX` and `Markdown`. They have a solid [documentation](https://typst.app/docs/reference/) and also this basic [tutorial](https://typst.app/docs/tutorial/) on their website which you can follow.

## Contributing

If you want to help with perfecting this template, feel free to create an issue or a pull request. Hopefully all issues that need to be fixed are listed in the [TODO.md](TODO.md) file.

## Credits

- [Unofficial FIIT STU LaTeX Template](https://www.overleaf.com/latex/templates/stu-fiit-bachelor-thesis-template-slovak-university-of-technology/pppyykvvhqgq)
- [Official FIIT STU thesis guidelines](https://www.fiit.stuba.sk/buxus/docs/organizacia_studia/pokyny/ZP-clenenie-pokyny_2022.pdf)
- [charged-ieee Typst package](https://typst.app/universe/package/charged-ieee)
- [wordometer Typst package](https://typst.app/universe/package/wordometer/)

## License
For the license information, please check the [LICENSE](LICENSE) file.