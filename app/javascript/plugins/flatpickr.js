import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {enableTime: true, dateFormat: "d-m-Y H:i", minTime: "09:00", maxTime: "18:00", minDate: "today"});
}

export { initFlatpickr };

