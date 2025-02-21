// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
module.exports = [
  {
    type: 'input',
    name: 'widgets',
    message: 'Write the name of widgets in comma separated values.',
    result: (data) => {
      if (!data) return [];
      const parsed = data.split(',');
      return parsed;
    },
  },
];


