import places from 'places.js';
const initAutocomplete = () => {
const addressInput = document.getElementById('booking_address_client');
if (addressInput) {
places({ container: addressInput });
}
};
export { initAutocomplete };