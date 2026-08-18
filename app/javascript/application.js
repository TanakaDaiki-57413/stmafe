import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:submit-end", (event) => {
  if (event.detail.success) {
    const errorMessages = document.getElementById("error_messages")

    if (errorMessages) {
      errorMessages.remove()
    }

  }
})