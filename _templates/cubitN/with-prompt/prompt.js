// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
// Example
// Search:Hotel:list,Initiate:HotelBookingInitiate:initiate,Booking:HotelBooking:booking
module.exports = [
  {
    type: 'input',
    name: 'args',
    message: "Write consumable model name",
    result: (data) => {
      return data.split(',').map((v) => {
        const split = v.split(':');
        return {
          module: split[0],
          model: split[1],
          state: split[2],
        };
      });
    }
  }
]
