import { XMLBuilder, XMLParser } from "fast-xml-parser"
import fs from "fs"

const jmDictJson = JSON.parse(fs.readFileSync('/home/craft/Downloads/jmdict-eng-3.6.1.json'))

const parser = new XMLParser()

// const xmlText = fs.readFileSync('/home/craft/Downloads/JMdict_e')

// const obj = parser.parse(xmlText)

// console.dir(obj.JMdict.entry.find(entry => entry.ent_seq === 1000230), { depth: null })

console.dir(jmDictJson.words.filter(word => word.kana.some(kana => kana.text === "ん")), { depth: null })
// console.dir(jmDictJson.words.filter(word => word.id == "1310460" || word.id == "2839142"), { depth: null })
