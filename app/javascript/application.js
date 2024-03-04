import "@popperjs/core";
import "bootstrap";
import "jquery";

const element = document.getElementById('citizen_phone');
const maskOptions = {
  mask: '+00 00 000000000'
};
const mask = IMask(element, maskOptions);

const phone_number = document.getElementById('citizen_address_attributes_cep');
phone_number.addEventListener("mouseleave", completeAddress);

function completeAddress() {
  $.ajax({
   method: "POST",
   url: "/geocode",
   data: { cep: phone_number.value },
   success: function(result) {
     document.getElementById('citizen_address_attributes_city').value = result.city;
     document.getElementById('citizen_address_attributes_state').value = result.state;
     document.getElementById('citizen_address_attributes_neighborhood').value = result.neighborhood;
     document.getElementById('citizen_address_attributes_street').value = result.street;
   }
  })
}
