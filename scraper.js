#!/usr/bin/env node
let url = process.argv[2];
if (!url) {
    console.log("Need $1")
    process.exit();
}
url = 'https://en.wikipedia.org/wiki/ISO_3166-2:' + url.toUpperCase(); 

let exec = require("util").promisify(require("child_process").exec)
async function get(u) {
    return (await exec(`curl -sL '${u}'`)).stdout
}

async function main() {
    let main_html = await get(url);
    let tabs = main_html.split(`<td><link rel="mw-deduplicated-inline-style"`);
    tabs.push(tabs.pop().split("</tbody>")[0]);
    tabs.shift();
    let data = [];
    for (i of tabs) {
        if (!i) continue
        try {
            let iurl = 'https://en.wikipedia.org' + i.split("<a href=\"").pop().split('"')[0];
            let f_html = await get(iurl);
            let grepped = f_html.split(`\n`).filter(x => x.includes(`<div class="ib-settlement-cols-row"><div class="ib-settlement-cols-cell"><a href`));
            if (grepped.length < 0) continue;
            let l_html = await get('https://en.wikipedia.org' + grepped[0].split(`<a href="`)[1].split('"')[0]);
            console.log('get https:' + l_html.split(`<div class="fullMedia"><p><a href="`)[1].split('"')[0] + ' ' + i.split(`<span class="monospaced">`)[1].split('<')[0].toLowerCase());
        } catch (e) { }
    }

}




main();
