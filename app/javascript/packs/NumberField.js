class NumberField {
    constructor(span) {
        this.span = span
        this.input = span.querySelector('input')
        this.createButtons()
    }

    createButton(text, clicked) {
        let button = document.createElement('button')
        button.setAttribute('type', 'button')
        button.className = `step${text}`

        let textNode = document.createTextNode(text)
        button.appendChild(textNode)

        button.addEventListener('click', clicked)
        return button
    }

    createButtons() {
        this.span.insertBefore(this.createButton('-', () => this.input.stepDown()), this.input)
        this.span.insertBefore(this.createButton('+', () => this.input.stepUp()), null)
    }

    static ready() {
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelectorAll('.horizontal-number-control')
                .forEach(node => new NumberField(node))
        });
    }
}

export { NumberField }
