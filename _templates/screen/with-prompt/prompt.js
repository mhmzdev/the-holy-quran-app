// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
module.exports = [
  {
    type: 'confirm',
    name: 'state',
    default: false,
    message: "Do you want provider with new screen ?"
  },
  {
    type: 'confirm',
    name: 'devData',
    default: false,
    message: "Do you want Dev data with new screen ?"
  }
]
