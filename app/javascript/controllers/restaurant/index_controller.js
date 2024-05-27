import { Controller } from "@hotwired/stimulus";
import { createSpinner } from "../../utilities";

// Connects to data-controller="restaurant--index"
export default class extends Controller {
  apiUrl = "/";
  headers = { Accept: "text/vnd.turbo-stream.html" };
  interval;

  connect() {
    this.interval = setInterval(async () => {
      const icons = document.querySelectorAll("i.bi-circle-fill");
      icons.forEach((el) => el.replaceWith(createSpinner()));

      const response = await fetch(this.apiUrl, { headers: this.headers });
      const text = await response.text();
      Turbo.renderStreamMessage(text);
    }, 30000);
  }

  disconnect() {
    clearInterval(this.interval);
  }
}
