export function createSpinner() {
  const spinner = document.createElement("div");
  spinner.classList.add("spinner-grow-sm", "spinner-grow", "text-primary");
  spinner.role = "status";

  const span = document.createElement("span");
  span.classList.add("visually-hidden");
  span.innerText = "Loading...";

  spinner.appendChild(span);

  return spinner;
}
