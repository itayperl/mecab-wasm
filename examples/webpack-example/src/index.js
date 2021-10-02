import Mecab from "mecab-wasm";

function init() {
    document.getElementById('button').addEventListener('click', function() {
        let text = document.getElementById('in').value;
        let result = Mecab.query(text);
        document.getElementById('out').value = JSON.stringify(result, null, 2);
    });
}

window.addEventListener('load', function() {
    Mecab.waitReady().then(init);
});
