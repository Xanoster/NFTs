/* @type import('hardhat/config').HardhatUserConfig */

require("@nomicfoundation/hardhat-ethers");
require("@nomicfoundation/hardhat-verify");
require("dotenv").config();
const { API_URL, PRIVATE_KEY } = process.env;
module.exports = {
  solidity: "0.8.20",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {},
    sepolia: {
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: "854QAECYAM5QGWEDDZBW48PPXBGXEIUVG4",
  },
};