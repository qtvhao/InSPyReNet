const fs = require('fs');
let beautifulImagesDir = './beautifulImages';
let beautifulImagesNoBgDir = './beautifulImages-removebg';
if (!fs.existsSync(beautifulImagesNoBgDir)) {
    fs.mkdirSync(beautifulImagesNoBgDir);
}

const path = require('path');
const {transparentBackground} = require('transparent-background');
console.log('transparentBackground', transparentBackground)

let files = fs.readdirSync(beautifulImagesDir);


(async () => {
    for (let i = 0; i < files.length; i++) {
        let file = files[i];
        let filePath = path.join(beautifulImagesDir, file);
        let input = fs.readFileSync(filePath);
        let output = await transparentBackground(input, "png", {});
        let outputFile = path.join(beautifulImagesNoBgDir, file);
        fs.writeFileSync(outputFile, output);
    }
})();
