// Example interactivity

// Highlight row when checkbox is checked
document.querySelectorAll('tbody input[type="checkbox"]').forEach(checkbox => {
  checkbox.addEventListener('change', function() {
    if (this.checked) {
      this.closest('tr').style.background = '#1e293b';
    } else {
      this.closest('tr').style.background = 'transparent';
    }
  });
});


// Table search functionality
const searchInput = document.getElementById("tableSearch");
const rows = document.querySelectorAll("tbody tr");

searchInput.addEventListener("keyup", function () {
  const query = this.value.toLowerCase();

  rows.forEach(row => {
    const rowText = row.innerText.toLowerCase();
    if (rowText.includes(query)) {
      row.style.display = "";
    } else {
      row.style.display = "none";
    }
  });
});

// Select/Deselect all checkboxes
const selectAll = document.getElementById("selectAll");
const rowCheckboxes = document.querySelectorAll("tbody input[type='checkbox']");

selectAll.addEventListener("change", function () {
  rowCheckboxes.forEach(cb => {
    cb.checked = selectAll.checked;
    cb.closest("tr").style.background = selectAll.checked ? "#1e293b" : "transparent";
  });
});
