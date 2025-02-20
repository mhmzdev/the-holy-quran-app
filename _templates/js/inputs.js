const dataModelName = {
    type: 'input',
    name: 'model',
    message: "Write consumable model name"
};

const nestedModule = {
  type: 'input',
  name: 'args',
  message: 'Write args in module:model in comma separated values',
  result: (data) => {
    return data.split(',').map((v) => {
      const split = v.split(':');
      return {
        module: split[0],
        model: split[1],
        state: split[2],
      };
    });
  },
};

const screenName = {
  type: 'input',
  name: 'screen',
  message: 'Enter the screen name!',
};

const screenCrudUI = {
  type: 'input',
  name: 'arg',
  message: 'Write args in cubit:module:state format',
  result: (data) => {
    const split = data.split(':');
    return {
      cubit: split[0],
      module: split[1],
      state: split[2],
    };
  },
};







module.exports = { dataModelName, nestedModule, screenName, screenCrudUI };