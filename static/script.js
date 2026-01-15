function updateClock() {
  const el = document.getElementById('clock');
  if (!el) return;
  const now = new Date();
  el.textContent = now.toLocaleString();
}

document.addEventListener('DOMContentLoaded', () => {
  updateClock();
  setInterval(updateClock, 1000);

  const yearEl = document.getElementById('yearCopy');
  if (yearEl) yearEl.textContent = new Date().getFullYear();
});


// 👇 Inside FullCalendar initialization
eventClick: function(info) {
  const event = info.event;
  const description = event.extendedProps.description || 'No details';

  if (event.extendedProps.type === 'holiday') {
    document.getElementById('holidayModalBody').innerText = description;
    var modal = new bootstrap.Modal(document.getElementById('holidayModal'));
    modal.show();
  } else {
    alert("📝 " + description);
  }
}

fetch("/update-leave-status", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ id: leaveId, status: status })
})

document.addEventListener("DOMContentLoaded", () => {
  if (window.location.search.includes("added=true")) {
    const modalEl = document.getElementById("manageDepartmentModal");
    const modal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
    modal.hide();
  }
});


