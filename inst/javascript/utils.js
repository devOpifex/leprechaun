import 'shiny';
import 'jquery';

const hookUtils = () => {
	Shiny.addCustomMessageHandler('leprechaun-show', (msg) => {
		$(msg.selector).show();
	});
	
	Shiny.addCustomMessageHandler('leprechaun-hide', (msg) => {
		$(msg.selector).hide();
	});
	
	Shiny.addCustomMessageHandler('leprechaun-toggle', (msg) => {
		$(msg.selector).toggle();
	});
}