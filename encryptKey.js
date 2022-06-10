const ethers = require("ethers");
const fs = require("fs");
const dotenv = require("dotenv");
const path = require("path");

const envPath = path.resolve(process.cwd(), '.env.development')

dotenv.config({
    path: envPath
})


async function main() {
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
    const encryptedKeyJson = await wallet.encrypt(
        process.env.PRIVATE_KEY_PASSWORD,
        process.env.PRIVATE_KEY
    )
    fs.writeFileSync("./encrypted.json", encryptedKeyJson);
}

main();