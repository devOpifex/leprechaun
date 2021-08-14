# Lit

An example of using Google's [Lit](https://lit.dev/)
library of [Web Components](https://www.webcomponents.org/).

## Initialise

Create an R package and scaffold a leprechaun application.

```r
usethis::create_package('litter')
leprechaun::scaffold()
```

## Packer

JavaScript is better handled with 
[packer](https://packer.john-coene.com), 
we therefore create a packer scaffold. 

```r
packer::scaffold_leprechaun()
```

Then we add the packer plugin.

```r
leprechaun::use_packer()
```

This creates boiler plate code to use JavaScript with webpack,
which we will change to use Lit.

## Install

Install the Lit npm package.

```r
packer::npm_install("lit", scope = "prod")
```

## Use Lit

Replace the content of `srcjs/index.js` with:

```js
import {html, css, LitElement} from 'lit';

export class SimpleGreeting extends LitElement {
  static get styles() {
    return css`p { color: blue }`;
  }

  static get properties() {
    return {
      name: {type: String}
    }
  }

  constructor() {
    super();
    this.name = 'Somebody';
  }

  render() {
    return html`<p>Hello, ${this.name}!</p>`;
  }
}

customElements.define('simple-greeting', SimpleGreeting);
```

## UI

Then use the above registered `simple-greeting` component
in the UI of the application.

```r
# somewhere in shiny UI
tag("simple-greeting", list(name = "John"))
```

![](/_assets/lit.png)

That is it.
