# Unofficial FIIT STU template for final theses in Typst

## About

This is an **unofficial** template for [FIIT STU](https://www.fiit.stuba.sk/) students writing their final theses in Typst. It is based on the official FIIT STU thesis guidelines and the unofficial FIIT STU LaTeX template.

It was created to make writing theses easier with [Typst](https://typst.app/home) rather than `LaTeX` and more accessible to students of the FIIT STU.

## Installation

For local use, first you need to install Typst. You can find the installation instructions and other usefull information on their [Github repository](https://github.com/typst/typst). It is recommended to use `VS Code` with the [tinymist extension](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) for good writing experience, but you can also use any other editor.

If you want to use this template, because it has not been yet uploaded to [Typst Universe](https://typst.app/universe/) you need to clone this repository and then you can start modying the `.typ` files mainly [main.typ](./thesis-template/main.typ) and other content files in the [thesis-template](./thesis-template/) directory.

When the template will be available on [Typst Universe](https://typst.app/universe/) you will be able to use it directly from there by importing it as a package.

If you do not have or do not want to use Typst locally, you can use the [Typst Web Editor](https://typst.app/). You need to upload the whole project there and you can start editing the `.typ` files.

## Usage

Most, if not all of the parameters that you need to set are in the `main.typ` file and are pretty self-explanatory. You can also check the [lib.typ](lib.typ) file for more information on the document setup.

You can change anything anywhere, but be careful with the `lib.typ`. Even some minor changes can break the whole document if you do not know what you are doing.

Example of rendered document can be found in the [main.pdf](./thesis-template/main.pdf) file.

## First time users to Typst

Using Typst is pretty simple, and pretty straightforward. It is basically combination of `LaTeX` and `Markdown`. They have a solid [documentation](https://typst.app/docs/reference/) and also this basic [tutorial](https://typst.app/docs/tutorial/) on their website which you can follow.

## Contributing

If you want to help with perfecting this template, feel free to create an issue or a pull request. Hopefully all tasks that need to be implemented are listed in the [TODO.md](TODO.md) file.

## Credits

- [Unofficial FIIT STU LaTeX Template](https://www.overleaf.com/latex/templates/stu-fiit-bachelor-thesis-template-slovak-university-of-technology/pppyykvvhqgq)
- [Official FIIT STU thesis guidelines](https://www.fiit.stuba.sk/studium/bakalarsky-projekt/bp.html?page_id=1862) ([PDF example](https://www.fiit.stuba.sk/buxus/docs/organizacia_studia/pokyny/ZP-clenenie-pokyny_2022.pdf))
- [charged-ieee Typst package](https://typst.app/universe/package/charged-ieee) - Inspiration for this template
- [wordometer Typst package](https://typst.app/universe/package/wordometer/) - Used package for word count
- [muchpdf Typst package](https://typst.app/universe/package/muchpdf/) - Used package for PDF inclusion

## License

This project is licensed under the `MIT` License. See the [LICENSE](LICENSE) file for more details.