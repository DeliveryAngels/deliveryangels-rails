class NumberField {
    constructor(span) {
        this.span = span
        this.input = span.querySelector('input')
        this.createButtons()
        this.span.classList.add('activated')
    }

    createButton(text, clicked) {
        let button = document.createElement('button')
        button.setAttribute('type', 'button')
        button.className = `step${text}`

        let textNode = document.createTextNode(text)
        button.appendChild(textNode)

        button.addEventListener('click', clicked.bind(this))
        return button
    }

    createButtons() {
        this.span.insertBefore(this.createButton('-', this.decrement), this.input)
        this.span.insertBefore(this.createButton('+', this.increment), null)
    }

    increment() {
        this.input.value = this.input.value || 0
        this.input.stepUp()
    }
    decrement() {
        this.input.value = this.input.value || 0
        this.input.stepDown()
    }

    static ready() {
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelectorAll('.horizontal-number-control')
                .forEach(node => new NumberField(node))
        });
    }
}

export { NumberField }
